-- TavernWhispers : détection de la langue + traduction des messages reçus (hors ligne)
-- Langues lues : français, anglais, allemand, espagnol, portugais, italien, russe.
-- Méthode : glossaire mot à mot vers l'anglais (langue pivot), puis anglais -> français si besoin.
-- C'est une aide à la compréhension, pas une traduction littéraire.

TavernWhispers = TavernWhispers or {}
local TW = TavernWhispers

----------------------------------------------------------------------
-- Utilitaires UTF-8
----------------------------------------------------------------------
local function LowerU(s)
  s = s:lower()
  s = s:gsub("\195([\128-\158])", function(b)
    if b ~= "\151" then return "\195" .. string.char(b:byte() + 32) end
  end)
  s = s:gsub("\208([\144-\159])", function(b) return "\208" .. string.char(b:byte() + 32) end)
  s = s:gsub("\208([\160-\175])", function(b) return "\209" .. string.char(b:byte() - 32) end)
  s = s:gsub("\208\129", "\209\145")
  return s
end

local DEACC = {
  { "\195\161", "a" }, { "\195\160", "a" }, { "\195\162", "a" }, { "\195\164", "a" }, { "\195\163", "a" }, { "\195\165", "a" },
  { "\195\169", "e" }, { "\195\168", "e" }, { "\195\170", "e" }, { "\195\171", "e" },
  { "\195\173", "i" }, { "\195\172", "i" }, { "\195\174", "i" }, { "\195\175", "i" },
  { "\195\179", "o" }, { "\195\178", "o" }, { "\195\180", "o" }, { "\195\182", "o" }, { "\195\181", "o" },
  { "\195\186", "u" }, { "\195\185", "u" }, { "\195\187", "u" }, { "\195\188", "u" },
  { "\195\177", "n" }, { "\195\167", "c" }, { "\195\159", "ss" }, { "\209\145", "\208\181" },
}
local function Deaccent(s)
  for _, p in ipairs(DEACC) do s = s:gsub(p[1], p[2]) end
  return s
end

local function CapFirst(s)
  local b = s:byte(1)
  if b and b < 128 then return s:sub(1, 1):upper() .. s:sub(2) end
  return s
end

----------------------------------------------------------------------
-- Glossaires par langue (construits à la demande)
----------------------------------------------------------------------
local built = {}
local SUFFIX = {
  de = { "en", "er", "es", "em", "e", "n", "s", "t", "st" },
  es = { "es", "s", "mos", "n" },
  pt = { "es", "s", "mos" },
}
local INFINITIVE = {
  de = { "en", "n" },
  es = { "ar", "er", "ir" },
  pt = { "ar", "er", "ir" },
}

local function Build(lang)
  local b = built[lang]
  if b then return b end
  local map, maxN = {}, 1
  for line in ((TW.LangGloss and TW.LangGloss[lang]) or ""):gmatch("[^\n]+") do
    local k, v = line:match("^(.-)|(.*)$")
    if k and k ~= "" then
      if map[k] == nil then map[k] = v end
      local dk = Deaccent(LowerU(k))
      if map[dk] == nil then map[dk] = v end
      local _, sp = k:gsub(" ", "")
      if sp + 1 > maxN then maxN = sp + 1 end
    end
  end
  b = { map = map, maxN = math.min(maxN, 4) }
  built[lang] = b
  return b
end

