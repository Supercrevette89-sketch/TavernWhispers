-- TavernWhispers : correcteur orthographique FR / EN (hors ligne)
-- Dictionnaires : Dict_fr.lua / Dict_en.lua (chargés à la demande).
-- Corrige : accents oubliés, fautes de frappe (1 lettre), mots collés, élisions (jai -> j'ai),
-- abréviations SMS (slt, bjr, mrc...). Ne touche jamais aux liens, icônes, :emojis:, noms propres.

TavernWhispers = TavernWhispers or {}
local TW = TavernWhispers

----------------------------------------------------------------------
-- Utilitaires
----------------------------------------------------------------------
local ACCENTS = {
  { "\195\169", "e" }, { "\195\168", "e" }, { "\195\170", "e" }, { "\195\171", "e" },
  { "\195\160", "a" }, { "\195\162", "a" }, { "\195\174", "i" }, { "\195\175", "i" },
  { "\195\180", "o" }, { "\195\185", "u" }, { "\195\187", "u" }, { "\195\167", "c" },
}

local function Deaccent(s)
  for _, p in ipairs(ACCENTS) do s = s:gsub(p[1], p[2]) end
  return s
end

local function Chars(s)
  local t = {}
  for c in s:gmatch("[%z\1-\127\194-\244][\128-\191]*") do t[#t + 1] = c end
  return t
end

local function Capitalize(s)
  if s:byte(1) and s:byte(1) < 128 then return s:sub(1, 1):upper() .. s:sub(2) end
  return s
end

local ALPHA = {
  fr = Chars("abcdefghijklmnopqrstuvwxyz\195\169\195\168\195\170\195\171\195\160\195\162\195\174\195\175\195\180\195\185\195\187\195\167"),
  en = Chars("abcdefghijklmnopqrstuvwxyz"),
}

----------------------------------------------------------------------
-- Dictionnaires (construits à la première utilisation)
----------------------------------------------------------------------
local built = {}

local function Build(lang)
  local b = built[lang]
  if b then return b end
  local src = (lang == "fr") and TW.DictFR or TW.DictEN
  local rank, plain, i = {}, {}, 0
  for w in (src or ""):gmatch("[^\n]+") do
    i = i + 1
    if not rank[w] then rank[w] = i end
    if lang == "fr" then
      local d = Deaccent(w)
      if d ~= w and not plain[d] then plain[d] = w end
    end
  end
  b = { rank = rank, plain = plain, alpha = ALPHA[lang], n = i }
  built[lang] = b
  return b
end

function TW.SpellWarm()
  Build("fr")
  Build("en")
end

local function Known(lw)
  return Build("fr").rank[lw] or Build("en").rank[lw]
end

----------------------------------------------------------------------
-- Abréviations et fautes courantes
----------------------------------------------------------------------
local SMS = {
  fr = {
    slt = "salut", bjr = "bonjour", bsr = "bonsoir", mrc = "merci", pk = "pourquoi", pq = "pourquoi",
    tt = "tout", tjs = "toujours", tjrs = "toujours", jsp = "je sais pas", tkt = "t'inqui\195\168te",
    dsl = "d\195\169sol\195\169", qd = "quand", pr = "pour", ds = "dans", pcq = "parce que", pck = "parce que",
    rdv = "rendez-vous", mtn = "maintenant", bcp = "beaucoup", vrmt = "vraiment", tlm = "tout le monde",
    ptet = "peut-\195\170tre", chui = "je suis", chuis = "je suis", ya = "il y a",
    ca = "\195\167a", jai = "j'ai", cest = "c'est", jsuis = "je suis", jveux = "je veux", jpeux = "je peux",
    jvais = "je vais", jsais = "je sais", quil = "qu'il", quon = "qu'on", jaime = "j'aime", aujourdhui = "aujourd'hui",
  },
  en = {
    u = "you", ur = "your", r = "are", cuz = "because", coz = "because", bc = "because", ppl = "people",
    w8 = "wait", gr8 = "great", thru = "through",
    im = "I'm", ive = "I've", dont = "don't", cant = "can't", wont = "won't", didnt = "didn't",
    isnt = "isn't", doesnt = "doesn't", thats = "that's", whats = "what's", youre = "you're",
    teh = "the", wich = "which", recieve = "receive", becuase = "because", definately = "definitely",
    thier = "their", helo = "hello", alot = "a lot", wanna = "wanna",
  },
}

local PHRASES = {
  fr = {
    { "sa va", "\195\167a va" }, { "sa marche", "\195\167a marche" }, { "c est", "c'est" }, { "j ai", "j'ai" },
    { "je c", "je sais" }, { "jle", "je le" },
  },
  en = {},
}

local ELISION = {
  j = { "j'", "je " }, t = { "t'", "tu " }, m = { "m'", "me " }, l = { "l'", "le " },
  d = { "d'", "de " }, c = { "c'", "ce " }, s = { "s'", "se " }, n = { "n'", "ne " },
}

----------------------------------------------------------------------
-- Suggestion pour un mot inconnu
----------------------------------------------------------------------
local function Suggest(lw, lang, strict)
  local D = Build(lang)
  if D.rank[lw] then return nil end

  if lang == "fr" then
    local p = D.plain[lw]
    if p then return p end
    -- élisions collées : jai -> j'ai, jsuis -> je suis, cest -> c'est
    local e = ELISION[lw:sub(1, 1)]
    local rest = lw:sub(2)
    local restForm = (D.rank[rest] and D.rank[rest] < 8000 and rest) or D.plain[rest]
    if e and #rest >= 2 and restForm then
      rest = restForm
      if rest:match("^[aeiouyh]") or rest:match("^\195[\162\168\169\170\174\180\187]") then
        return e[1] .. rest
      end
      return e[2] .. rest
    end
  end

  local ch = Chars(lw)
  local n = #ch
  if n < 3 then return nil end

  -- distance d'édition 1 : suppression, échange, remplacement, insertion
  local best, bestR
  local function consider(s)
    local r = D.rank[s]
    if r and (not bestR or r < bestR) then best, bestR = s, r end
  end
  for i = 1, n do
    local pre = table.concat(ch, "", 1, i - 1)
    local suf = table.concat(ch, "", i + 1, n)
    consider(pre .. suf)
    if i < n then consider(pre .. ch[i + 1] .. ch[i] .. table.concat(ch, "", i + 2, n)) end
    for _, a in ipairs(D.alpha) do
      if a ~= ch[i] then consider(pre .. a .. suf) end
    end
  end
  for i = 1, n + 1 do
    local pre = table.concat(ch, "", 1, i - 1)
    local suf = table.concat(ch, "", i, n)
    for _, a in ipairs(D.alpha) do consider(pre .. a .. suf) end
  end
  if best and bestR <= (strict and 4000 or 25000) then return best end
  if strict then return nil end

  -- mots collés : "jesuis" -> "je suis"
  if n >= 5 then
    local bestSplit, bestScore
    for i = 2, n - 2 do
      local a, b = table.concat(ch, "", 1, i), table.concat(ch, "", i + 1, n)
      local ra, rb = D.rank[a], D.rank[b]
      if ra and rb and ra < 3000 and rb < 8000 then
        local score = ra + rb
        if not bestScore or score < bestScore then bestScore, bestSplit = score, a .. " " .. b end
      end
    end
    if bestSplit then return bestSplit end
  end
  return nil
end

----------------------------------------------------------------------
-- Correction d'un texte complet
-- lang = langue principale ("fr" ou "en"). Retourne (texte corrigé, nombre de corrections)
----------------------------------------------------------------------
function TW.Correct(text, lang, strict)
  if not text or text == "" or text:sub(1, 1) == "/" then return text, 0 end
  lang = (lang == "en") and "en" or "fr"
  local changes = 0

  local saved = {}
  local function protect(s)
    saved[#saved + 1] = s
    return "\1" .. string.rep("\2", #saved) .. "\3"
  end
  text = text:gsub("|c%x%x%x%x%x%x%x%x|H.-|h.-|h|r", protect)
  text = text:gsub("{%w+}", protect)
  text = text:gsub(":[%a%d_]+:", protect)

  for _, pr in ipairs(PHRASES[lang]) do
    local a, b = pr[1], pr[2]
    local function sub(from, to)
      local n
      text, n = text:gsub("%f[%a]" .. from .. "%f[%A]", to)
      changes = changes + n
    end
    sub(a, b)
    sub(Capitalize(a), Capitalize(b))
  end

  local out, pos, n = {}, 1, #text
  local atStart = true
  while pos <= n do
    local s, e = text:find("^[%a\128-\255][%a\128-\255']*", pos)
    if not s then
      local ch = text:sub(pos, pos)
      out[#out + 1] = ch
      if ch == "." or ch == "!" or ch == "?" or ch == "\n" then atStart = true end
      pos = pos + 1
    else
      local word = text:sub(s, e)
      pos = e + 1
      local lw = word:lower()
      local result = word

      local sms = SMS[lang][lw]
      if sms then
        result = (word:match("^%u") and Capitalize(sms)) or sms
        changes = changes + 1
      else
        local chars = #Chars(lw)
        local isCap = word:match("^%u") ~= nil
        local mixed = word:match("^.[%a\128-\255]*%u") ~= nil -- majuscule au milieu / tout en majuscules
        local skip = chars <= 2 or mixed or (isCap and not atStart)

        if not skip then
          if lw:find("'", 1, true) then
            -- élisions : on ne vérifie que les segments de 3 lettres et plus
            if lang == "fr" then
              local parts = {}
              local modified = false
              for seg, sep in (lw .. "'"):gmatch("([^']*)(')") do
                local fixed = seg
                if #Chars(seg) >= 4 and not Known(seg) then
                  local sug = Suggest(seg, "fr", strict)
                  if sug then fixed = sug; modified = true end
                end
                parts[#parts + 1] = fixed
              end
              if modified then
                result = table.concat(parts, "'")
                if isCap then result = Capitalize(result) end
                changes = changes + 1
              end
            end
          elseif not Known(lw) then
            local sug = Suggest(lw, lang, strict)
            if not sug then
              -- l'autre langue peut avoir une meilleure suggestion (ex. accents FR quand la langue est EN)
              sug = nil
            end
            if sug and sug ~= lw then
              result = isCap and Capitalize(sug) or sug
              changes = changes + 1
            end
          end
        end
      end
      out[#out + 1] = result
      atStart = false
    end
  end

  local res = table.concat(out)
  res = res:gsub("\1(\2+)\3", function(s) return saved[#s] end)
  return res, changes
end