local function Lookup(b, w, lang)
  local m = b.map
  local v = m[w]
  if v then return v end
  local lw = LowerU(w)
  v = m[lw]
  if v then return v end
  if lang == "de" then
    v = m[CapFirst(lw)]
    if v then return v end
  end
  local dw = Deaccent(lw)
  if dw ~= lw then
    v = m[dw]
    if v then return v end
  end
  -- formes conjuguées / pluriels : on retire une terminaison courante
  local suf = SUFFIX[lang]
  if suf and #lw >= 5 then
    for _, sx in ipairs(suf) do
      if lw:sub(-#sx) == sx then
        local stem = lw:sub(1, #lw - #sx)
        if #stem >= 4 then
          v = m[stem] or (lang == "de" and m[CapFirst(stem)])
          if v then return v end
          for _, inf in ipairs(INFINITIVE[lang] or {}) do
            v = m[stem .. inf] or (lang == "de" and m[CapFirst(stem .. inf)])
            if v then return v end
          end
        end
      end
    end
  end
  return nil
end

----------------------------------------------------------------------
-- Traduction mot à mot vers l'anglais
-- Retourne (texte anglais, part des mots traduits entre 0 et 1)
----------------------------------------------------------------------
function TW.Gloss(text, lang)
  if not text or text == "" or not (TW.LangGloss and TW.LangGloss[lang]) then return nil, 0 end
  local b = Build(lang)

  local saved = {}
  local function protect(s)
    saved[#saved + 1] = s
    return "\1" .. string.rep("\2", #saved) .. "\3"
  end
  text = text:gsub("|c%x%x%x%x%x%x%x%x|H.-|h.-|h|r", protect)
  text = text:gsub("{%w+}", protect)
  text = text:gsub(":[%a%d_]+:", protect)

  local parts, pos, n = {}, 1, #text
  while pos <= n do
    local s, e = text:find("^[%a\128-\255][%a\128-\255']*", pos)
    if s then
      parts[#parts + 1] = { w = text:sub(s, e) }
      pos = e + 1
    else
      parts[#parts + 1] = { p = text:sub(pos, pos) }
      pos = pos + 1
    end
  end

  local out, i, np = {}, 1, #parts
  local words, hit = 0, 0
  local atStart = true
  while i <= np do
    local part = parts[i]
    if part.w then
      local result, nparts, nw
      for len = b.maxN, 2, -1 do
        local ws, j, ok = {}, i, true
        for k = 1, len do
          local pj = parts[j]
          if not pj or not pj.w then ok = false break end
          ws[k] = LowerU(pj.w)
          if k < len then
            local gap = parts[j + 1]
            if gap and gap.p == " " then j = j + 2 else ok = false break end
          end
        end
        if ok then
          local key = table.concat(ws, " ")
          local v = b.map[key] or b.map[Deaccent(key)]
          if v then
            result, nparts, nw = v, j - i + 1, len
            break
          end
        end
      end
      if not result then
        result = Lookup(b, part.w, lang)
        nparts, nw = 1, 1
      end
      words = words + nw
      if result then
        hit = hit + nw
        if atStart then result = CapFirst(result) end
        out[#out + 1] = result
      else
        out[#out + 1] = part.w
      end
      i = i + nparts
      atStart = false
    else
      out[#out + 1] = part.p
      if part.p == "." or part.p == "!" or part.p == "?" or part.p == "\n" then atStart = true end
      i = i + 1
    end
  end

  local res = table.concat(out)
  res = res:gsub("  +", " "):gsub("^ +", "")
  res = res:gsub("\1(\2+)\3", function(s) return saved[#s] end)
  local cov = (words > 0) and (hit / words) or 0
  if cov > 1 then cov = 1 end
  return res, cov
end

----------------------------------------------------------------------
-- Détection de la langue
----------------------------------------------------------------------
local ORDER = { "en", "fr", "de", "es", "pt", "it" }
local detSets

local function Sets()
  if detSets then return detSets end
  detSets = {}
  for lang, str in pairs(TW.LangWords or {}) do
    local set = {}
    for w in str:gmatch("%S+") do set[w] = true end
    detSets[lang] = set
  end
  return detSets
end

-- retourne "fr" / "en" / "de" / "es" / "pt" / "it" / "ru" ou nil
function TW.DetectLang(text, prefer)
  if not text or text == "" then return nil end
  local t = text:gsub("|c%x%x%x%x%x%x%x%x|H.-|h.-|h|r", " "):gsub("{%w+}", " "):gsub(":[%a%d_]+:", " ")

  local cyr = 0
  for _ in t:gmatch("[\208\209][\128-\191]") do cyr = cyr + 1 end
  local asc = select(2, t:gsub("%a", ""))
  if cyr >= 2 and cyr >= asc then return "ru" end

  local sets = Sets()
  local score = {}
  for w in t:gmatch("[%a\128-\255']+") do
    local lw = LowerU(w)
    local dw = Deaccent(lw)
    for lang, set in pairs(sets) do
      if set[lw] or set[dw] then score[lang] = (score[lang] or 0) + 1 end
    end
  end

  local best, bestScore = nil, 0
  for _, lang in ipairs(ORDER) do
    local s = score[lang] or 0
    if s > bestScore then
      best, bestScore = lang, s
    elseif s == bestScore and s > 0 and lang == prefer then
      best = lang
    end
  end
  return best
end

----------------------------------------------------------------------
-- Traduction automatique d'un message reçu vers ma langue (fr ou en)
-- Retourne (texte traduit, langue détectée) ou nil si rien à traduire
----------------------------------------------------------------------
function TW.AutoTranslate(text, target)
  target = (target == "en") and "en" or "fr"
  local src = TW.DetectLang(text, target)
  if not src or src == target then return nil, src end

  local prepared = text
  if TW.Correct and (src == "fr" or src == "en") then
    local ok, fixed = pcall(TW.Correct, text, src, true) -- corrections très prudentes
    if ok and fixed and fixed ~= "" then prepared = fixed end
  end

  local out
  if src == "fr" then
    out = TW.Translate(prepared, "fren")
  elseif src == "en" then
    out = TW.Translate(prepared, "enfr")
  else
    local gloss, cov = TW.Gloss(text, src)
    if not gloss or cov < 0.4 then return nil, src end
    out = (target == "fr") and TW.Translate(gloss, "enfr") or gloss
  end
  if not out or out:lower() == text:lower() then return nil, src end
  return out, src
end

----------------------------------------------------------------------
-- Écrire dans la langue de l'autre : français/anglais -> de/es/it/pt/ru
-- Méthode : texte -> anglais (pivot), puis glossaire inversé mot à mot.
-- Très approximatif (pas de grammaire), mais utile pour dépanner.
----------------------------------------------------------------------
TW.OUT_LANGS = { "de", "es", "it", "pt", "ru" }

local rev = {}
local function BuildRev(lang)
  local r = rev[lang]
  if r then return r end
  local map, maxN = {}, 1
  for line in ((TW.LangGloss and TW.LangGloss[lang]) or ""):gmatch("[^\n]+") do
    local k, v = line:match("^(.-)|(.*)$")
    if k and k ~= "" and v and v ~= "" and not v:find("[%(%)/]") then
      local lv = v:lower()
      local cur = map[lv]
      -- on préfère la première entrée (fréquente), mais un mot seul plutôt qu'une expression
      if cur == nil or (cur:find(" ") and not k:find(" ")) then map[lv] = k end
      local _, sp = v:gsub(" ", "")
      if sp + 1 > maxN then maxN = sp + 1 end
    end
  end
  r = { map = map, maxN = math.min(maxN, 4) }
  rev[lang] = r
  return r
end

local function EnStems(w)
  local c = {}
  local function add(s) if #s >= 2 then c[#c + 1] = s end end
  if w:sub(-3) == "ies" then add(w:sub(1, -4) .. "y") end
  if w:sub(-2) == "es" then add(w:sub(1, -3)) end
  if w:sub(-1) == "s" then add(w:sub(1, -2)) end
  if w:sub(-3) == "ing" then
    local s = w:sub(1, -4)
    add(s); add(s .. "e")
    if s:sub(-1) == s:sub(-2, -2) then add(s:sub(1, -2)) end
  end
  if w:sub(-2) == "ed" then
    local s = w:sub(1, -3)
    add(s); add(s .. "e")
    if s:sub(-1) == s:sub(-2, -2) then add(s:sub(1, -2)) end
  end
  if w:sub(-2) == "'s" then add(w:sub(1, -3)) end
  return c
end

-- Retourne (texte, couverture 0..1)
function TW.FromEnglish(text, lang)
  if not text or text == "" or not (TW.LangGloss and TW.LangGloss[lang]) then return nil, 0 end
  local b = BuildRev(lang)

  -- normalisation de l'anglais : contractions, auxiliaires sans équivalent
  text = text:gsub("[\226\128\153]", "'")
  local CONTR = { ["i'm"] = "I am", ["you're"] = "you are", ["we're"] = "we are", ["they're"] = "they are",
    ["it's"] = "it is", ["he's"] = "he is", ["she's"] = "she is", ["that's"] = "that is", ["there's"] = "there is",
    ["i've"] = "I have", ["we've"] = "we have", ["you've"] = "you have", ["i'll"] = "I will", ["we'll"] = "we will",
    ["you'll"] = "you will", ["i'd"] = "I would", ["can't"] = "cannot", ["won't"] = "will not", ["don't"] = "do not",
    ["doesn't"] = "does not", ["didn't"] = "did not", ["isn't"] = "is not", ["aren't"] = "are not",
    ["wasn't"] = "was not", ["let's"] = "let us", ["what's"] = "what is", ["where's"] = "where is" }
  text = text:gsub("%a+'%a+", function(w) return CONTR[w:lower()] end)
  text = text:gsub("([%.%?!,]?) *[Dd]o you ", "%1 you ")
  text = text:gsub("^[Dd]o you ", "you ")
  text = text:gsub("[Dd]o not", "not")
  text = text:gsub("^ +", "")
  -- forme progressive : "I am looking" -> "I look"
  text = text:gsub("([Ii]) am (%a+ing)", "%1 %2")
  text = text:gsub("([Yy]ou) are (%a+ing)", "%1 %2")
  text = text:gsub("([Ww]e) are (%a+ing)", "%1 %2")
  text = text:gsub("([Tt]hey) are (%a+ing)", "%1 %2")
  text = text:gsub(" to do ", " to ")

  local saved = {}
  local function protect(s)
    saved[#saved + 1] = s
    return "\1" .. string.rep("\2", #saved) .. "\3"
  end
  text = text:gsub("|c%x%x%x%x%x%x%x%x|H.-|h.-|h|r", protect)
  text = text:gsub("{%w+}", protect)
  text = text:gsub(":[%a%d_]+:", protect)
  text = text:gsub("%[[^%]]*%]", protect)

  local parts, pos, n = {}, 1, #text
  while pos <= n do
    local s, e = text:find("^[%a][%a']*", pos)
    if s then
      parts[#parts + 1] = { w = text:sub(s, e) }
      pos = e + 1
    else
      parts[#parts + 1] = { p = text:sub(pos, pos) }
      pos = pos + 1
    end
  end

  local out, i, np = {}, 1, #parts
  local words, hit = 0, 0
  local atStart = true
  while i <= np do
    local part = parts[i]
    if part.w then
      local result, nparts, nw
      for len = b.maxN, 2, -1 do
        local ws, ok, j = {}, true, i
        for k = 1, len do
          local pj = parts[j]
          if not pj or not pj.w then ok = false break end
          ws[k] = pj.w:lower()
          if k < len then
            local gap = parts[j + 1]
            if gap and gap.p == " " then j = j + 2 else ok = false break end
          end
        end
        if ok then
          local v = b.map[table.concat(ws, " ")]
          if v then result, nparts, nw = v, j - i + 1, len break end
        end
      end
      if not result then
        local lw = part.w:lower()
        result = b.map[lw]
        if not result then
          for _, st in ipairs(EnStems(lw)) do
            result = b.map[st]
            if result then break end
          end
        end
        nparts, nw = 1, 1
      end
      words = words + nw
      if result then
        hit = hit + nw
        if atStart then result = CapFirst(result) end
        out[#out + 1] = result
      else
        out[#out + 1] = part.w
      end
      i = i + nparts
      atStart = false
    else
      out[#out + 1] = part.p
      if part.p == "." or part.p == "!" or part.p == "?" then atStart = true end
      i = i + 1
    end
  end

  local res = table.concat(out)
  res = res:gsub("  +", " "):gsub("^ +", "")
  res = res:gsub("\1(\2+)\3", function(s) return saved[#s] end)
  local cov = (words > 0) and (hit / words) or 0
  if cov > 1 then cov = 1 end
  return res, cov
end

-- code : "fren" | "enfr" | "de" | "es" | "it" | "pt" | "ru"
-- Retourne (texte, couverture) ou nil si impossible
function TW.TranslateOut(text, code)
  if not text or text == "" then return nil end
  if code == "fren" or code == "enfr" then
    if not TW.Translate then return nil end
    return TW.Translate(text, code), 1
  end
  local en = text
  local src = TW.DetectLang and TW.DetectLang(text, "fr")
  if src ~= "en" and TW.Translate then
    if TW.Correct and src == "fr" then
      local ok, fixed = pcall(TW.Correct, text, "fr", true)
      if ok and fixed and fixed ~= "" then en = fixed end
    end
    en = TW.Translate(en, "fren") or en
  end
  return TW.FromEnglish(en, code)
end
