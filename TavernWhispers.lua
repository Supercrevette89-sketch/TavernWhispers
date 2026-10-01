-- TavernWhispers : messagerie privée façon "messenger" aux couleurs de WoW Classic
-- Compatible Classic Era / SoD / TBC Anniversary / MoP Classic (API "modernes" des clients Classic)

local ADDON_NAME = ...

----------------------------------------------------------------------
-- Couche de compatibilité WotLK 3.3.5 (Ascension) : ajoute les fonctions
-- absentes du vieux client (SetSize, SetShown, SetColorTexture, C_Timer...)
----------------------------------------------------------------------
do
  local function AddMethods(obj)
    local mt = getmetatable(obj)
    local idx = mt and mt.__index
    if type(idx) ~= "table" then return end
    if not idx.SetSize and idx.SetWidth then
      idx.SetSize = function(self, w, h) self:SetWidth(w); self:SetHeight(h) end
    end
    if not idx.SetShown and idx.Show then
      idx.SetShown = function(self, v) if v then self:Show() else self:Hide() end end
    end
    if not idx.SetColorTexture and idx.SetTexture and idx.SetTexCoord then
      idx.SetColorTexture = function(self, r, g, b, a) self:SetTexture(r, g, b, a or 1) end
    end
    if not idx.SetWordWrap and idx.SetJustifyH and idx.SetFont then
      idx.SetWordWrap = function() end
    end
  end
  local probe = CreateFrame("Frame")
  AddMethods(probe)
  AddMethods(probe:CreateTexture())
  AddMethods(probe:CreateFontString())
  -- ATTENTION : ne jamais créer d'EditBox ici, elle prendrait le clavier (plus de déplacement / saut)
  for _, t in ipairs({ "Button", "ScrollFrame" }) do
    local fr = CreateFrame(t)
    AddMethods(fr)
    fr:Hide()
  end
  probe:Hide()
end

local After = (C_Timer and C_Timer.After) or (function()
  local timers = {}
  local f = CreateFrame("Frame")
  f:SetScript("OnUpdate", function(_, elapsed)
    for i = #timers, 1, -1 do
      local t = timers[i]
      t.left = t.left - elapsed
      if t.left <= 0 then
        table.remove(timers, i)
        t.fn()
      end
    end
  end)
  return function(delay, fn) timers[#timers + 1] = { left = delay, fn = fn } end
end)()

local Ambiguate = _G.Ambiguate or function(name) return (name:gsub("%-.*$", "")) end

----------------------------------------------------------------------
-- Localisation (fr / en)
----------------------------------------------------------------------
local function MakeL(isFR)
return {
  title    = isFR and "Chuchotements" or "Whispers",
  empty    = isFR and "Aucune conversation.\n\nTapez /tw Nom, ou clic droit sur un joueur > Chuchoter."
                    or "No conversation yet.\n\nType /tw Name, or right-click a player > Whisper.",
  bnet     = "Battle.net",
  char     = isFR and "Personnage" or "Character",
  lvl      = isFR and "Niv." or "Lvl",
  delHint  = isFR and "Maj + clic droit : supprimer la conversation" or "Shift + right-click: delete conversation",
  bnOff    = isFR and "Ce contact Battle.net est hors ligne ou introuvable." or "This Battle.net contact is offline or not found.",
  on       = isFR and "activé" or "on",
  off      = isFR and "désactivé" or "off",
  dateFmt  = isFR and "%d/%m/%Y" or "%m/%d/%Y",
  help     = isFR
    and "/tw : ouvrir/fermer | /tw Nom : ouvrir une conversation | /tw sound | /tw hide | /tw auto | /tw intercept | /tw clear"
    or  "/tw: toggle | /tw Name: open a conversation | /tw sound | /tw hide | /tw auto | /tw intercept | /tw clear",
  o_sound  = isFR and "Son de notification" or "Notification sound",
  o_hide   = isFR and "Masquer les chuchotements du chat par défaut" or "Hide whispers from default chat",
  o_auto   = isFR and "Ouvrir automatiquement à la réception" or "Auto-open on incoming whisper",
  o_inter  = isFR and "Intercepter 'Chuchoter' / Répondre (R)" or "Intercept 'Whisper' / Reply (R)",
  cleared  = isFR and "Toutes les conversations ont été supprimées." or "All conversations deleted.",
  trOff    = isFR and "Trad: off" or "Transl: off",
  trTipT   = isFR and "Traduction (glossaire hors ligne)" or "Translation (offline glossary)",
  trTip1   = isFR and "Clic : off > FR vers EN > EN vers FR" or "Click: off > FR to EN > EN to FR",
  trTip2   = isFR and "Entrée envoie la traduction, Ctrl+Entrée envoie votre texte tel quel."
                    or "Enter sends the translation, Ctrl+Enter sends your text as typed.",
  trTip3   = isFR and "Traduit les mots et expressions courants, pas les phrases complexes."
                    or "Translates common words and phrases, not complex sentences.",
  emoTip   = isFR and "Émoticônes" or "Emoticons",
  spellBtn = isFR and "Ortho" or "Spell",
  opacity  = isFR and "Opacité" or "Opacity",
  readBtn  = isFR and "Lire" or "Read",
  chatTitle = isFR and "Traduction · Chat" or "Translation · Chat",
  chatBtnLabel = isFR and "Traduction" or "Translation",
  archiveBtn = isFR and "Archives" or "Archives",
  backBtn  = isFR and "Retour" or "Back",
  archiveHint = isFR and "Clic droit : archiver (fermer) la conversation" or "Right-click: archive (close) the conversation",
  archiveTip = isFR and "Archiver cette conversation (l'historique est conservé)" or "Archive this conversation (history is kept)",
  deleteTip = isFR and "Supprimer définitivement" or "Delete permanently",
  archiveOpenTip = isFR and "Voir les conversations archivées. Un nouveau message la ramène dans la liste." or "Show archived conversations. A new message brings it back to the list.",
  spellTip3 = isFR and "Clic gauche : activer / désactiver. Clic droit : langue (auto, français, anglais)."
                     or "Left-click: on / off. Right-click: language (auto, French, English).",
  spellLangAuto = isFR and "Langue : automatique" or "Language: automatic",
  spellLangFr = isFR and "Langue : français" or "Language: French",
  spellLangEn = isFR and "Langue : anglais" or "Language: English",
  speakTipT = isFR and "Parler dans le chat" or "Speak in the chat",
  speakTip1 = isFR and "Écrivez ici : le message part dans le groupe, la guilde, /dire ou un canal, avec correction et traduction." or "Type here: the message goes to the party, guild, /say or a channel, with spell check and translation.",
  speakTip2 = isFR and "Bouton de gauche : où parler (clic pour changer). Bouton de droite : traduction FR>EN, EN>FR ou aucune."
                     or "Left button: where to speak (click to change). Right button: FR>EN, EN>FR or no translation.",
  speakTrOff = isFR and "Trad: off" or "Transl: off",
  spamBtn  = isFR and "Filtre" or "Filter",
  spamTitle = isFR and "Messages à masquer" or "Messages to hide",
  spamHint = isFR and "Un message qui contient un de ces mots n'apparaît plus dans cette fenêtre (vendeurs d'or, publicités...). x pour retirer un mot."
                    or "A message containing one of these words no longer shows in this window (gold sellers, ads...). x removes a word.",
  spamEmpty = isFR and "Aucun mot filtré." or "No filtered words.",
  learnOk = isFR and "Appris" or "Learned",
  learnHelp = isFR and "Usage : /tw learn en:big deal=grosse affaire   ou   /tw learn fr:grosse baffe=big slap   |   /tw learn list   |   /tw forget en:big deal"
                     or "Usage: /tw learn en:big deal=grosse affaire   or   /tw learn fr:grosse baffe=big slap   |   /tw learn list   |   /tw forget en:big deal",
  menuBtn  = isFR and "Menu" or "Menu",
  toolsBtn = isFR and "Outils" or "Tools",
  menuSpell = isFR and "Correcteur orthographique" or "Spell checker",
  menuOn   = isFR and "Activé" or "Enabled",
  menuLangAuto = isFR and "Langue : automatique" or "Language: automatic",
  menuLangFr = isFR and "Langue : français" or "Language: French",
  menuLangEn = isFR and "Langue : anglais" or "Language: English",
  menuTr   = isFR and "Traduire mes messages" or "Translate my messages",
  menuTrNone = isFR and "Aucune traduction" or "No translation",
  menuTrOut = isFR and "J'écris en français > envoi en %s" or "I write my language > send %s",
  menuTrAuto = isFR and "Répondre dans sa langue (auto)" or "Reply in their language (auto)",
  nmWhisper = isFR and "Chuchoter" or "Whisper",
  nmInvite = isFR and "Inviter en groupe" or "Invite to group",
  nmFriend = isFR and "Ajouter en ami" or "Add friend",
  nmIgnore = isFR and "Ignorer" or "Ignore",
  nmLevel = isFR and "Voir le niveau" or "View level",
  nmLevelUnk = isFR and "niveau inconnu (ciblez-le ou ajoutez-le en ami)" or "level unknown (target them or add as friend)",
  menuTrFrEn = isFR and "J'écris en français > envoi en anglais" or "I write French > send English",
  menuTrEnFr = isFR and "J'écris en anglais > envoi en français" or "I write English > send French",
  menuNoConv = isFR and "(ouvrez d'abord une conversation)" or "(open a conversation first)",
  menuRead = isFR and "Traduire les messages reçus" or "Translate received messages",
  menuReadFr = isFR and "En français" or "Into French",
  menuReadEn = isFR and "En anglais" or "Into English",
  menuReadOff = isFR and "Ne pas traduire" or "Do not translate",
  menuOpacity = isFR and "Opacité de la fenêtre" or "Window opacity",
  setBtn   = isFR and "Réglages" or "Settings",
  setTitle = isFR and "Réglages" or "Settings",
  secNotif = isFR and "Notifications" or "Notifications",
  secDnd   = isFR and "Ne pas déranger" or "Do not disturb",
  secMsgs  = isFR and "Messages automatiques" or "Automatic messages",
  dndLabel = isFR and "Ne pas déranger" or "Do not disturb",
  dndManual = isFR and "Ne pas déranger (je suis indisponible)" or "Do not disturb (I'm unavailable)",
  dndCombat = isFR and "Réponse automatique en combat" or "Auto-reply in combat",
  dndBG    = isFR and "Réponse auto en champ de bataille / arène" or "Auto-reply in battleground / arena",
  dndInst  = isFR and "Réponse auto en donjon / raid" or "Auto-reply in dungeon / raid",
  msgCombat = isFR and "En combat" or "In combat",
  msgBG    = isFR and "Champ de bataille / arène" or "Battleground / arena",
  msgInst  = isFR and "Donjon / raid" or "Dungeon / raid",
  msgDnd   = isFR and "Ne pas déranger" or "Do not disturb",
  setHint  = isFR and "« [Auto] » est ajouté au début du message. La réponse part dans la langue de votre interlocuteur (FR ou EN). Pendant un mode actif : pas de son, pas d'ouverture automatique."
                   or "\"[Auto]\" is added at the start. The reply is sent in your contact's language (FR or EN). While a mode is active: no sound, no auto-open.",
  muted    = isFR and "(muet)" or "(muted)",
  muteHint = isFR and "Ctrl + clic : couper / réactiver le son de ce contact" or "Ctrl + click: mute / unmute this contact",
  dndTip   = isFR and "Clic droit : Ne pas déranger" or "Right-click: Do not disturb",
  dndOnTip = isFR and "Mode indisponible ACTIF" or "Unavailable mode ON",
  alertBtn = isFR and "Alertes" or "Alerts",
  alertTitle = isFR and "Mots à surveiller" or "Words to watch",
  alertAdd = isFR and "Ajouter" or "Add",
  alertHint = isFR and "Un message qui contient un de ces mots est surligné et fait un bruit. Cliquez sur x pour retirer un mot."
                    or "A message containing one of these words is highlighted and makes a sound. Click x to remove a word.",
  alertSound = isFR and "Son d'alerte" or "Alert sound",
  alertPrint = isFR and "Écrire aussi dans le chat" or "Also print in the chat",
  alertEmpty = isFR and "Aucun mot pour l'instant." or "No words yet.",
  alertMax = isFR and "Maximum 15 mots." or "Maximum 15 words.",
  alertWord = isFR and "Alerte" or "Alert",
  cParty   = isFR and "Groupe" or "Party",
  cChan    = isFR and "Canal" or "Channel",
  cGuild   = isFR and "Guilde" or "Guild",
  cSay     = isFR and "Dire" or "Say",
  cOnly    = isFR and "Traduits" or "Foreign",
  cAll     = isFR and "Tout" or "All",
  cClear   = isFR and "Vider" or "Clear",
  cLblParty = isFR and "Groupe" or "Party",
  cLblGuild = isFR and "Guilde" or "Guild",
  cLblSay  = isFR and "Dire" or "Say",
  cLblYell = isFR and "Crier" or "Yell",
  chatTipT = isFR and "Traduction du chat" or "Chat translation",
  chatTip1 = isFR and "Traduit ce que disent les autres joueurs : groupe / raid / champ de bataille, un canal, la guilde, /dire et /crier."
                    or "Translates what other players say: party / raid / battleground, a channel, guild, /say and /yell.",
  chanTip  = isFR and "Clic gauche : activer / désactiver. Clic droit : changer le numéro du canal (1 à 10)."
                    or "Left-click: on / off. Right-click: change the channel number (1 to 10).",
  modeTip  = isFR and "Traduits : n'affiche que les messages écrits dans une autre langue que la vôtre. Tout : affiche tous les messages."
                    or "Foreign: only shows messages written in another language than yours. All: shows every message.",
  chatBtnTip = isFR and "Traduction du chat (groupe, canal...)" or "Chat translation (party, channel...)",
  readTipT = isFR and "Traduire les messages reçus" or "Translate incoming messages",
  readTip1 = isFR and "Détecte la langue (FR, EN, allemand, espagnol, portugais, italien, russe) et affiche la traduction sous la bulle."
                    or "Detects the language (FR, EN, German, Spanish, Portuguese, Italian, Russian) and shows the translation under the bubble.",
  readTip2 = isFR and "Clic : FR > EN > désactivé. Traduction mot à mot hors ligne : elle aide à comprendre, sans être parfaite."
                    or "Click: FR > EN > off. Offline word-by-word translation: good for the gist, not perfect.",
  opacityTip = isFR and "Transparence de la fenêtre (le texte reste lisible)" or "Window transparency (text stays readable)",
  spellTipT = isFR and "Correcteur orthographique (hors ligne)" or "Spell checker (offline)",
  spellTip1 = isFR and "Corrige accents, fautes de frappe, mots collés et abréviations SMS (FR/EN)."
                     or "Fixes accents, typos, joined words and SMS shorthand (FR/EN).",
  spellTip2 = isFR and "La correction est appliquée à l'envoi. Tab : l'appliquer dans la saisie. Ctrl+Entrée : envoyer sans rien changer."
                     or "The fix is applied when sending. Tab: apply it in the box. Ctrl+Enter: send untouched.",
  spellPrefix = isFR and "Correction :" or "Fix:",
  o_spell  = isFR and "Correcteur orthographique" or "Spell checker",
  linkHint = isFR and "Clic : afficher le lien" or "Click: show link",
}
end

local isFR = true -- français par défaut ; /tw lang en pour l'anglais
local L = MakeL(isFR)
local function SetUILang(fr)
  isFR = fr and true or false
  local nl = MakeL(isFR)
  for k in pairs(L) do L[k] = nil end
  for k, v in pairs(nl) do L[k] = v end
end

----------------------------------------------------------------------
-- Palette "WoW Classic" : or, cuir, parchemin, rose chuchotement
----------------------------------------------------------------------
local C = {
  gold      = { 1.00, 0.82, 0.00 },
  parchment = { 0.95, 0.90, 0.75 },
  leather   = { 0.16, 0.10, 0.06, 0.96 },
  leatherEd = { 0.55, 0.42, 0.18, 1.00 },
  panel     = { 0.05, 0.035, 0.02, 0.85 },
  panelEd   = { 0.60, 0.50, 0.25, 1.00 },
}

local function SentColors()
  if UnitFactionGroup("player") == "Horde" then
    return { 0.36, 0.07, 0.05, 0.96 }, { 0.80, 0.22, 0.15, 1 }
  end
  return { 0.07, 0.17, 0.36, 0.96 }, { 0.30, 0.50, 0.85, 1 }
end

local BT = BackdropTemplateMixin and "BackdropTemplate" or nil

local PANEL_BD = {
  bgFile = "Interface\\Buttons\\WHITE8X8",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  edgeSize = 14,
  insets = { left = 4, right = 4, top = 4, bottom = 4 },
}
local BUBBLE_BD = {
  bgFile = "Interface\\Buttons\\WHITE8X8",
  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
  edgeSize = 12,
  insets = { left = 3, right = 3, top = 3, bottom = 3 },
}

----------------------------------------------------------------------
-- Constantes de layout
----------------------------------------------------------------------
local W, H = 700, 480
local MIN_W, MIN_H = 320, 240
local LIST_W = 210
local ROW_H = 44
local CHIP_H = 18
local MAX_RENDERED = 100
local CLASS_TEX = "Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES"
local UNKNOWN_TEX = "Interface\\Icons\\INV_Misc_QuestionMark"

----------------------------------------------------------------------
-- État
----------------------------------------------------------------------
local TW = _G.TavernWhispers or {}
_G.TavernWhispers = TW
TW.pending = {}

local db
local defaults = { sound = true, hideDefault = true, autoOpen = true, intercept = true, spell = true, opacity = 1, readLang = "auto", maxMsgs = 200 }

local rows, bubbles, seps = {}, {}, {}
local mainFrame, launcher, listChild, msgScroll, msgChild
local headerName, headerSub, headerIcon, emptyText, input, measure, preview, trBtn, emoPopup, spellBtn, spellLine
local listFrame, chatFrame, emoBtn, opacityBtn, opacityPopup, readBtn
local chatWin, chatPanel, chatSMF, chatLauncher, chatBtns
local settingsWin, optBtn, kwPopup, alertBtn, archBtn
local wanted = {} -- fenêtres que l'utilisateur veut garder ouvertes
local function Root() return TW.root or UIParent end

----------------------------------------------------------------------
-- Utilitaires
----------------------------------------------------------------------
local function Print(msg)
  print("|cffffd100TavernWhispers|r: " .. msg)
end

local EMO_PATH = "Interface\\AddOns\\TavernWhispers\\Emoji\\"
local EMOJI_LIST = {
  "smile", "grin", "joy", "rofl", "happy", "hearteyes", "love", "kiss", "cool", "wink",
  "tongue", "sweat", "angel", "think", "neutral", "roll", "worried", "surprised", "scream", "sad",
  "cry", "angry", "sleep", "facepalm", "shrug", "thumbsup", "thumbsdown", "clap", "ok", "wave",
  "pray", "muscle", "handshake", "eyes", "fire", "heart", "broken", "party", "skull", "hundred",
  "star", "check", "cross", "crown", "gem", "coin", "sword", "shield", "beer", "poop",
}
local EMO_SET = {}
for _, n in ipairs(EMOJI_LIST) do EMO_SET[n] = true end
-- smileys "classiques" tapés au clavier -> emoji
local EMOTICONS = {
  [":)"] = "happy", [":-)"] = "happy", ["^^"] = "happy", [":d"] = "grin", [":-d"] = "grin", ["xd"] = "joy",
  [";)"] = "wink", [";-)"] = "wink", [":p"] = "tongue", [":-p"] = "tongue", [":("] = "sad", [":-("] = "sad",
  [":'("] = "cry", [":o"] = "surprised", [":-o"] = "surprised", ["<3"] = "heart", [":/"] = "worried",
  [":-/"] = "worried", ["8)"] = "cool", ["b)"] = "cool", [":*"] = "kiss", [">:("] = "angry", ["o/"] = "wave",
}
local function EmoTag(name) return "|T" .. EMO_PATH .. name .. ".tga:18|t" end

local RAID = { star = 1, circle = 2, diamond = 3, triangle = 4, moon = 5, square = 6, cross = 7, x = 7, skull = 8 }
local function RaidIcon(n)
  return "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_" .. n .. ":16|t"
end

-- {rt1} / {star} -> icône inline
local function Decorate(text)
  text = text:gsub("{[rR][tT](%d)}", function(n)
    n = tonumber(n)
    if n >= 1 and n <= 8 then return RaidIcon(n) end
  end)
  text = text:gsub("{(%a+)}", function(k)
    local n = RAID[k:lower()]
    if n then return RaidIcon(n) end
  end)
  -- :joy: -> emoji ; ":)" -> emoji
  text = text:gsub(":([%a%d_]+):", function(name)
    if EMO_SET[name] then return EmoTag(name) end
  end)
  text = text:gsub("%S+", function(tok)
    local n = EMOTICONS[tok:lower()]
    if n then return EmoTag(n) end
  end)
  return text
end

local function Clean(text)
  text = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
  text = text:gsub("|H.-|h(.-)|h", "%1"):gsub("\n", " ")
  return Decorate(text)
end

local function ExtractLinks(text)
  local out = {}
  for full in text:gmatch("|c%x%x%x%x%x%x%x%x|H.-|h.-|h|r") do
    out[#out + 1] = { full = full, data = full:match("|H(.-)|h") }
    if #out >= 4 then break end
  end
  return out
end

local function NameColor(c)
  if c.bn then return 0.51, 0.77, 1.00 end
  local cc = c.class and RAID_CLASS_COLORS and RAID_CLASS_COLORS[c.class]
  if cc then return cc.r, cc.g, cc.b end
  return 1.00, 0.50, 1.00
end

local function ColorHex(r, g, b)
  return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
end

local function SetClassIcon(tex, class)
  local tc = class and CLASS_ICON_TCOORDS and CLASS_ICON_TCOORDS[class]
  if tc then
    tex:SetTexture(CLASS_TEX)
    tex:SetTexCoord(tc[1], tc[2], tc[3], tc[4])
  else
    tex:SetTexture(UNKNOWN_TEX)
    tex:SetTexCoord(0.07, 0.93, 0.07, 0.93)
  end
end

local function BNInfoByID(id)
  if not id then return end
  if C_BattleNet and C_BattleNet.GetAccountInfoByID then
    local info = C_BattleNet.GetAccountInfoByID(id)
    if info then return info.accountName, info.battleTag end
  elseif BNGetFriendInfoByID then
    local _, name, tag = BNGetFriendInfoByID(id)
    return name, tag
  end
end

local function ResolveBnetID(c)
  if not BNGetNumFriends then return c.bnetID end
  local n = BNGetNumFriends() or 0
  if C_BattleNet and C_BattleNet.GetFriendAccountInfo then
    for i = 1, n do
      local info = C_BattleNet.GetFriendAccountInfo(i)
      if info and ((c.tag and info.battleTag == c.tag) or info.accountName == c.name) then
        return info.bnetAccountID
      end
    end
  elseif BNGetFriendInfo then
    for i = 1, n do
      local id, name, tag = BNGetFriendInfo(i)
      if (c.tag and tag == c.tag) or name == c.name then return id end
    end
  end
  return c.bnetID
end

----------------------------------------------------------------------
-- Classe / niveau / zone du joueur
----------------------------------------------------------------------
local classByLoc = {}
for _, tbl in ipairs({ LOCALIZED_CLASS_NAMES_MALE or {}, LOCALIZED_CLASS_NAMES_FEMALE or {} }) do
  for token, name in pairs(tbl) do classByLoc[name] = token end
end

local function ApplyClass(conv, locName, token)
  if locName and locName ~= "" then
    conv.classLoc = locName
    token = token or classByLoc[locName]
  end
  if token then conv.class = token end
end

function TW:LookupInfo(conv)
  if not conv or conv.bn or not conv.name then return end
  local name = conv.name:lower()

  -- liste d'amis
  if GetFriendInfo then
    local n, lvl, cls, area, connected = GetFriendInfo(conv.name)
    if n then
      ApplyClass(conv, cls)
      conv.level, conv.zone = lvl, area
    end
  end
  if conv.class then return end

  -- guilde
  if IsInGuild and IsInGuild() and GetNumGuildMembers then
    for i = 1, (GetNumGuildMembers(true) or 0) do
      local n, _, _, lvl, cls, zone, _, _, _, _, token = GetGuildRosterInfo(i)
      if n and n:lower() == name then
        ApplyClass(conv, cls, token)
        conv.level, conv.zone = lvl, zone
        return
      end
    end
  end

  -- groupe / cible
  local units = { "target", "mouseover", "focus" }
  for i = 1, 4 do units[#units + 1] = "party" .. i end
  for i = 1, 40 do units[#units + 1] = "raid" .. i end
  for _, u in ipairs(units) do
    if UnitExists(u) and UnitIsPlayer(u) and (UnitName(u) or ""):lower() == name then
      local loc, token = UnitClass(u)
      ApplyClass(conv, loc, token)
      conv.level = UnitLevel(u)
      return
    end
  end
end

local function ClassLabel(c)
  if c.classLoc then return c.classLoc end
  if c.class then
    return (LOCALIZED_CLASS_NAMES_MALE and LOCALIZED_CLASS_NAMES_MALE[c.class]) or c.class
  end
end

local function InfoText(c, colored)
  if c.bn then return L.bnet end
  local parts = {}
  local cl = ClassLabel(c)
  if cl then
    parts[#parts + 1] = colored and (ColorHex(NameColor(c)) .. cl .. "|r") or cl
  end
  if c.level and c.level > 0 then parts[#parts + 1] = L.lvl .. " " .. c.level end
  if c.zone and c.zone ~= "" then parts[#parts + 1] = c.zone end
  if #parts == 0 then return L.char end
  return table.concat(parts, "  -  ")
end

----------------------------------------------------------------------
-- Modèle de données
----------------------------------------------------------------------
local function GetConv(key, init)
  local c = db.convs[key]
  if not c and init then
    c = {
      name = init.name, target = init.target, bn = init.bn, tag = init.tag, bnetID = init.bnetID,
      msgs = {}, unread = 0, last = 0,
    }
    db.convs[key] = c
  end
  return c
end

local function AddMsg(conv, out, text, orig)
  local msgs = conv.msgs
  msgs[#msgs + 1] = { t = time(), out = out, text = text, orig = orig }
  while #msgs > db.opts.maxMsgs do table.remove(msgs, 1) end
  conv.last = time()
end

local function TotalUnread()
  local n = 0
  for _, c in pairs(db.convs) do n = n + (c.unread or 0) end
  return n
end

local function CurrentConv()
  return TW.selected and db.convs[TW.selected]
end

----------------------------------------------------------------------
-- Rendu : liste des contacts
----------------------------------------------------------------------
local function AcquireRow(i)
  local r = rows[i]
  if r then return r end

  r = CreateFrame("Button", nil, listChild)
  r:SetHeight(ROW_H)
  r:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  r:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")

  r.sel = r:CreateTexture(nil, "BACKGROUND")
  r.sel:SetAllPoints()
  r.sel:SetColorTexture(C.gold[1], C.gold[2], C.gold[3], 0.16)

  r.line = r:CreateTexture(nil, "ARTWORK")
  r.line:SetPoint("BOTTOMLEFT", 4, 0)
  r.line:SetPoint("BOTTOMRIGHT", -4, 0)
  r.line:SetHeight(1)
  r.line:SetColorTexture(0.45, 0.33, 0.12, 0.45)

  r.icon = r:CreateTexture(nil, "ARTWORK")
  r.icon:SetSize(30, 30)
  r.icon:SetPoint("LEFT", 6, 0)

  r.name = r:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  r.name:SetPoint("TOPLEFT", 42, -8)
  r.name:SetPoint("TOPRIGHT", -28, -8)
  r.name:SetJustifyH("LEFT")
  r.name:SetWordWrap(false)

  r.preview = r:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  r.preview:SetPoint("TOPLEFT", 42, -25)
  r.preview:SetPoint("TOPRIGHT", -22, -25)
  r.preview:SetJustifyH("LEFT")
  r.preview:SetWordWrap(false)

  r.badge = CreateFrame("Frame", nil, r, BT)
  r.badge:SetSize(20, 16)
  r.badge:SetPoint("TOPRIGHT", -5, -6)
  r.badge:SetBackdrop(BUBBLE_BD)
  r.badge:SetBackdropColor(0.75, 0.08, 0.05, 1)
  r.badge:SetBackdropBorderColor(C.gold[1], C.gold[2], C.gold[3], 1)
  r.badge.text = r.badge:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  r.badge.text:SetPoint("CENTER", 0, 0)

  -- croix : archiver la conversation (dans la vue "Archives" : supprimer définitivement)
  r.close = CreateFrame("Button", nil, r)
  r.close:SetSize(16, 16)
  r.close:SetPoint("BOTTOMRIGHT", -3, 4)
  r.close.text = r.close:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  r.close.text:SetPoint("CENTER", 0, 1)
  r.close.text:SetText("x")
  r.close.text:SetTextColor(0.65, 0.58, 0.45)
  r.close:SetScript("OnEnter", function(self)
    self.text:SetTextColor(1, 0.3, 0.2)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(TW.showArchived and L.deleteTip or L.archiveTip, 1, 0.82, 0)
    GameTooltip:Show()
  end)
  r.close:SetScript("OnLeave", function(self)
    self.text:SetTextColor(0.65, 0.58, 0.45)
    GameTooltip:Hide()
  end)
  r.close:SetScript("OnClick", function()
    if TW.showArchived then TW:DeleteConv(r.key) else TW:Archive(r.key) end
  end)

  r:SetScript("OnClick", function(self, button)
    if button == "RightButton" then
      if IsShiftKeyDown() then
        TW:DeleteConv(self.key)
      elseif TW.showArchived then
        TW:Restore(self.key)
      else
        TW:Archive(self.key)
      end
    elseif button == "LeftButton" and IsControlKeyDown() then
      local c = db.convs[self.key]
      if c then c.muted = not c.muted end
      TW:RefreshList()
    else
      if TW.showArchived then
        TW:Restore(self.key)
        TW.showArchived = false
      end
      TW:Select(self.key)
    end
  end)
  r:SetScript("OnEnter", function(self)
    local c = db.convs[self.key]
    if not c then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(c.name or "", NameColor(c))
    GameTooltip:AddLine(InfoText(c), 0.9, 0.9, 0.9)
    if c.muted then GameTooltip:AddLine(L.muted, 1, 0.5, 0.2) end
    GameTooltip:AddLine(L.archiveHint, 0.6, 0.6, 0.6)
    GameTooltip:AddLine(L.muteHint, 0.6, 0.6, 0.6)
    GameTooltip:AddLine(L.delHint, 0.6, 0.6, 0.6)
    GameTooltip:Show()
  end)
  r:SetScript("OnLeave", function() GameTooltip:Hide() end)

  rows[i] = r
  return r
end

function TW:RefreshList()
  local arr = {}
  local wantArchived = self.showArchived and true or false
  for key, c in pairs(db.convs) do
    if (c.archived and true or false) == wantArchived then arr[#arr + 1] = { key = key, c = c } end
  end
  table.sort(arr, function(a, b) return (a.c.last or 0) > (b.c.last or 0) end)

  for i, e in ipairs(arr) do
    local r, c = AcquireRow(i), e.c
    r.key = e.key
    r:ClearAllPoints()
    r:SetPoint("TOPLEFT", listChild, "TOPLEFT", 0, -(i - 1) * ROW_H)
    r:SetPoint("TOPRIGHT", listChild, "TOPRIGHT", 0, -(i - 1) * ROW_H)
    SetClassIcon(r.icon, c.class)
    r.icon:ClearAllPoints()
    r.badge:ClearAllPoints()
    if self.compactList then
      r.icon:SetPoint("LEFT", 1, 0)
      r.badge:SetPoint("TOPRIGHT", 2, -2)
      r.name:Hide()
      r.preview:Hide()
      r.close:Hide()
    else
      r.icon:SetPoint("LEFT", 6, 0)
      r.badge:SetPoint("TOPRIGHT", -5, -6)
      r.name:Show()
      r.preview:Show()
      r.close:Show()
    end
    r.name:SetText((c.name or "?") .. (c.muted and (" |cff888888" .. L.muted .. "|r") or ""))
    r.name:SetTextColor(NameColor(c))
    local lastMsg = c.msgs[#c.msgs]
    r.preview:SetText(lastMsg and ((lastMsg.out and "> " or "") .. Clean(lastMsg.text)) or "")
    r.sel:SetShown(self.selected == e.key)
    if (c.unread or 0) > 0 then
      r.badge.text:SetText(c.unread > 99 and "99+" or c.unread)
      r.badge:SetWidth(math.max(20, r.badge.text:GetStringWidth() + 10))
      r.badge:Show()
    else
      r.badge:Hide()
    end
    r:Show()
  end
  for i = #arr + 1, #rows do rows[i]:Hide() end
  listChild:SetHeight(math.max(1, #arr * ROW_H))

  self:UpdateArchiveButton()
  local total = TotalUnread()
  if launcher then
    if total > 0 then
      launcher.badge.text:SetText(total > 99 and "99+" or total)
      launcher.badge:Show()
    else
      launcher.badge:Hide()
    end
  end
end

function TW:Archive(key)
  local c = db.convs[key]
  if not c then return end
  c.archived = true
  if self.selected == key then self.selected = nil end
  self:Refresh()
end

function TW:Restore(key)
  local c = db.convs[key]
  if not c then return end
  c.archived = nil
  self:Refresh()
end

function TW:DeleteConv(key)
  db.convs[key] = nil
  if self.selected == key then self.selected = nil end
  self:Refresh()
end

function TW:UpdateArchiveButton()
  if not archBtn then return end
  local n = 0
  for _, c in pairs(db.convs) do
    if c.archived then n = n + 1 end
  end
  local compact = self.compactList
  if self.showArchived then
    archBtn:SetText(compact and "<" or ("< " .. L.backBtn))
  else
    archBtn:SetText(compact and ("A" .. (n > 0 and n or "")) or (L.archiveBtn .. " (" .. n .. ")"))
  end
end

----------------------------------------------------------------------
-- Rendu : bulles de messages
----------------------------------------------------------------------
local trCache = setmetatable({}, { __mode = "k" })

local function AcquireBubble(i)
  local b = bubbles[i]
  if b then return b end
  b = CreateFrame("Frame", nil, msgChild, BT)
  b:SetBackdrop(BUBBLE_BD)
  b.text = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  b.text:SetJustifyH("LEFT")
  b.text:SetJustifyV("TOP")
  b.text:SetPoint("TOPLEFT", 10, -7)
  b.time = b:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  b.time:SetPoint("BOTTOMRIGHT", -8, 4)
  b.chips = {}
  return b, true
end

local function AcquireChip(b, k)
  local chip = b.chips[k]
  if chip then return chip end
  chip = CreateFrame("Button", nil, b)
  chip:SetHeight(CHIP_H - 2)
  chip:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
  chip.bg = chip:CreateTexture(nil, "BACKGROUND")
  chip.bg:SetAllPoints()
  chip.bg:SetColorTexture(0, 0, 0, 0.35)
  chip.text = chip:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  chip.text:SetPoint("LEFT", 4, 0)
  chip.text:SetPoint("RIGHT", -4, 0)
  chip.text:SetJustifyH("LEFT")
  chip.text:SetWordWrap(false)
  chip:SetScript("OnClick", function(self)
    if self.link then SetItemRef(self.link.data, self.link.full, "LeftButton") end
  end)
  chip:SetScript("OnEnter", function(self)
    if not self.link then return end
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    if not pcall(GameTooltip.SetHyperlink, GameTooltip, self.link.data) then
      GameTooltip:SetText(L.linkHint)
    end
    GameTooltip:Show()
  end)
  chip:SetScript("OnLeave", function() GameTooltip:Hide() end)
  b.chips[k] = chip
  return chip
end

local function AcquireSep(i)
  local s = seps[i]
  if s then return s end
  s = msgChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  s:SetTextColor(C.gold[1], C.gold[2], C.gold[3], 0.8)
  seps[i] = s
  return s
end

-- texte affiché dans une bulle (avec traduction / original éventuels)
local function ReadTarget()
  local r = db.opts.readLang
  if r == nil or r == "auto" then return isFR and "fr" or "en" end
  return r
end

local function BubbleBody(conv, m)
  local body = Decorate(m.text)
  local target = ReadTarget()
  local me = UnitName and UnitName("player")
  local isSelf = me and conv.name and conv.name:lower() == me:lower()
  if m.out and m.orig and m.orig:lower() ~= m.text:lower() then
    body = body .. "\n|cff9d9d9d" .. Decorate(m.orig) .. "|r"
  elseif (not m.out or isSelf) and target ~= "off" and TW.AutoTranslate then
    local cache = trCache[m]
    if not cache or cache.target ~= target then
      local ok, text, src = pcall(TW.AutoTranslate, m.text, target)
      if not ok then text, src = nil, nil end
      cache = { target = target, text = text, src = src }
      trCache[m] = cache
    end
    if cache.text then
      body = body .. "\n|cff9d9d9d[" .. string.upper(cache.src or "?") .. "] " .. Decorate(cache.text) .. "|r"
    end
  end
  return body
end

function TW:UpdateHeader()
  local conv = CurrentConv()
  if not conv then
    headerName:SetText("")
    headerSub:SetText("")
    headerIcon:Hide()
  else
    headerIcon:Show()
    SetClassIcon(headerIcon, conv.class)
    headerName:SetText(conv.name or "?")
    headerName:SetTextColor(NameColor(conv))
    headerSub:SetText(InfoText(conv, true))
  end
  if trBtn then
    local short = self.smallButtons
    if conv and conv.tr == "fren" then trBtn:SetText(short and "F>E" or "FR>EN")
    elseif conv and conv.tr == "enfr" then trBtn:SetText(short and "E>F" or "EN>FR")
    elseif conv and conv.trAuto then trBtn:SetText("Auto")
    elseif conv and conv.tr then trBtn:SetText(short and conv.tr:upper() or ("FR>" .. conv.tr:upper()))
    else trBtn:SetText(short and "Tr" or L.trOff) end
  end
  self:UpdateSpellButton()
  self:UpdatePreview()
end

function TW:RenderMessages()
  for _, b in ipairs(bubbles) do b:Hide() end
  for _, s in ipairs(seps) do s:Hide() end
  self:UpdateHeader()

  local conv = CurrentConv()
  if not conv then
    emptyText:Show()
    msgChild:SetHeight(1)
    return
  end
  emptyText:Hide()

  local cw = msgScroll:GetWidth()
  if not cw or cw < 120 then cw = 380 end
  msgChild:SetWidth(cw)
  local maxTextW = math.floor(cw * 0.72) - 20
  measure:SetWidth(0)

  local sentBG, sentEdge = SentColors()
  local msgs = conv.msgs
  local y, bi, si, lastDay = -6, 0, 0, nil

  for i = math.max(1, #msgs - MAX_RENDERED + 1), #msgs do
    local m = msgs[i]
    local day = date("%Y%m%d", m.t)
    if day ~= lastDay then
      lastDay = day
      si = si + 1
      local s = AcquireSep(si)
      s:SetText(date(L.dateFmt, m.t))
      s:ClearAllPoints()
      s:SetPoint("TOP", msgChild, "TOP", 0, y)
      s:Show()
      y = y - 20
    end

    bi = bi + 1
    local b = bubbles[bi]
    if not b then
      b = AcquireBubble(bi)
      bubbles[bi] = b
    end

    local body = BubbleBody(conv, m)
    measure:SetWidth(0)
    measure:SetText(body)
    local tw = math.max(60, math.min(measure:GetStringWidth(), maxTextW))

    b.text:SetWidth(tw)
    b.text:SetText(body)
    local th = b.text:GetStringHeight()
    b.time:SetText(date("%H:%M", m.t))

    -- liens cliquables sous le texte
    local links = ExtractLinks(m.text)
    for k, link in ipairs(links) do
      local chip = AcquireChip(b, k)
      chip.link = link
      chip.text:SetText(link.full)
      chip:ClearAllPoints()
      chip:SetPoint("TOPLEFT", b, "TOPLEFT", 8, -(7 + th + 3 + (k - 1) * CHIP_H))
      chip:SetWidth(tw + 4)
      chip:Show()
    end
    for k = #links + 1, #b.chips do b.chips[k]:Hide() end

    local bh = th + 7 + 16 + #links * CHIP_H
    b:SetSize(tw + 20, bh)

    local A = db.opts.opacity or 1
    if m.out then
      b:SetBackdropColor(sentBG[1], sentBG[2], sentBG[3], sentBG[4] * A)
      b:SetBackdropBorderColor(unpack(sentEdge))
      b.text:SetTextColor(1, 1, 1)
    else
      b:SetBackdropColor(C.leather[1], C.leather[2], C.leather[3], C.leather[4] * A)
      b:SetBackdropBorderColor(unpack(C.leatherEd))
      b.text:SetTextColor(unpack(C.parchment))
    end

    b:ClearAllPoints()
    if m.out then
      b:SetPoint("TOPRIGHT", msgChild, "TOPRIGHT", -4, y)
    else
      b:SetPoint("TOPLEFT", msgChild, "TOPLEFT", 4, y)
    end
    b:Show()
    y = y - bh - 6
  end

  msgChild:SetHeight(-y + 6)
  After(0.05, function()
    msgScroll:SetVerticalScroll(msgScroll:GetVerticalScrollRange())
  end)
end

local renderPending
function TW:ScheduleRender()
  if renderPending then return end
  renderPending = true
  After(0.05, function()
    renderPending = false
    TW:RenderMessages()
  end)
end

function TW:Refresh()
  self:RefreshList()
  self:RenderMessages()
end

----------------------------------------------------------------------
-- Correcteur + aperçu de la traduction sous la zone de saisie
----------------------------------------------------------------------
local function SpellLang(c)
  local mode = db.opts.spellLang
  if mode == "fr" or mode == "en" then return mode end
  if c and c.tr == "en" then return "en" end
  if c and c.tr == "enfr" then return "en" end
  if c and c.tr == "fren" then return "fr" end
  return isFR and "fr" or "en"
end

function TW:UpdateReadButton()
  if not readBtn then return end
  local r = ReadTarget()
  local label
  if self.tinyTitle then
    label = (r == "off") and "-" or string.upper(r)
  else
    label = L.readBtn .. ": " .. ((r == "off") and L.off or string.upper(r))
  end
  readBtn:SetText(((r == "off") and "|cff999999" or "|cff66ff66") .. label .. "|r")
end

function TW:UpdateSpellButton()
  if not spellBtn then return end
  if not spellBtn.icon then
    spellBtn.icon = spellBtn:CreateTexture(nil, "OVERLAY")
    spellBtn.icon:SetSize(24, 24)
    spellBtn.icon:SetPoint("CENTER", 0, 0)
  end
  local lang = SpellLang(CurrentConv())
  spellBtn.icon:SetTexture("Interface\\AddOns\\TavernWhispers\\Media\\spell_" .. lang .. ".tga")
  local on = db.opts.spell and true or false
  spellBtn.icon:SetAlpha(on and 1 or 0.35)
  if spellBtn.icon.SetDesaturated then spellBtn.icon:SetDesaturated(not on) end
  spellBtn:SetText("")
end

function TW:UpdatePreview()
  if not preview or not spellLine then return end
  local c = CurrentConv()
  local t = input and input:GetText() or ""
  local base, corrected = t, nil

  if t ~= "" and c and db.opts.spell and TW.Correct then
    -- on ne corrige pas le mot en cours de frappe
    local head, tail = t:match("^(.*[%s%p])([^%s%p]*)$")
    if not head then head, tail = "", t end
    local r = TW.Correct(head, SpellLang(c)) .. tail
    if r ~= t then corrected, base = r, r end
  end
  self.suggestion = corrected
  if corrected then
    spellLine:SetText("|cff88ff88" .. L.spellPrefix .. "|r " .. Decorate(corrected) .. "  |cff777777(Tab)|r")
  else
    spellLine:SetText("")
  end

  local code = c and TW.EffectiveTr and TW.EffectiveTr(c)
  if code and t ~= "" and TW.TranslateOut then
    preview:SetText("|cff9d9d9d> |r" .. Decorate(TW.TranslateOut(base, code) or base))
  else
    preview:SetText("")
  end
end

----------------------------------------------------------------------
-- Mise en page adaptative + opacité
----------------------------------------------------------------------
function TW:ApplyLayout()
  if not (mainFrame and listFrame and trBtn and spellBtn and emoBtn) then return end
  local w = mainFrame:GetWidth() or W
  local listW = (w >= 600 and LIST_W) or (w >= 470 and 150) or 64
  self.compactList = listW <= 64
  listFrame:SetWidth(listW)
  listChild:SetWidth(listW - 31)

  local cw = w - 36 - listW - 6
  local small = cw < 400
  self.smallButtons = small
  local tiny = w < 560
  self.tinyTitle = tiny
  if optBtn then
    optBtn:SetWidth(tiny and 30 or 76)
    optBtn:SetText(tiny and "+" or L.setBtn)
  end
  if opacityBtn and readBtn then
    opacityBtn:SetWidth(tiny and 30 or 64)
    opacityBtn:SetText(tiny and "%" or L.opacity)
    readBtn:SetWidth(tiny and 36 or 78)
    self:UpdateReadButton()
  end
  trBtn:SetWidth(small and 44 or 74)
  spellBtn:SetWidth(36)
  emoBtn:SetWidth(small and 28 or 32)
  self:UpdateSpellButton()
  self:UpdateHeader()
  self:RefreshList()
end

function TW:ApplyOpacity()
  if not (mainFrame and listFrame and chatFrame) then return end
  local a = db.opts.opacity or 1
  mainFrame:SetBackdropColor(1, 1, 1, a)
  mainFrame:SetBackdropBorderColor(1, 1, 1, math.min(1, a + 0.3))
  for _, pnl in ipairs({ listFrame, chatFrame }) do
    pnl:SetBackdropColor(C.panel[1], C.panel[2], C.panel[3], C.panel[4] * a)
    pnl:SetBackdropBorderColor(C.panelEd[1], C.panelEd[2], C.panelEd[3], math.max(0.45, a))
  end
  if chatWin and chatPanel then
    chatWin:SetBackdropColor(1, 1, 1, a)
    chatWin:SetBackdropBorderColor(1, 1, 1, math.min(1, a + 0.3))
    chatPanel:SetBackdropColor(C.panel[1], C.panel[2], C.panel[3], C.panel[4] * a)
    chatPanel:SetBackdropBorderColor(C.panelEd[1], C.panelEd[2], C.panelEd[3], math.max(0.45, a))
  end
  self:ScheduleRender()
end

----------------------------------------------------------------------
-- Actions
----------------------------------------------------------------------
function TW:Select(key)
  self.selected = key
  local c = db.convs[key]
  if c then
    c.unread = 0
    if not c.class then self:LookupInfo(c) end
  end
  self:Refresh()
end

function TW:OpenWith(name, focus)
  if not name or name == "" then return end
  local disp = Ambiguate(name, "none")
  local key = disp:lower()
  local c = GetConv(key, { name = disp, target = name })
  c.archived = nil
  self.showArchived = false
  self:LookupInfo(c)
  mainFrame:Show()
  self:Select(key)
  if focus == true then
    After(0, function() input:SetFocus() end)
  end
end

function TW:Toggle()
  if mainFrame:IsShown() then wanted[mainFrame] = false; mainFrame:Hide() else mainFrame:Show() end
end

local LANG_NAMES = {
  de = isFR and "allemand" or "German", es = isFR and "espagnol" or "Spanish",
  it = isFR and "italien" or "Italian", pt = isFR and "portugais" or "Portuguese",
  ru = isFR and "russe" or "Russian",
}
TW.LANG_NAMES = LANG_NAMES

-- code de traduction effectif pour une conversation (gère le mode auto)
local function EffectiveTr(c)
  if not c then return nil end
  if c.trAuto and c.lastLang and LANG_NAMES[c.lastLang] then return c.lastLang end
  if c.trAuto and c.lastLang == "en" then return "fren" end
  return c.tr
end

TW.EffectiveTr = EffectiveTr

local function Chunk(s, size)
  local out = {}
  while #s > size do
    local cut = s:sub(1, size):match("^.*() ") or size
    if cut < 20 then cut = size end
    out[#out + 1] = s:sub(1, cut)
    s = s:sub(cut + 1)
  end
  if s ~= "" then out[#out + 1] = s end
  return out
end

function TW:Send(text, raw)
  local c = CurrentConv()
  if not c or text == "" then return end
  local out = text
  if not raw then
    if db.opts.spell and TW.Correct then out = TW.Correct(out, SpellLang(c)) end
    local code = EffectiveTr(c)
    if code and TW.TranslateOut then
      local t = TW.TranslateOut(out, code)
      if t and t ~= "" then out = t end
    end
  end
  local chunks = Chunk(out, 250)
  if out ~= text and #chunks == 1 then TW.pending[chunks[1]] = text end

  for _, piece in ipairs(chunks) do
    if c.bn then
      local id = ResolveBnetID(c)
      if id then
        BNSendWhisper(id, piece)
      else
        Print(L.bnOff)
        return
      end
    else
      SendChatMessage(piece, "WHISPER", nil, c.target or c.name)
    end
  end
  -- les messages sont enregistrés via les évènements CHAT_MSG_*_INFORM
end

function TW:CycleTranslate()
  local c = CurrentConv()
  if not c then return end
  c.trAuto = nil
  local seq = { "fren", "enfr" }
  for _, code in ipairs(TW.OUT_LANGS or {}) do seq[#seq + 1] = code end
  local nxt
  if not c.tr then nxt = seq[1]
  else
    for i, code in ipairs(seq) do if code == c.tr then nxt = seq[i + 1] end end
  end
  c.tr = nxt
  self:UpdateHeader()
  self:RenderMessages()
end

----------------------------------------------------------------------
-- Réception des chuchotements
----------------------------------------------------------------------
local function OnWhisper(event, msg, author, ...)
  local isBN = event:find("BN_", 1, true) ~= nil
  local isOut = event:find("INFORM", 1, true) ~= nil
  local key, conv

  if isBN then
    local id = select(11, ...)
    local name, tag = BNInfoByID(id)
    name = name or author
    key = "bn:" .. (tag or name)
    conv = GetConv(key, { name = name, bn = true, tag = tag, bnetID = id })
    conv.name, conv.tag, conv.bnetID = name, tag, id
  else
    local disp = Ambiguate(author, "none")
    key = disp:lower()
    conv = GetConv(key, { name = disp, target = author })
    conv.target = author
    if not isOut then
      local guid = select(10, ...)
      if guid and guid ~= "" and GetPlayerInfoByGUID then
        local loc, token = GetPlayerInfoByGUID(guid)
        if loc then ApplyClass(conv, loc, token) end
      end
      if ChatEdit_SetLastTellTarget then ChatEdit_SetLastTellTarget(author, "WHISPER") end
    end
    if not conv.class then TW:LookupInfo(conv) end
  end

  conv.archived = nil
  local orig
  if isOut then
    orig = TW.pending[msg]
    TW.pending[msg] = nil
  end
  AddMsg(conv, isOut, msg, orig)
  if not isOut and TW.DetectLang then
    local okd, dl = pcall(TW.DetectLang, msg, conv.lastLang)
    if okd and dl then conv.lastLang = dl end
  end

  -- réponse automatique (combat / champ de bataille / donjon / indisponible)
  if not isOut and not isBN and TW.MaybeAutoReply then
    TW:MaybeAutoReply(author, msg, (select(4, ...)))
  end

  local visible = mainFrame:IsShown() and TW.selected == key
  if not isOut then
    local quiet = conv.muted or (TW.DndState and TW:DndState() ~= nil)
    if visible then
      conv.unread = 0
    else
      conv.unread = (conv.unread or 0) + 1
      if db.opts.sound and not quiet then
        if SOUNDKIT then PlaySound(SOUNDKIT.TELL_MESSAGE) else PlaySound("TellMessage") end
      end
      if db.opts.autoOpen and not quiet and not mainFrame:IsShown() and not InCombatLockdown() then
        mainFrame:Show()
        TW:Select(key)
        return
      end
    end
  end
  TW:Refresh()
end

----------------------------------------------------------------------
-- Sélecteur d'émojis (vraies images, style messagerie)
----------------------------------------------------------------------
local PICKER = {}
for n = 1, 8 do
  PICKER[#PICKER + 1] = { code = "{rt" .. n .. "}", tex = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. n }
end
for _, name in ipairs(EMOJI_LIST) do
  PICKER[#PICKER + 1] = { code = ":" .. name .. ":", tex = EMO_PATH .. name .. ".tga" }
end

local function BuildEmojiPopup(parent, anchor)
  local cols, cell, pad = 10, 28, 8
  local rowsN = math.ceil(#PICKER / cols)
  local p = CreateFrame("Frame", nil, parent, BT)
  p:SetSize(cols * cell + pad * 2, rowsN * cell + pad * 2)
  p:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, 4)
  p:SetFrameLevel(parent:GetFrameLevel() + 30)
  p:SetBackdrop(PANEL_BD)
  p:SetBackdropColor(0.08, 0.05, 0.03, 0.97)
  p:SetBackdropBorderColor(unpack(C.panelEd))
  p:Hide()

  for i, e in ipairs(PICKER) do
    local b = CreateFrame("Button", nil, p)
    b:SetSize(cell - 2, cell - 2)
    local col, row = (i - 1) % cols, math.floor((i - 1) / cols)
    b:SetPoint("TOPLEFT", p, "TOPLEFT", pad + col * cell, -(pad + row * cell))
    b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    local t = b:CreateTexture(nil, "ARTWORK")
    t:SetSize(22, 22)
    t:SetPoint("CENTER")
    t:SetTexture(e.tex)
    b:SetScript("OnClick", function()
      input:Insert(e.code .. " ")
    end)
  end
  return p
end

----------------------------------------------------------------------
-- Construction de l'interface
----------------------------------------------------------------------
local function BuildLauncher()
  local b = CreateFrame("Button", "TavernWhispersLauncher", Root(), BT)
  b:SetSize(38, 38)
  b:SetFrameStrata("MEDIUM")
  b:SetBackdrop(PANEL_BD)
  b:SetBackdropColor(unpack(C.panel))
  b:SetBackdropBorderColor(unpack(C.panelEd))
  b:SetMovable(true)
  b:SetClampedToScreen(true)
  b:RegisterForDrag("LeftButton")
  b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  b:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Up")
  b:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Down")
  b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
  for _, tex in ipairs({ b:GetNormalTexture(), b:GetPushedTexture() }) do
    tex:ClearAllPoints()
    tex:SetPoint("TOPLEFT", 5, -5)
    tex:SetPoint("BOTTOMRIGHT", -5, 5)
  end

  local p = db.launcherPos
  if p then
    b:SetPoint(p[1], UIParent, p[2], p[3], p[4])
  else
    b:SetPoint("LEFT", UIParent, "LEFT", 20, 0)
  end
  b:SetScript("OnDragStart", b.StartMoving)
  b:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local point, _, rel, x, y = self:GetPoint()
    db.launcherPos = { point, rel, x, y }
  end)
  b:SetScript("OnClick", function(_, button)
    if button == "RightButton" then TW:ToggleDnd() else TW:Toggle() end
  end)
  b:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(L.title, 1, 0.82, 0)
    local n = TotalUnread()
    if n > 0 then GameTooltip:AddLine(n .. " non lu(s) / unread", 1, 0.5, 1) end
    if db.dnd and db.dnd.manual then GameTooltip:AddLine(L.dndOnTip, 1, 0.3, 0.3) end
    GameTooltip:AddLine(L.dndTip, 0.7, 0.7, 0.7)
    GameTooltip:Show()
  end)
  b:SetScript("OnLeave", function() GameTooltip:Hide() end)

  b.badge = CreateFrame("Frame", nil, b, BT)
  b.badge:SetSize(22, 16)
  b.badge:SetPoint("TOPRIGHT", 8, 6)
  b.badge:SetFrameLevel(b:GetFrameLevel() + 5)
  b.badge:SetBackdrop(BUBBLE_BD)
  b.badge:SetBackdropColor(0.75, 0.08, 0.05, 1)
  b.badge:SetBackdropBorderColor(C.gold[1], C.gold[2], C.gold[3], 1)
  b.badge.text = b.badge:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  b.badge.text:SetPoint("CENTER")
  b.badge:Hide()

  launcher = b
end

local function BuildUI()
  local f = CreateFrame("Frame", "TavernWhispersFrame", Root(), BT)
  mainFrame = f
  local size = db.size
  f:SetSize(size and size[1] or W, size and size[2] or H)
  f:SetFrameStrata("MEDIUM") -- même niveau que sacs, personnage, sorts...
  f:SetToplevel(true)        -- passe devant quand on clique dessus / quand elle s'ouvre
  f:SetMovable(true)
  f:SetResizable(true)
  if f.SetMinResize then
    f:SetMinResize(MIN_W, MIN_H)
  elseif f.SetResizeBounds then
    f:SetResizeBounds(MIN_W, MIN_H)
  end
  f:EnableMouse(true)
  f:SetClampedToScreen(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", f.StartMoving)
  f:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local point, _, rel, x, y = self:GetPoint()
    db.pos = { point, rel, x, y }
  end)
  local p = db.pos
  if p then f:SetPoint(p[1], UIParent, p[2], p[3], p[4]) else f:SetPoint("CENTER") end

  f:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 },
  })
  f:Hide()
  -- (volontairement absent de UISpecialFrames : on ne veut pas que le jeu ferme cette fenêtre tout seul)

  local hdr = f:CreateTexture(nil, "ARTWORK")
  hdr:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
  hdr:SetSize(300, 64)
  hdr:SetPoint("TOP", 0, 12)
  local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("TOP", hdr, "TOP", 0, -14)
  title:SetText(L.title)

  local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", -6, -6)
  close:HookScript("OnClick", function() wanted[f] = false end)

  -- poignée de redimensionnement
  local grip = CreateFrame("Button", nil, f)
  grip:SetSize(16, 16)
  grip:SetPoint("BOTTOMRIGHT", -6, 6)
  grip:SetFrameLevel(f:GetFrameLevel() + 20)
  grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
  grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
  grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
  grip:SetScript("OnMouseDown", function() f:StartSizing("BOTTOMRIGHT") end)
  grip:SetScript("OnMouseUp", function()
    f:StopMovingOrSizing()
    db.size = { f:GetWidth(), f:GetHeight() }
    local point, _, rel, x, y = f:GetPoint()
    db.pos = { point, rel, x, y }
    TW:ScheduleRender()
  end)

  ---------------- liste des contacts (gauche)
  local list = CreateFrame("Frame", nil, f, BT)
  list:SetPoint("TOPLEFT", 18, -34)
  list:SetPoint("BOTTOMLEFT", 18, 18)
  list:SetWidth(LIST_W)
  list:SetBackdrop(PANEL_BD)
  list:SetBackdropColor(unpack(C.panel))
  list:SetBackdropBorderColor(unpack(C.panelEd))

  listFrame = list
  local listScroll = CreateFrame("ScrollFrame", "TavernWhispersListScroll", list, "UIPanelScrollFrameTemplate")
  listScroll:SetPoint("TOPLEFT", 5, -6)
  listScroll:SetPoint("BOTTOMRIGHT", -26, 6)
  listChild = CreateFrame("Frame", nil, listScroll)
  listChild:SetSize(LIST_W - 31, 1)
  listScroll:SetScrollChild(listChild)

  ---------------- zone de discussion (droite, s'étire avec la fenêtre)
  local chat = CreateFrame("Frame", nil, f, BT)
  chat:SetPoint("TOPLEFT", list, "TOPRIGHT", 6, 0)
  chat:SetPoint("BOTTOMRIGHT", -18, 18)
  chat:SetBackdrop(PANEL_BD)
  chat:SetBackdropColor(unpack(C.panel))
  chat:SetBackdropBorderColor(unpack(C.panelEd))

  chatFrame = chat
  headerIcon = chat:CreateTexture(nil, "ARTWORK")
  headerIcon:SetSize(34, 34)
  headerIcon:SetPoint("TOPLEFT", 10, -8)

  headerName = chat:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  headerName:SetPoint("TOPLEFT", headerIcon, "TOPRIGHT", 8, -1)
  headerSub = chat:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  headerSub:SetPoint("TOPLEFT", headerName, "BOTTOMLEFT", 0, -3)

  local sep = chat:CreateTexture(nil, "ARTWORK")
  sep:SetPoint("TOPLEFT", 8, -48)
  sep:SetPoint("TOPRIGHT", -8, -48)
  sep:SetHeight(1)
  sep:SetColorTexture(C.gold[1], C.gold[2], C.gold[3], 0.5)

  msgScroll = CreateFrame("ScrollFrame", "TavernWhispersMsgScroll", chat, "UIPanelScrollFrameTemplate")
  msgScroll:SetPoint("TOPLEFT", 6, -54)
  msgScroll:SetPoint("BOTTOMRIGHT", -26, 76)
  msgChild = CreateFrame("Frame", nil, msgScroll)
  msgChild:SetSize(380, 1)
  msgScroll:SetScrollChild(msgChild)
  msgScroll:SetScript("OnSizeChanged", function() TW:ScheduleRender() end)

  emptyText = chat:CreateFontString(nil, "OVERLAY", "GameFontDisable")
  emptyText:SetPoint("CENTER", chat, "CENTER", 0, 10)
  emptyText:SetWidth(300)
  emptyText:SetText(L.empty)

  measure = chat:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  measure:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -3000, 0)
  measure:SetAlpha(0)

  ---------------- ligne d'aperçu de la traduction
  preview = chat:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  preview:SetPoint("BOTTOMLEFT", chat, "BOTTOMLEFT", 16, 38)
  preview:SetPoint("BOTTOMRIGHT", chat, "BOTTOMRIGHT", -10, 38)
  spellLine = chat:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  spellLine:SetPoint("BOTTOMLEFT", chat, "BOTTOMLEFT", 16, 54)
  spellLine:SetPoint("BOTTOMRIGHT", chat, "BOTTOMRIGHT", -10, 54)
  spellLine:SetJustifyH("LEFT")
  spellLine:SetWordWrap(false)
  preview:SetJustifyH("LEFT")
  preview:SetWordWrap(false)
  preview:SetTextColor(1, 0.82, 0)

  ---------------- boutons : traduction + émoticônes
  trBtn = CreateFrame("Button", nil, chat, "UIPanelButtonTemplate")
  trBtn:SetSize(74, 24)
  trBtn:SetPoint("BOTTOMRIGHT", -20, 9)
  trBtn:SetText(L.trOff)
  trBtn:SetScript("OnClick", function() TW:CycleTranslate() end)
  trBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText(L.trTipT, 1, 0.82, 0)
    GameTooltip:AddLine(L.trTip1, 1, 1, 1, true)
    GameTooltip:AddLine(L.trTip2, 0.8, 0.8, 0.8, true)
    GameTooltip:AddLine(L.trTip3, 0.6, 0.6, 0.6, true)
    GameTooltip:Show()
  end)
  trBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

  spellBtn = CreateFrame("Button", nil, chat, "UIPanelButtonTemplate")
  spellBtn:SetSize(36, 24)
  spellBtn:SetPoint("RIGHT", trBtn, "LEFT", -3, 0)
  spellBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  spellBtn:SetScript("OnClick", function(_, button)
    if button == "RightButton" then
      -- langue du correcteur : auto -> français -> anglais -> auto
      local m = db.opts.spellLang or "auto"
      db.opts.spellLang = (m == "auto" and "fr") or (m == "fr" and "en") or "auto"
      db.opts.spell = true
    else
      db.opts.spell = not db.opts.spell
    end
    TW:UpdateSpellButton()
    TW:UpdatePreview()
  end)
  spellBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText(L.spellTipT, 1, 0.82, 0)
    GameTooltip:AddLine(L.spellTip1, 1, 1, 1, true)
    GameTooltip:AddLine(L.spellTip2, 0.8, 0.8, 0.8, true)
    GameTooltip:AddLine(L.spellTip3, 0.7, 0.7, 0.7, true)
    local m = db.opts.spellLang or "auto"
    GameTooltip:AddLine(m == "fr" and L.spellLangFr or (m == "en" and L.spellLangEn or L.spellLangAuto), 0.4, 1, 0.4)
    GameTooltip:Show()
  end)
  spellBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
  TW:UpdateSpellButton()

  emoBtn = CreateFrame("Button", nil, chat, "UIPanelButtonTemplate")
  emoBtn:SetSize(32, 24)
  emoBtn:SetPoint("RIGHT", spellBtn, "LEFT", -3, 0)
  emoBtn:SetText(":)")
  emoBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText(L.emoTip, 1, 0.82, 0)
    GameTooltip:Show()
  end)
  emoBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

  ---------------- saisie
  input = CreateFrame("EditBox", "TavernWhispersInput", chat, "InputBoxTemplate")
  input:SetAutoFocus(false)
  input:SetHeight(24)
  input:SetMaxLetters(255)
  input:SetPoint("BOTTOMLEFT", 14, 10)
  input:SetPoint("BOTTOMRIGHT", emoBtn, "BOTTOMLEFT", -6, 1)
  input:SetScript("OnEnterPressed", function(self)
    local text = self:GetText()
    if text and text ~= "" then TW:Send(text, IsControlKeyDown()) end
    self:SetText("")
    self:ClearFocus() -- rend le clavier au jeu (déplacement, saut...)
  end)
  input:SetScript("OnEscapePressed", function(self)
    self:ClearFocus()
  end)
  input:SetScript("OnTabPressed", function(self)
    local sug = TW.suggestion
    if sug then
      self:SetText(sug)
      self:SetCursorPosition(self:GetNumLetters())
    end
  end)
  input:SetScript("OnTextChanged", function() TW:UpdatePreview() end)

  -- clic dans le panneau de discussion : on peut écrire
  chat:EnableMouse(true)
  chat:SetScript("OnMouseDown", function() input:SetFocus() end)

  emoPopup = BuildEmojiPopup(chat, emoBtn)

  -- tant que la saisie a le clavier, un clic hors de la fenêtre le rend au jeu
  local watcher = CreateFrame("Frame")
  watcher:Hide()
  watcher:SetScript("OnUpdate", function()
    if (IsMouseButtonDown("LeftButton") or IsMouseButtonDown("RightButton"))
       and not (MouseIsOver(f) or MouseIsOver(emoPopup)) then
      input:ClearFocus()
    end
  end)
  input:HookScript("OnEditFocusGained", function() watcher:Show() end)
  input:HookScript("OnEditFocusLost", function() watcher:Hide() end)
  emoBtn:SetScript("OnClick", function()
    if emoPopup:IsShown() then emoPopup:Hide() else emoPopup:Show() end
  end)
  ---------------- opacité
  opacityBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  opacityBtn:SetSize(64, 20)
  opacityBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -34, -9)
  opacityBtn:SetText(L.opacity)

  opacityPopup = CreateFrame("Frame", nil, f, BT)
  opacityPopup:SetSize(210, 62)
  opacityPopup:SetPoint("TOPRIGHT", opacityBtn, "BOTTOMRIGHT", 0, -2)
  opacityPopup:SetFrameLevel(f:GetFrameLevel() + 30)
  opacityPopup:SetBackdrop(PANEL_BD)
  opacityPopup:SetBackdropColor(0.08, 0.05, 0.03, 0.98)
  opacityPopup:SetBackdropBorderColor(unpack(C.panelEd))
  opacityPopup:Hide()

  local slider = CreateFrame("Slider", "TavernWhispersOpacitySlider", opacityPopup, "OptionsSliderTemplate")
  slider:SetWidth(170)
  slider:SetPoint("CENTER", opacityPopup, "CENTER", 0, -6)
  slider:SetMinMaxValues(0.2, 1)
  slider:SetValueStep(0.05)
  local low, high, label = _G["TavernWhispersOpacitySliderLow"], _G["TavernWhispersOpacitySliderHigh"], _G["TavernWhispersOpacitySliderText"]
  if low then low:SetText("20%") end
  if high then high:SetText("100%") end
  local function ShowValue(v)
    if label then label:SetText(L.opacity .. " " .. math.floor(v * 100 + 0.5) .. "%") end
  end
  slider:SetValue(db.opts.opacity or 1)
  ShowValue(db.opts.opacity or 1)
  slider:SetScript("OnValueChanged", function(self, v)
    v = math.floor(v * 20 + 0.5) / 20
    ShowValue(v)
    if v ~= db.opts.opacity then
      db.opts.opacity = v
      TW:ApplyOpacity()
    end
  end)
  opacityBtn:SetScript("OnClick", function()
    if opacityPopup:IsShown() then opacityPopup:Hide() else opacityPopup:Show() end
  end)
  opacityBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
    GameTooltip:SetText(L.opacityTip, 1, 0.82, 0)
    GameTooltip:Show()
  end)
  opacityBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

  readBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  readBtn:SetSize(78, 20)
  readBtn:SetPoint("RIGHT", opacityBtn, "LEFT", -4, 0)
  readBtn:SetScript("OnClick", function()
    local r = ReadTarget()
    if r == "fr" then r = "en" elseif r == "en" then r = "off" else r = "fr" end
    db.opts.readLang = r
    TW:UpdateReadButton()
    TW:RenderMessages()
  end)
  readBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
    GameTooltip:SetText(L.readTipT, 1, 0.82, 0)
    GameTooltip:AddLine(L.readTip1, 1, 1, 1, true)
    GameTooltip:AddLine(L.readTip2, 0.8, 0.8, 0.8, true)
    GameTooltip:Show()
  end)
  readBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
  TW:UpdateReadButton()

  optBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  optBtn:SetSize(76, 20)
  optBtn:SetPoint("RIGHT", readBtn, "LEFT", -4, 0)
  optBtn:SetText(L.setBtn)
  optBtn:SetScript("OnClick", function() TW:SettingsToggle() end)

  f:SetScript("OnHide", function()
    opacityPopup:Hide()
    emoPopup:Hide()
    input:ClearFocus() -- ne jamais garder le clavier quand la fenêtre est fermée
  end)

  f:SetScript("OnShow", function()
    local c = CurrentConv()
    if c then c.unread = 0 end
    TW:Refresh()
    if TW.SpellWarm and not TW.warmed then
      TW.warmed = true
      After(0.3, TW.SpellWarm) -- construit les dictionnaires une seule fois
    end
  end)

  f:SetScript("OnSizeChanged", function() TW:ApplyLayout() end)
  TW:ApplyLayout()
  TW:ApplyOpacity()
end

----------------------------------------------------------------------
-- Interception des actions "Chuchoter" / "Répondre" / liens shift-clic
----------------------------------------------------------------------
local function CloseDefaultEditBox()
  local eb = ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow()
  if eb and ChatEdit_DeactivateChat then ChatEdit_DeactivateChat(eb) end
end

local function InstallHooks()
  if ChatFrame_SendTell then
    hooksecurefunc("ChatFrame_SendTell", function(name)
      if db.opts.intercept and name and name ~= "" then
        CloseDefaultEditBox()
        TW:OpenWith(name)
      end
    end)
  end
  if ChatFrame_ReplyTell then
    hooksecurefunc("ChatFrame_ReplyTell", function()
      local last = ChatEdit_GetLastTellTarget and ChatEdit_GetLastTellTarget()
      if db.opts.intercept and last and last ~= "" then
        CloseDefaultEditBox()
        TW:OpenWith(last)
      end
    end)
  end

  -- Maj + clic sur un objet / sort / quête : le lien va dans notre zone de saisie
  local origInsert = ChatEdit_InsertLink
  if origInsert then
    ChatEdit_InsertLink = function(text)
      if text and mainFrame and mainFrame:IsShown() and input and input:IsVisible() then
        if input:HasFocus() then
          input:Insert(text)
          return true
        end
        local active = ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow()
        local special = (BrowseName and BrowseName:IsVisible()) or (MacroFrameText and MacroFrameText:IsVisible())
        if not active and not special then
          input:Insert(text)
          return true
        end
      end
      return origInsert(text)
    end
  end

  local function HideFilter() return db.opts.hideDefault end
  for _, e in ipairs({ "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM", "CHAT_MSG_BN_WHISPER", "CHAT_MSG_BN_WHISPER_INFORM" }) do
    ChatFrame_AddMessageEventFilter(e, HideFilter)
  end
end

----------------------------------------------------------------------
-- Fenêtre "Traduction du chat" : groupe / raid, canal N, guilde, dire
----------------------------------------------------------------------
local CHAT_EVENTS = {
  CHAT_MSG_PARTY              = { "party", "cLblParty", { 0.67, 0.67, 1.00 } },
  CHAT_MSG_PARTY_LEADER       = { "party", "cLblParty", { 0.46, 0.78, 1.00 } },
  CHAT_MSG_RAID               = { "party", "Raid",      { 1.00, 0.50, 0.00 } },
  CHAT_MSG_RAID_LEADER        = { "party", "Raid",      { 1.00, 0.28, 0.04 } },
  CHAT_MSG_RAID_WARNING       = { "party", "Raid",      { 1.00, 0.28, 0.00 } },
  CHAT_MSG_BATTLEGROUND       = { "party", "BG",        { 1.00, 0.50, 0.00 } },
  CHAT_MSG_BATTLEGROUND_LEADER = { "party", "BG",       { 1.00, 0.86, 0.72 } },
  CHAT_MSG_GUILD              = { "guild", "cLblGuild", { 0.25, 1.00, 0.25 } },
  CHAT_MSG_OFFICER            = { "guild", "cLblGuild", { 0.25, 0.75, 0.25 } },
  CHAT_MSG_SAY                = { "say",   "cLblSay",   { 1.00, 1.00, 1.00 } },
  CHAT_MSG_YELL               = { "say",   "cLblYell",  { 1.00, 0.25, 0.25 } },
}

local function ChatCfg()
  return db.chat
end

local function ChatTarget()
  local t = ReadTarget()
  if t == "off" then t = isFR and "fr" or "en" end
  return t
end

function TW:UpdateChatButtons()
  if not chatBtns then return end
  local cfg = ChatCfg()
  local function paint(btn, on, text)
    btn:SetText((on and "|cff66ff66" or "|cff999999") .. text .. "|r")
  end
  paint(chatBtns.party, cfg.party, L.cParty)
  local s1, s2 = cfg.slots[1], cfg.slots[2]
  paint(chatBtns.chan, s1.on, L.cChan .. " " .. s1.num)
  paint(chatBtns.chan2, s2.on, L.cChan .. " " .. s2.num)
  paint(chatBtns.guild, cfg.guild, L.cGuild)
  paint(chatBtns.say, cfg.say, L.cSay)
  chatBtns.mode:SetText("|cffffd100" .. (cfg.onlyForeign and L.cOnly or L.cAll) .. "|r")
  chatBtns.clear:SetText(L.cClear)
  if TW.UpdateSpeakBar then TW:UpdateSpeakBar() end
end

function TW:OnChatLine(event, msg, author, ...)
  if not chatSMF or not chatWin then return end
  local cfg = ChatCfg()
  local info = CHAT_EVENTS[event]
  local label
  if event == "CHAT_MSG_CHANNEL" then
    local num = tonumber((select(6, ...)))
    local hit = false
    for _, sl in ipairs(cfg.slots) do
      if sl.on and sl.num == num then hit = true break end
    end
    if not hit then return end
    info = { "chan", tostring(num), { 1.00, 0.75, 0.75 } }
    label = tostring(num)
  else
    if not info or not cfg[info[1]] then return end
    label = L[info[2]] or info[2]
  end
  if not msg or msg == "" then return end
  if TW.SpamHit and TW:SpamHit(msg) then return end

  -- traduction dans ma langue
  local text, src
  if TW.AutoTranslate then
    local ok, t, sl = pcall(TW.AutoTranslate, msg, ChatTarget())
    if ok then text, src = t, sl end
  end
  local hit = TW.KeywordHit and (TW:KeywordHit(msg) or (text and TW:KeywordHit(text)))
  local me = UnitName and UnitName("player")
  if hit and me and Ambiguate(author, "none"):lower() == me:lower() then hit = nil end
  if cfg.onlyForeign and not text and not hit then return end

  -- nom cliquable, en couleur de classe
  local guid = select(10, ...)
  local color = ""
  if guid and guid ~= "" and GetPlayerInfoByGUID then
    local _, cls = GetPlayerInfoByGUID(guid)
    local cc = cls and RAID_CLASS_COLORS and RAID_CLASS_COLORS[cls]
    if cc then color = ColorHex(cc.r, cc.g, cc.b) end
  end
  local short = Ambiguate(author, "none")
  local who = color .. "|Hplayer:" .. author .. "|h[" .. short .. "]|h" .. (color ~= "" and "|r" or "")

  local r, g, b = unpack(info[3])
  local prefix = ""
  if hit then
    r, g, b = 1, 0.95, 0.3
    prefix = RaidIcon(1) .. " "
  end
  chatSMF:AddMessage(prefix .. "[" .. label .. "] " .. who .. ": " .. Decorate(msg), r, g, b)
  if text then
    chatSMF:AddMessage("      > [" .. string.upper(src or "?") .. "] " .. Decorate(text), 0.85, 0.85, 0.85)
  end
  if hit then TW:FireAlert(hit, who, msg) end
end

local function BuildChatWindow()
  local cfg = ChatCfg()
  local f = CreateFrame("Frame", "TavernChatFrame", Root(), BT)
  chatWin = f
  f:SetSize(math.max(540, cfg.size and cfg.size[1] or 0), math.max(310, cfg.size and cfg.size[2] or 0))
  f:SetFrameStrata("MEDIUM")
  f:SetToplevel(true)
  f:SetMovable(true)
  f:SetResizable(true)
  if f.SetMinResize then f:SetMinResize(510, 250) elseif f.SetResizeBounds then f:SetResizeBounds(510, 250) end
  f:EnableMouse(true)
  f:SetClampedToScreen(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", f.StartMoving)
  f:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local point, _, rel, x, y = self:GetPoint()
    cfg.pos = { point, rel, x, y }
  end)
  local p = cfg.pos
  if p then f:SetPoint(p[1], UIParent, p[2], p[3], p[4]) else f:SetPoint("CENTER", UIParent, "CENTER", 0, 160) end
  f:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 },
  })
  f:Hide()
  -- (volontairement absent de UISpecialFrames : on ne veut pas que le jeu ferme cette fenêtre tout seul)

  local hdr = f:CreateTexture(nil, "ARTWORK")
  hdr:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
  hdr:SetSize(300, 64)
  hdr:SetPoint("TOP", 0, 12)
  local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("TOP", hdr, "TOP", 0, -14)
  title:SetText(L.chatTitle)
  local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", -6, -6)
  close:HookScript("OnClick", function() wanted[f] = false end)

  -- poignée de redimensionnement
  local grip = CreateFrame("Button", nil, f)
  grip:SetSize(16, 16)
  grip:SetPoint("BOTTOMRIGHT", -6, 6)
  grip:SetFrameLevel(f:GetFrameLevel() + 20)
  grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
  grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
  grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
  grip:SetScript("OnMouseDown", function() f:StartSizing("BOTTOMRIGHT") end)
  grip:SetScript("OnMouseUp", function()
    f:StopMovingOrSizing()
    cfg.size = { f:GetWidth(), f:GetHeight() }
    local point, _, rel, x, y = f:GetPoint()
    cfg.pos = { point, rel, x, y }
  end)

  -- boutons de choix des sources
  chatBtns = {}
  local function MakeBtn(key, width, anchorTo, dx)
    local b = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    b:SetSize(width, 22)
    if anchorTo then b:SetPoint("LEFT", anchorTo, "RIGHT", dx or 3, 0) else b:SetPoint("TOPLEFT", f, "TOPLEFT", 18, -30) end
    chatBtns[key] = b
    return b
  end
  local bParty = MakeBtn("party", 62)
  local bChan = MakeBtn("chan", 68, bParty)
  local bChan2 = MakeBtn("chan2", 68, bChan)
  local bGuild = MakeBtn("guild", 54, bChan2)
  local bSay = MakeBtn("say", 46, bGuild)
  local bMode = MakeBtn("mode", 68, bSay, 10)
  local bClear = MakeBtn("clear", 48, bMode)

  local function tip(btn, title, ...)
    local lines = { ... }
    btn:SetScript("OnEnter", function(self)
      GameTooltip:SetOwner(self, "ANCHOR_TOP")
      GameTooltip:SetText(title, 1, 0.82, 0)
      for _, ln in ipairs(lines) do GameTooltip:AddLine(ln, 1, 1, 1, true) end
      GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)
  end
  bParty:SetScript("OnClick", function() cfg.party = not cfg.party; TW:UpdateChatButtons() end)
  bGuild:SetScript("OnClick", function() cfg.guild = not cfg.guild; TW:UpdateChatButtons() end)
  bSay:SetScript("OnClick", function() cfg.say = not cfg.say; TW:UpdateChatButtons() end)
  local function SlotClick(idx)
    return function(_, button)
      local sl = cfg.slots[idx]
      if button == "RightButton" then
        sl.num = (sl.num % 10) + 1
        sl.on = true
      else
        sl.on = not sl.on
      end
      TW:UpdateChatButtons()
    end
  end
  bChan:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  bChan:SetScript("OnClick", SlotClick(1))
  bChan2:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  bChan2:SetScript("OnClick", SlotClick(2))
  bMode:SetScript("OnClick", function() cfg.onlyForeign = not cfg.onlyForeign; TW:UpdateChatButtons() end)
  bClear:SetScript("OnClick", function() chatSMF:Clear() end)
  tip(bParty, L.chatTipT, L.chatTip1)
  tip(bChan, L.chatTipT, L.chanTip)
  tip(bChan2, L.chatTipT, L.chanTip)
  tip(bGuild, L.chatTipT, L.chatTip1)
  tip(bSay, L.chatTipT, L.chatTip1)
  tip(bMode, L.chatTipT, L.modeTip)

  -- zone de messages (ScrollingMessageFrame : liens cliquables, molette)
  chatPanel = CreateFrame("Frame", nil, f, BT)
  chatPanel:SetPoint("TOPLEFT", 16, -58)
  chatPanel:SetPoint("BOTTOMRIGHT", -16, 18)
  chatPanel:SetBackdrop(PANEL_BD)
  chatPanel:SetBackdropColor(unpack(C.panel))
  chatPanel:SetBackdropBorderColor(unpack(C.panelEd))

  local smf = CreateFrame("ScrollingMessageFrame", "TavernChatSMF", chatPanel)
  chatSMF = smf
  smf:SetPoint("TOPLEFT", 8, -8)
  smf:SetPoint("BOTTOMRIGHT", -8, 8)
  if ChatFontNormal then smf:SetFontObject(ChatFontNormal) else smf:SetFontObject(GameFontHighlight) end
  smf:SetJustifyH("LEFT")
  smf:SetMaxLines(500)
  smf:SetFading(false)
  smf:SetHyperlinksEnabled(true)
  smf:EnableMouseWheel(true)
  smf:SetScript("OnMouseWheel", function(self, delta)
    if IsShiftKeyDown() then
      if delta > 0 then self:PageUp() else self:PageDown() end
    else
      if delta > 0 then self:ScrollUp() else self:ScrollDown() end
    end
  end)
  smf:SetScript("OnHyperlinkClick", function(self, link, text, button)
    local pname = link and link:match("^player:([^:]+)")
    if pname and TW.NameMenu then
      TW:NameMenu(pname)
    else
      SetItemRef(link, text, button, DEFAULT_CHAT_FRAME)
    end
  end)
  smf:SetScript("OnHyperlinkEnter", function(self, link)
    if link and not link:find("^player:") then
      GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
      if pcall(GameTooltip.SetHyperlink, GameTooltip, link) then GameTooltip:Show() end
    end
  end)
  smf:SetScript("OnHyperlinkLeave", function() GameTooltip:Hide() end)

  TW:UpdateChatButtons()
  TW:ApplyOpacity()
end

function TW:ChatToggle()
  if not chatWin then return end
  if chatWin:IsShown() then wanted[chatWin] = false; chatWin:Hide() else chatWin:Show() end
end

-- petit bouton globe, à droite de la bulle messenger
local function BuildChatLauncher()
  local b = CreateFrame("Button", "TavernChatLauncher", Root(), BT)
  chatLauncher = b
  b:SetSize(106, 30)
  b:SetFrameStrata("MEDIUM")
  b:SetBackdrop(PANEL_BD)
  b:SetBackdropColor(unpack(C.panel))
  b:SetBackdropBorderColor(unpack(C.panelEd))
  b:SetPoint("LEFT", launcher, "RIGHT", 4, 0)
  local t = b:CreateTexture(nil, "ARTWORK")
  t:SetSize(22, 22)
  t:SetPoint("LEFT", 6, 0)
  t:SetTexture("Interface\\AddOns\\TavernWhispers\\Media\\globe.tga")
  local lbl = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  lbl:SetPoint("LEFT", t, "RIGHT", 4, 0)
  lbl:SetText(L.chatBtnLabel)
  b:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
  b:SetScript("OnClick", function() TW:ChatToggle() end)
  b:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(L.chatBtnTip, 1, 0.82, 0)
    GameTooltip:Show()
  end)
  b:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

-- Carte du monde : elle recouvre tout l'écran (couche FULLSCREEN). Tant qu'elle est ouverte,
-- nos fenêtres passent au-dessus ; ensuite elles reviennent au niveau des autres fenêtres du jeu.
local function UpdateStrataForMap()
  local mapOpen = WorldMapFrame and WorldMapFrame:IsShown()
  local strata = mapOpen and "FULLSCREEN_DIALOG" or "MEDIUM"
  for _, fr in ipairs({ mainFrame, chatWin, launcher, chatLauncher, settingsWin }) do
    if fr then fr:SetFrameStrata(strata) end
  end
end

-- Racine indépendante de UIParent : si la carte (ou un mode plein écran) cache UIParent, nos fenêtres restent
local function BuildRoot()
  local root = CreateFrame("Frame", "TavernRoot", nil)
  TW.root = root
  root:SetAllPoints()
  root:SetFrameLevel(8)
  root:SetScale(UIParent:GetEffectiveScale())
  TW.rootScale = UIParent:GetEffectiveScale()
end

function TW:SyncRoot()
  local root = self.root
  if not root then return end
  -- la racine n'a pas de parent : son échelle effective est la sienne, on l'aligne sur celle de l'interface
  local scale = UIParent:GetEffectiveScale()
  if scale and scale > 0 and scale ~= self.rootScale then
    root:SetScale(scale)
    self.rootScale = scale
  end
  local mapOpen = WorldMapFrame and WorldMapFrame:IsShown()
  if UIParent:IsShown() or mapOpen then root:Show() else root:Hide() end
end

-- si le jeu cache une de nos fenêtres alors que l'utilisateur ne l'a pas fermée, on la rouvre
local function TrackWindow(fr)
  if not fr then return end
  fr:HookScript("OnShow", function() wanted[fr] = true end)
  fr:HookScript("OnHide", function()
    if wanted[fr] then
      After(0.05, function()
        if wanted[fr] and not fr:IsShown() then fr:Show() end
      end)
    end
  end)
end

local function LogMap(tag)
  After(0.3, function()
    TW.mapLog = string.format("%s -> UIParent=%s, carte=%s, fenetre=%s, traduction=%s, racine=%s",
      tag, tostring(UIParent:IsShown()), tostring(WorldMapFrame and WorldMapFrame:IsShown()),
      tostring(mainFrame and mainFrame:IsShown()), tostring(chatWin and chatWin:IsShown()),
      tostring(TW.root and TW.root:IsShown()))
  end)
end

local function HookMap()
  local function OnMap(tag)
    TW:SyncRoot()
    UpdateStrataForMap()
    LogMap(tag)
  end
  if WorldMapFrame and WorldMapFrame.HookScript then
    WorldMapFrame:HookScript("OnShow", function() OnMap("carte ouverte") end)
    WorldMapFrame:HookScript("OnHide", function() OnMap("carte fermee") end)
  end
  if UIParent and UIParent.HookScript then
    UIParent:HookScript("OnShow", function() TW:SyncRoot() end)
    UIParent:HookScript("OnHide", function() After(0.05, function() TW:SyncRoot() end) end)
  end
  TW:SyncRoot()
  UpdateStrataForMap()

  -- vérification régulière (toutes les 2 s) de l'échelle de l'interface
  local poll = CreateFrame("Frame")
  local acc = 0
  poll:SetScript("OnUpdate", function(_, elapsed)
    acc = acc + (elapsed or 0)
    if acc >= 2 then
      acc = 0
      TW:SyncRoot()
    end
  end)
end

-- bouton "Archives" sous la liste des conversations
local function BuildArchiveUI()
  if not listFrame then return end
  archBtn = CreateFrame("Button", nil, listFrame, "UIPanelButtonTemplate")
  archBtn:SetHeight(20)
  archBtn:SetPoint("BOTTOMLEFT", listFrame, "BOTTOMLEFT", 8, 8)
  archBtn:SetPoint("BOTTOMRIGHT", listFrame, "BOTTOMRIGHT", -8, 8)
  archBtn:SetScript("OnClick", function()
    TW.showArchived = not TW.showArchived
    TW:RefreshList()
  end)
  archBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText(L.archiveBtn, 1, 0.82, 0)
    GameTooltip:AddLine(L.archiveOpenTip, 1, 1, 1, true)
    GameTooltip:Show()
  end)
  archBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
  local ls = _G["TavernWhispersListScroll"]
  if ls then ls:SetPoint("BOTTOMRIGHT", listFrame, "BOTTOMRIGHT", -26, 34) end
  TW:UpdateArchiveButton()
end

-- pré-chauffage des dictionnaires, étalé dans le temps (évite un à-coup au premier message)
local function WarmLang()
  if not (TW.Gloss and TW.Translate and TW.DetectLang) then return end
  local steps = {
    function() TW.Translate("bonjour", "fren") end,
    function() TW.Translate("hello", "enfr") end,
    function() TW.DetectLang("hello", "fr") end,
    function() TW.Gloss("hallo", "de") end,
    function() TW.Gloss("hola", "es") end,
    function() TW.Gloss("ola", "pt") end,
    function() TW.Gloss("ciao", "it") end,
    function() TW.Gloss("привет", "ru") end,
  }
  for i, fn in ipairs(steps) do
    After(6 + i, function() pcall(fn) end)
  end
end

----------------------------------------------------------------------
-- Ne pas déranger : réponses automatiques
----------------------------------------------------------------------
local DND_DEFAULT = {
  combat   = { fr = "Je suis en combat, je te réponds tout de suite !",
               en = "I'm in combat, I'll answer you right away!" },
  bg       = { fr = "Je suis en champ de bataille, je vais mettre du temps à te répondre.",
               en = "I'm in a battleground, it will take me a while to answer." },
  instance = { fr = "Je suis en donjon, je vais mettre du temps à te répondre.",
               en = "I'm in a dungeon, it will take me a while to answer." },
  dnd      = { fr = "Je suis indisponible pour l'instant, je te répondrai plus tard.",
               en = "I'm unavailable right now, I'll get back to you later." },
}
local DND_KEYS = { "combat", "bg", "instance", "dnd" }
local lastAuto = {}
local settingsChecks = {}

-- retourne "dnd" / "bg" / "instance" / "combat" ou nil (priorité dans cet ordre)
function TW:DndState()
  local d = db.dnd
  if not d then return nil end
  if d.manual then return "dnd" end
  local _, itype = IsInInstance()
  if (itype == "pvp" or itype == "arena") and d.bg then return "bg" end
  if (itype == "party" or itype == "raid") and d.instance then return "instance" end
  if d.combat and ((UnitAffectingCombat and UnitAffectingCombat("player")) or InCombatLockdown()) then
    return "combat"
  end
  return nil
end

-- message à envoyer, dans la langue de l'interlocuteur (FR ou EN)
function TW:DndMessage(state, incoming)
  local def = DND_DEFAULT[state]
  local custom = db.dnd.msgs[state]
  local src = TW.DetectLang and TW.DetectLang(incoming or "", "fr")
  local useFR
  if src == "fr" then useFR = true elseif src then useFR = false else useFR = isFR end
  if useFR then return custom or def.fr end
  if not custom or custom == def.fr or custom == def.en then return def.en end
  local ok, en = pcall(TW.Translate, custom, "fren")
  return (ok and en) or def.en
end

function TW:MaybeAutoReply(author, msg, flags)
  local state = self:DndState()
  if not state or not author then return end
  if flags == "GM" or flags == "DEV" then return end
  if msg and msg:find("^%[Auto%]") then return end -- jamais de boucle entre deux réponses automatiques
  local me = UnitName and UnitName("player")
  if me and Ambiguate(author, "none"):lower() == me:lower() then return end
  local key = author:lower() .. ":" .. state
  local now = GetTime()
  local cooldown = (state == "combat") and 60 or 600
  if lastAuto[key] and (now - lastAuto[key]) < cooldown then return end
  lastAuto[key] = now
  local text = self:DndMessage(state, msg)
  if text and text ~= "" then
    SendChatMessage("[Auto] " .. text, "WHISPER", nil, author)
  end
end

function TW:UpdateDndIndicator()
  if not launcher then return end
  if db.dnd.manual then
    launcher:SetBackdropBorderColor(0.95, 0.2, 0.2, 1)
  elseif self:DndState() then
    launcher:SetBackdropBorderColor(1, 0.6, 0.1, 1)
  else
    launcher:SetBackdropBorderColor(unpack(C.panelEd))
  end
end

function TW:ToggleDnd(force)
  local d = db.dnd
  if force == nil then d.manual = not d.manual else d.manual = force and true or false end
  Print(L.dndLabel .. " : " .. (d.manual and L.on or L.off))
  if settingsChecks.manual then settingsChecks.manual:SetChecked(d.manual) end
  self:UpdateDndIndicator()
end

----------------------------------------------------------------------
-- Zone de saisie sûre : le clavier retourne au jeu dès qu'on clique en dehors
----------------------------------------------------------------------
local function GuardEditBox(box, owner)
  box:SetAutoFocus(false)
  local w = CreateFrame("Frame")
  w:Hide()
  w:SetScript("OnUpdate", function()
    if (IsMouseButtonDown("LeftButton") or IsMouseButtonDown("RightButton")) and not MouseIsOver(owner) then
      box:ClearFocus()
    end
  end)
  box:HookScript("OnEditFocusGained", function() w:Show() end)
  box:HookScript("OnEditFocusLost", function() w:Hide() end)
  box:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  owner:HookScript("OnHide", function() box:ClearFocus() end)
end

----------------------------------------------------------------------
-- Fenêtre de réglages
----------------------------------------------------------------------
local function BuildSettings()
  local f = CreateFrame("Frame", "TavernSettingsFrame", Root(), BT)
  settingsWin = f
  f:SetSize(420, 570)
  f:SetPoint("CENTER")
  f:SetFrameStrata("MEDIUM")
  f:SetToplevel(true)
  f:SetMovable(true)
  f:EnableMouse(true)
  f:SetClampedToScreen(true)
  f:RegisterForDrag("LeftButton")
  f:SetScript("OnDragStart", f.StartMoving)
  f:SetScript("OnDragStop", f.StopMovingOrSizing)
  f:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 },
  })
  f:Hide()
  -- (volontairement absent de UISpecialFrames : on ne veut pas que le jeu ferme cette fenêtre tout seul)

  local hdr = f:CreateTexture(nil, "ARTWORK")
  hdr:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
  hdr:SetSize(300, 64)
  hdr:SetPoint("TOP", 0, 12)
  local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("TOP", hdr, "TOP", 0, -14)
  title:SetText(L.setTitle)
  local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", -6, -6)
  close:HookScript("OnClick", function() wanted[f] = false end)

  local y = -40
  local function Header(text)
    local fs = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fs:SetPoint("TOPLEFT", 24, y)
    fs:SetText(text)
    y = y - 22
  end
  local function Check(key, label, get, set)
    local name = "TavernSetCheck_" .. key
    local cb = CreateFrame("CheckButton", name, f, "OptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", 20, y + 2)
    local txt = _G[name .. "Text"]
    if txt then txt:SetText(label) end
    cb:SetChecked(get())
    cb:SetScript("OnClick", function(self)
      set(self:GetChecked() and true or false)
      TW:UpdateDndIndicator()
    end)
    cb.get = get
    settingsChecks[key] = cb
    y = y - 26
  end

  Header(L.secNotif)
  Check("sound", L.o_sound, function() return db.opts.sound end, function(v) db.opts.sound = v end)
  Check("hide", L.o_hide, function() return db.opts.hideDefault end, function(v) db.opts.hideDefault = v end)
  Check("auto", L.o_auto, function() return db.opts.autoOpen end, function(v) db.opts.autoOpen = v end)
  Check("inter", L.o_inter, function() return db.opts.intercept end, function(v) db.opts.intercept = v end)
  y = y - 8
  Header(L.secDnd)
  Check("manual", L.dndManual, function() return db.dnd.manual end, function(v) db.dnd.manual = v end)
  Check("combat", L.dndCombat, function() return db.dnd.combat end, function(v) db.dnd.combat = v end)
  Check("bg", L.dndBG, function() return db.dnd.bg end, function(v) db.dnd.bg = v end)
  Check("instance", L.dndInst, function() return db.dnd.instance end, function(v) db.dnd.instance = v end)
  y = y - 8
  Header(L.secMsgs)

  local labels = { combat = L.msgCombat, bg = L.msgBG, instance = L.msgInst, dnd = L.msgDnd }
  f.boxes = {}
  for _, key in ipairs(DND_KEYS) do
    local lab = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lab:SetPoint("TOPLEFT", 26, y)
    lab:SetText(labels[key])
    y = y - 16
    local eb = CreateFrame("EditBox", "TavernSetMsg_" .. key, f, "InputBoxTemplate")
    eb:SetWidth(360)
    eb:SetHeight(22)
    eb:SetPoint("TOPLEFT", 30, y)
    eb:SetMaxLetters(200)
    local function Commit()
      local t = (eb:GetText() or ""):gsub("^%s+", ""):gsub("%s+$", "")
      local def = DND_DEFAULT[key]
      if t == "" or t == def.fr or t == def.en then
        db.dnd.msgs[key] = nil
        eb:SetText(def[isFR and "fr" or "en"])
      else
        db.dnd.msgs[key] = t
      end
    end
    eb:SetScript("OnEnterPressed", function(self) Commit(); self:ClearFocus() end)
    eb:HookScript("OnEditFocusLost", Commit)
    GuardEditBox(eb, f)
    f.boxes[key] = eb
    y = y - 30
  end

  local hint = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  hint:SetPoint("BOTTOMLEFT", 26, 22)
  hint:SetWidth(368)
  hint:SetJustifyH("LEFT")
  hint:SetText(L.setHint)

  f:SetScript("OnShow", function()
    for _, cb in pairs(settingsChecks) do cb:SetChecked(cb.get()) end
    for key, eb in pairs(f.boxes) do
      eb:SetText(db.dnd.msgs[key] or DND_DEFAULT[key][isFR and "fr" or "en"])
      eb:SetCursorPosition(0)
    end
  end)
end

function TW:SettingsToggle()
  if not settingsWin then return end
  if settingsWin:IsShown() then wanted[settingsWin] = false; settingsWin:Hide() else settingsWin:Show() end
end

----------------------------------------------------------------------
-- Alertes mots-clés (fenêtre Trad)
----------------------------------------------------------------------
local kwRows = {}
local lastAlertSound = 0

function TW:KeywordHit(s)
  local list = db.chat.keywords
  if not list or #list == 0 or not s then return nil end
  local ls = s:lower()
  for _, kw in ipairs(list) do
    if ls:find(kw, 1, true) then return kw end
  end
  return nil
end

function TW:FireAlert(kw, who, msg)
  local cfg = db.chat
  if cfg.alertSound and not db.dnd.manual then
    local now = GetTime()
    if now - lastAlertSound > 2 then
      lastAlertSound = now
      PlaySound("MapPing")
    end
  end
  if cfg.alertPrint and DEFAULT_CHAT_FRAME then
    DEFAULT_CHAT_FRAME:AddMessage("|cffffd100[" .. L.alertWord .. ": " .. kw .. "]|r " .. who .. ": " .. Decorate(msg))
  end
end

function TW:AddKeyword(word)
  word = (word or ""):gsub("^%s+", ""):gsub("%s+$", ""):lower()
  if #word < 2 or #word > 30 then return false end
  local list = db.chat.keywords
  for _, k in ipairs(list) do
    if k == word then return false end
  end
  if #list >= 15 then
    Print(L.alertMax)
    return false
  end
  list[#list + 1] = word
  self:RefreshKeywords()
  return true
end

function TW:RemoveKeyword(word)
  if not word then return end
  local list = db.chat.keywords
  for i, k in ipairs(list) do
    if k == word then
      table.remove(list, i)
      break
    end
  end
  self:RefreshKeywords()
end

function TW:RefreshKeywords()
  if not kwPopup then return end
  local list = db.chat.keywords
  for i = 1, 15 do
    local row = kwRows[i]
    if row then
      if list[i] then
        row.word = list[i]
        row.text:SetText(list[i])
        row:Show()
      else
        row:Hide()
      end
    end
  end
  kwPopup.empty:SetShown(#list == 0)
  kwPopup:SetHeight(112 + math.max(1, #list) * 22 + 62)
  if alertBtn then
    alertBtn:SetText(L.alertBtn .. (#list > 0 and (" (" .. #list .. ")") or ""))
  end
end

local function BuildKeywordsPopup()
  if not chatWin then return end
  alertBtn = CreateFrame("Button", nil, chatWin, "UIPanelButtonTemplate")
  alertBtn:SetSize(78, 20)
  alertBtn:SetPoint("TOPRIGHT", chatWin, "TOPRIGHT", -34, -9)

  local f = CreateFrame("Frame", "TavernKeywordsFrame", chatWin, BT)
  kwPopup = f
  f:SetSize(270, 220)
  f:SetPoint("TOPRIGHT", alertBtn, "BOTTOMRIGHT", 0, -2)
  f:SetFrameLevel(chatWin:GetFrameLevel() + 30)
  f:SetBackdrop(PANEL_BD)
  f:SetBackdropColor(0.08, 0.05, 0.03, 0.98)
  f:SetBackdropBorderColor(unpack(C.panelEd))
  f:EnableMouse(true)
  f:Hide()

  local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("TOPLEFT", 12, -10)
  title:SetText(L.alertTitle)

  local eb = CreateFrame("EditBox", "TavernKeywordInput", f, "InputBoxTemplate")
  eb:SetWidth(160)
  eb:SetHeight(22)
  eb:SetPoint("TOPLEFT", 16, -32)
  eb:SetMaxLetters(30)
  local add = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  add:SetSize(78, 22)
  add:SetPoint("LEFT", eb, "RIGHT", 6, 0)
  add:SetText(L.alertAdd)
  local function DoAdd()
    if TW:AddKeyword(eb:GetText()) then eb:SetText("") end
  end
  add:SetScript("OnClick", DoAdd)
  eb:SetScript("OnEnterPressed", function(self) DoAdd(); self:ClearFocus() end)
  GuardEditBox(eb, f)

  local hint = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  hint:SetPoint("TOPLEFT", 12, -60)
  hint:SetWidth(246)
  hint:SetJustifyH("LEFT")
  hint:SetText(L.alertHint)

  f.empty = f:CreateFontString(nil, "OVERLAY", "GameFontDisable")
  f.empty:SetPoint("TOPLEFT", 16, -116)
  f.empty:SetText(L.alertEmpty)

  for i = 1, 15 do
    local row = CreateFrame("Frame", nil, f)
    row:SetSize(246, 20)
    row:SetPoint("TOPLEFT", 12, -112 - (i - 1) * 22)
    row.text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.text:SetPoint("LEFT", 4, 0)
    local x = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
    x:SetSize(22, 18)
    x:SetPoint("RIGHT", 0, 0)
    x:SetText("x")
    x:SetScript("OnClick", function() TW:RemoveKeyword(row.word) end)
    row:Hide()
    kwRows[i] = row
  end

  local function Check(name, label, key, y)
    local cb = CreateFrame("CheckButton", name, f, "OptionsCheckButtonTemplate")
    cb:SetPoint("BOTTOMLEFT", 10, y)
    local txt = _G[name .. "Text"]
    if txt then txt:SetText(label) end
    cb:SetScript("OnClick", function(self) db.chat[key] = self:GetChecked() and true or false end)
    cb.key = key
    return cb
  end
  local cbSound = Check("TavernKwSound", L.alertSound, "alertSound", 32)
  local cbPrint = Check("TavernKwPrint", L.alertPrint, "alertPrint", 8)

  f:SetScript("OnShow", function()
    cbSound:SetChecked(db.chat.alertSound)
    cbPrint:SetChecked(db.chat.alertPrint)
    TW:RefreshKeywords()
  end)
  alertBtn:SetScript("OnClick", function()
    if f:IsShown() then f:Hide() else f:Show() end
  end)
  chatWin:HookScript("OnHide", function() f:Hide() end)
  TW:RefreshKeywords()
end

----------------------------------------------------------------------
-- Parler dans le chat depuis la fenêtre Traduction (avec correction + traduction)
----------------------------------------------------------------------
local SPEAK_ORDER = { "party", "guild", "say", "c1", "c2" }
local speakUI = {}

local function SpeakLabel(key)
  local sl = db.chat.slots
  if key == "party" then return L.cParty end
  if key == "guild" then return L.cGuild end
  if key == "say" then return L.cSay end
  if key == "c1" then return L.cChan .. " " .. sl[1].num end
  return L.cChan .. " " .. sl[2].num
end

-- correction puis traduction du texte que vous allez envoyer
function TW:SpeakPrepare(text)
  local cfg = db.chat
  local out = text
  if db.opts.spell and TW.Correct then
    out = TW.Correct(out, (cfg.speakTr == "enfr") and "en" or "fr")
  end
  if cfg.speakTr and TW.TranslateOut then
    local t = TW.TranslateOut(out, cfg.speakTr)
    if t and t ~= "" then out = t end
  end
  return out
end

function TW:SpeakSend(text)
  if not text or text == "" then return end
  local cfg = db.chat
  local out = self:SpeakPrepare(text)
  for _, piece in ipairs(Chunk(out, 250)) do
    local to = cfg.speakTo
    if to == "guild" then
      SendChatMessage(piece, "GUILD")
    elseif to == "say" then
      SendChatMessage(piece, "SAY")
    elseif to == "c1" or to == "c2" then
      SendChatMessage(piece, "CHANNEL", nil, cfg.slots[to == "c1" and 1 or 2].num)
    else
      local _, itype = IsInInstance()
      local chatType = "PARTY"
      if itype == "pvp" then
        chatType = "BATTLEGROUND"
      elseif (GetNumRaidMembers and GetNumRaidMembers() or 0) > 0 then
        chatType = "RAID"
      end
      SendChatMessage(piece, chatType)
    end
  end
end

function TW:UpdateSpeakBar()
  if not speakUI.toBtn then return end
  local cfg = db.chat
  speakUI.toBtn:SetText("|cffffd100" .. SpeakLabel(cfg.speakTo) .. "|r")
  local tr = cfg.speakTr
  if tr == "fren" then
    speakUI.trBtn:SetText("|cff66ff66FR>EN|r")
  elseif tr == "enfr" then
    speakUI.trBtn:SetText("|cff66ff66EN>FR|r")
  elseif tr then
    speakUI.trBtn:SetText("|cff66ff66FR>" .. tr:upper() .. "|r")
  else
    speakUI.trBtn:SetText("|cff999999" .. L.speakTrOff .. "|r")
  end
  self:UpdateSpeakPreview()
end

function TW:UpdateSpeakPreview()
  if not speakUI.preview then return end
  local t = speakUI.input:GetText() or ""
  if t ~= "" and db.chat.speakTr then
    speakUI.preview:SetText("|cff9d9d9d> |r" .. Decorate(self:SpeakPrepare(t)))
  else
    speakUI.preview:SetText("")
  end
end

local function BuildSpeakBar()
  if not (chatWin and chatPanel) then return end
  local cfg = db.chat
  local f = chatWin
  -- la zone de messages laisse la place à la barre du bas
  chatPanel:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -16, 66)

  local trBtn2 = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  trBtn2:SetSize(70, 22)
  trBtn2:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -28, 20)
  local toBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  toBtn:SetSize(84, 22)
  toBtn:SetPoint("RIGHT", trBtn2, "LEFT", -3, 0)

  local input = CreateFrame("EditBox", "TavernSpeakInput", f, "InputBoxTemplate")
  input:SetHeight(22)
  input:SetMaxLetters(255)
  input:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 24, 20)
  input:SetPoint("BOTTOMRIGHT", toBtn, "BOTTOMLEFT", -8, 0)
  input:SetScript("OnEnterPressed", function(self)
    local text = self:GetText()
    if text and text ~= "" then TW:SpeakSend(text) end
    self:SetText("")
    self:ClearFocus()
  end)
  input:SetScript("OnTextChanged", function() TW:UpdateSpeakPreview() end)
  GuardEditBox(input, f)

  local preview = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  preview:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 26, 46)
  preview:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -20, 46)
  preview:SetJustifyH("LEFT")
  preview:SetWordWrap(false)
  preview:SetTextColor(1, 0.82, 0)

  -- destination : groupe -> guilde -> dire -> canal 1 -> canal 2
  toBtn:SetScript("OnClick", function()
    local cur = 1
    for i, k in ipairs(SPEAK_ORDER) do if k == cfg.speakTo then cur = i end end
    cfg.speakTo = SPEAK_ORDER[(cur % #SPEAK_ORDER) + 1]
    TW:UpdateSpeakBar()
  end)
  -- traduction : FR>EN -> EN>FR -> aucune
  trBtn2:SetScript("OnClick", function()
    if cfg.speakTr == "fren" then cfg.speakTr = "enfr"
    elseif cfg.speakTr == "enfr" then cfg.speakTr = TW.OUT_LANGS[1]
    elseif cfg.speakTr then
      local nxt
      for i, code in ipairs(TW.OUT_LANGS) do if code == cfg.speakTr then nxt = TW.OUT_LANGS[i + 1] end end
      cfg.speakTr = nxt or false
    else cfg.speakTr = "fren" end
    TW:UpdateSpeakBar()
  end)
  local function tip(btn)
    btn:SetScript("OnEnter", function(self)
      GameTooltip:SetOwner(self, "ANCHOR_TOP")
      GameTooltip:SetText(L.speakTipT, 1, 0.82, 0)
      GameTooltip:AddLine(L.speakTip1, 1, 1, 1, true)
      GameTooltip:AddLine(L.speakTip2, 0.8, 0.8, 0.8, true)
      GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)
  end
  tip(toBtn)
  tip(trBtn2)

  speakUI.input, speakUI.toBtn, speakUI.trBtn, speakUI.preview = input, toBtn, trBtn2, preview
  TW:UpdateSpeakBar()
end

----------------------------------------------------------------------
-- Filtre anti-spam (fenêtre Traduction)
----------------------------------------------------------------------
local spamUI = { rows = {} }

function TW:SpamHit(s)
  local list = db.chat.spam
  if not list or #list == 0 or not s then return false end
  local ls = s:lower()
  for _, w in ipairs(list) do
    if ls:find(w, 1, true) then return true end
  end
  return false
end

function TW:AddSpam(word)
  word = (word or ""):gsub("^%s+", ""):gsub("%s+$", ""):lower()
  if #word < 2 or #word > 30 then return false end
  local list = db.chat.spam
  for _, k in ipairs(list) do
    if k == word then return false end
  end
  if #list >= 15 then
    Print(L.alertMax)
    return false
  end
  list[#list + 1] = word
  self:RefreshSpam()
  return true
end

function TW:RemoveSpam(word)
  if not word then return end
  local list = db.chat.spam
  for i, k in ipairs(list) do
    if k == word then
      table.remove(list, i)
      break
    end
  end
  self:RefreshSpam()
end

function TW:RefreshSpam()
  local pop = spamUI.popup
  if not pop then return end
  local list = db.chat.spam
  for i = 1, 15 do
    local row = spamUI.rows[i]
    if row then
      if list[i] then
        row.word = list[i]
        row.text:SetText(list[i])
        row:Show()
      else
        row:Hide()
      end
    end
  end
  pop.empty:SetShown(#list == 0)
  pop:SetHeight(112 + math.max(1, #list) * 22 + 14)
  if spamUI.btn then
    spamUI.btn:SetText(L.spamBtn .. (#list > 0 and (" (" .. #list .. ")") or ""))
  end
end

local function BuildSpamPopup()
  if not (chatWin and alertBtn) then return end
  local btn = CreateFrame("Button", nil, chatWin, "UIPanelButtonTemplate")
  btn:SetSize(66, 20)
  btn:SetPoint("RIGHT", alertBtn, "LEFT", -4, 0)

  local f = CreateFrame("Frame", "TavernSpamFrame", chatWin, BT)
  spamUI.popup, spamUI.btn = f, btn
  f:SetSize(270, 200)
  f:SetPoint("TOPRIGHT", btn, "BOTTOMRIGHT", 0, -2)
  f:SetFrameLevel(chatWin:GetFrameLevel() + 30)
  f:SetBackdrop(PANEL_BD)
  f:SetBackdropColor(0.08, 0.05, 0.03, 0.98)
  f:SetBackdropBorderColor(unpack(C.panelEd))
  f:EnableMouse(true)
  f:Hide()

  local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("TOPLEFT", 12, -10)
  title:SetText(L.spamTitle)

  local eb = CreateFrame("EditBox", "TavernSpamInput", f, "InputBoxTemplate")
  eb:SetWidth(160)
  eb:SetHeight(22)
  eb:SetPoint("TOPLEFT", 16, -32)
  eb:SetMaxLetters(30)
  local add = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
  add:SetSize(78, 22)
  add:SetPoint("LEFT", eb, "RIGHT", 6, 0)
  add:SetText(L.alertAdd)
  local function DoAdd()
    if TW:AddSpam(eb:GetText()) then eb:SetText("") end
  end
  add:SetScript("OnClick", DoAdd)
  eb:SetScript("OnEnterPressed", function(self) DoAdd(); self:ClearFocus() end)
  GuardEditBox(eb, f)

  local hint = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
  hint:SetPoint("TOPLEFT", 12, -60)
  hint:SetWidth(246)
  hint:SetJustifyH("LEFT")
  hint:SetText(L.spamHint)

  f.empty = f:CreateFontString(nil, "OVERLAY", "GameFontDisable")
  f.empty:SetPoint("TOPLEFT", 16, -116)
  f.empty:SetText(L.spamEmpty)

  for i = 1, 15 do
    local row = CreateFrame("Frame", nil, f)
    row:SetSize(246, 20)
    row:SetPoint("TOPLEFT", 12, -112 - (i - 1) * 22)
    row.text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.text:SetPoint("LEFT", 4, 0)
    local x = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
    x:SetSize(22, 18)
    x:SetPoint("RIGHT", 0, 0)
    x:SetText("x")
    x:SetScript("OnClick", function() TW:RemoveSpam(row.word) end)
    row:Hide()
    spamUI.rows[i] = row
  end

  btn:SetScript("OnClick", function()
    if f:IsShown() then f:Hide() else f:Show() end
  end)
  f:SetScript("OnShow", function() TW:RefreshSpam() end)
  chatWin:HookScript("OnHide", function() f:Hide() end)
  TW:RefreshSpam()
end

----------------------------------------------------------------------
-- Menus déroulants (remplacent les petits boutons rouges sans texte)
----------------------------------------------------------------------
local menuFrame, menuClose

local function ShowMenu(list)
  if not menuFrame then
    menuFrame = CreateFrame("Frame", "TavernMenuFrame", UIParent, "UIDropDownMenuTemplate")
  end
  EasyMenu(list, menuFrame, "cursor", 0, 0, "MENU")

  -- petite croix en haut à droite du menu (la liste du jeu est partagée : la croix n'apparaît que pour nos menus)
  local dd = _G["DropDownList1"]
  if dd then
    if not menuClose then
      menuClose = CreateFrame("Button", "TavernMenuClose", dd, "UIPanelCloseButton")
      menuClose:SetSize(22, 22)
      menuClose:SetPoint("TOPRIGHT", dd, "TOPRIGHT", 3, 3)
      menuClose:SetScript("OnClick", function() CloseDropDownMenus() end)
      dd:HookScript("OnHide", function() menuClose:Hide() end)
      TW.menuCloseBtn = menuClose
    end
    menuClose:SetFrameLevel(dd:GetFrameLevel() + 20)
    menuClose:Show()
  end
end

local function Title(text) return { text = text, isTitle = true, notCheckable = true } end

-- menu du bas : correcteur + traduction de MES messages (dépend de la conversation ouverte)
local function ToolsMenuList()
  local c = CurrentConv()
  local mode = db.opts.spellLang or "auto"
  local function spellRadio(m, text)
    return { text = text, checked = (mode == m), func = function()
      db.opts.spellLang = m
      db.opts.spell = true
      TW:UpdateSpellButton()
      TW:UpdatePreview()
    end }
  end
  local function trRadio(m, text)
    return { text = text, checked = ((c and c.tr or false) == m), func = function()
      if c then
        c.tr = m or nil
        c.trAuto = nil
        TW:UpdateHeader()
        TW:RenderMessages()
      end
    end }
  end
  local list = {
    Title(L.menuSpell),
    { text = L.menuOn, isNotRadio = true, checked = db.opts.spell and true or false, func = function()
      db.opts.spell = not db.opts.spell
      TW:UpdateSpellButton()
      TW:UpdatePreview()
    end },
    spellRadio("auto", L.menuLangAuto),
    spellRadio("fr", L.menuLangFr),
    spellRadio("en", L.menuLangEn),
    Title(L.menuTr),
    c and trRadio(false, L.menuTrNone) or { text = L.menuNoConv, notCheckable = true, disabled = true },
    c and trRadio("fren", L.menuTrFrEn) or nil,
    c and trRadio("enfr", L.menuTrEnFr) or nil,
  }
  if c then
    for _, code in ipairs(TW.OUT_LANGS or {}) do
      list[#list + 1] = trRadio(code, string.format(L.menuTrOut, LANG_NAMES[code] or code))
    end
    list[#list + 1] = { text = L.menuTrAuto, isNotRadio = true, checked = c.trAuto and true or false, func = function()
      c.trAuto = not c.trAuto or nil
      TW:UpdateHeader()
    end }
  end
  return list
end

-- menu au clic sur un nom dans la fenêtre Traduction
function TW:NameMenu(author)
  local disp = Ambiguate(author, "none")
  local function levelInfo()
    local lvl, cls
    local units = { "target", "mouseover", "focus" }
    for i = 1, 4 do units[#units + 1] = "party" .. i end
    for i = 1, 40 do units[#units + 1] = "raid" .. i end
    for _, u in ipairs(units) do
      if UnitExists(u) and UnitName(u) and UnitName(u):lower() == disp:lower() then
        lvl, cls = UnitLevel(u), UnitClass(u)
        break
      end
    end
    if not lvl then
      local tmp = { name = disp }
      TW:LookupInfo(tmp)
      lvl, cls = tmp.level, tmp.class
    end
    if lvl and lvl > 0 then
      Print(disp .. " : " .. (isFR and "niveau " or "level ") .. lvl .. (cls and (" " .. tostring(cls)) or ""))
    else
      Print(disp .. " : " .. L.nmLevelUnk)
    end
  end
  ShowMenu({
    Title(disp),
    { text = L.nmWhisper, notCheckable = true, func = function() TW:OpenWith(author, true) end },
    { text = L.nmInvite, notCheckable = true, func = function() if InviteUnit then InviteUnit(disp) end end },
    { text = L.nmFriend, notCheckable = true, func = function() if AddFriend then AddFriend(disp) end end },
    { text = L.nmIgnore, notCheckable = true, func = function() if AddIgnore then AddIgnore(disp) end end },
    { text = L.nmLevel, notCheckable = true, func = levelInfo },
  })
end

-- menu de la barre de titre : fenêtre, lecture, opacité, ne pas déranger
local function WindowMenuList()
  local r = ReadTarget()
  local a = db.opts.opacity or 1
  local function read(m, text)
    return { text = text, checked = (r == m), func = function()
      db.opts.readLang = m
      TW:UpdateReadButton()
      TW:RenderMessages()
    end }
  end
  local function opacity(v)
    return { text = math.floor(v * 100 + 0.5) .. " %", checked = (math.abs(a - v) < 0.03), func = function()
      db.opts.opacity = v
      local sl = _G["TavernWhispersOpacitySlider"]
      if sl and sl.SetValue then sl:SetValue(v) end
      TW:ApplyOpacity()
    end }
  end
  return {
    Title(L.title),
    { text = L.setBtn .. "...", notCheckable = true, func = function() TW:SettingsToggle() end },
    { text = L.dndLabel, isNotRadio = true, checked = db.dnd.manual and true or false, func = function() TW:ToggleDnd() end },
    Title(L.menuRead),
    read("fr", L.menuReadFr),
    read("en", L.menuReadEn),
    read("off", L.menuReadOff),
    Title(L.menuOpacity),
    opacity(1), opacity(0.8), opacity(0.6), opacity(0.4), opacity(0.3), opacity(0.2),
  }
end

local function BuildMenus()
  if not (mainFrame and chatFrame and emoBtn) then return end

  -- les anciens petits boutons restent créés (le reste du code s'y réfère) mais ne sont plus affichés
  for _, b in ipairs({ optBtn, readBtn, opacityBtn, spellBtn, trBtn }) do
    if b then b:Hide() end
  end

  local menuBtn = CreateFrame("Button", nil, mainFrame, "UIPanelButtonTemplate")
  menuBtn:SetSize(66, 20)
  menuBtn:SetPoint("TOPRIGHT", mainFrame, "TOPRIGHT", -34, -9)
  menuBtn:SetText(L.menuBtn)
  menuBtn:SetScript("OnClick", function() ShowMenu(WindowMenuList()) end)

  local toolsBtn = CreateFrame("Button", nil, chatFrame, "UIPanelButtonTemplate")
  toolsBtn:SetSize(66, 24)
  toolsBtn:SetPoint("BOTTOMRIGHT", chatFrame, "BOTTOMRIGHT", -20, 9)
  toolsBtn:SetText(L.toolsBtn)
  toolsBtn:SetScript("OnClick", function() ShowMenu(ToolsMenuList()) end)

  -- le bouton des émojis se place juste à gauche du bouton "Outils"
  emoBtn:ClearAllPoints()
  emoBtn:SetPoint("RIGHT", toolsBtn, "LEFT", -4, 0)

  TW.menuBtn, TW.toolsBtn = menuBtn, toolsBtn
  TW.WindowMenuList, TW.ToolsMenuList = WindowMenuList, ToolsMenuList
end

-- diagnostic : /tw icontest affiche vos images personnalisées à côté d'une icône native du jeu
local iconTest
function TW:IconTest()
  if not iconTest then
    local f = CreateFrame("Frame", "TavernIconTest", Root(), BT)
    iconTest = f
    f:SetSize(330, 120)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 200)
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetBackdrop(PANEL_BD)
    f:SetBackdropColor(0.08, 0.05, 0.03, 0.98)
    f:SetBackdropBorderColor(unpack(C.panelEd))
    local items = {
      { "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8", "natif" },
      { "Interface\\AddOns\\TavernWhispers\\Media\\globe.tga", "globe" },
      { "Interface\\AddOns\\TavernWhispers\\Media\\spell_fr.tga", "spell_fr" },
      { "Interface\\AddOns\\TavernWhispers\\Emoji\\joy.tga", "joy" },
    }
    for i, it in ipairs(items) do
      local t = f:CreateTexture(nil, "ARTWORK")
      t:SetSize(48, 48)
      t:SetPoint("TOPLEFT", 14 + (i - 1) * 78, -14)
      t:SetTexture(it[1])
      local fs = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      fs:SetPoint("TOP", t, "BOTTOM", 0, -4)
      fs:SetText(it[2])
    end
    local hint = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    hint:SetPoint("BOTTOM", 0, 8)
    hint:SetText("natif visible mais les autres vides = images non chargées")
    local x = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    x:SetPoint("TOPRIGHT", 2, 2)
    f:Hide()
  end
  if iconTest:IsShown() then iconTest:Hide() else iconTest:Show() end
end

----------------------------------------------------------------------
-- Vérification des fichiers chargés (un /reload ne relit PAS la liste .toc)
----------------------------------------------------------------------
local function MissingModules()
  local missing = {}
  if not (TW.DictFR and TW.DictEN) then missing[#missing + 1] = "Dict_fr.lua / Dict_en.lua" end
  if not TW.Correct then missing[#missing + 1] = "Spell.lua" end
  if not TW.Translate then missing[#missing + 1] = "Translate.lua" end
  if not TW.LangGloss then missing[#missing + 1] = "Lang_data.lua" end
  if not TW.AutoTranslate then missing[#missing + 1] = "Lang.lua" end
  return missing
end

local function WarnMissing()
  local m = MissingModules()
  if #m > 0 then
    Print("|cffff5555fichiers non chargés : " .. table.concat(m, ", ") .. "|r")
    Print("Quittez COMPLÈTEMENT le jeu puis relancez-le (un simple /reload ne relit pas la liste des fichiers).")
  end
  return #m == 0
end

----------------------------------------------------------------------
-- Commandes /tw
----------------------------------------------------------------------
local toggles = {
  sound     = { "sound", "o_sound" },
  hide      = { "hideDefault", "o_hide" },
  auto      = { "autoOpen", "o_auto" },
  intercept = { "intercept", "o_inter" },
  spell     = { "spell", "o_spell" },
}

SLASH_TAVERNWHISPERS1 = "/tw"
SLASH_TAVERNWHISPERS2 = "/tavernwhispers"
SlashCmdList["TAVERNWHISPERS"] = function(msg)
  msg = (msg or ""):gsub("^%s+", ""):gsub("%s+$", "")
  local low = msg:lower()
  if msg == "" then
    TW:Toggle()
  elseif low == "help" or low == "?" then
    Print(L.help)
  elseif low:match("^opacity%s+%d+$") or low:match("^opacite%s+%d+$") then
    local v = tonumber(low:match("%d+"))
    v = math.max(20, math.min(100, v)) / 100
    db.opts.opacity = v
    TavernWhispersOpacitySlider:SetValue(v)
    TW:ApplyOpacity()
  elseif low:match("^read%s+%a+$") then
    local v = low:match("^read%s+(%a+)$")
    if v == "fr" or v == "en" or v == "off" then
      db.opts.readLang = v
      TW:UpdateReadButton()
      TW:RenderMessages()
    end
  elseif low:match("^lang%s+%a+$") then
    local v = low:match("^lang%s+(%a+)$")
    if v == "fr" or v == "en" then
      db.opts.lang = v
      SetUILang(v == "fr")
      Print(v == "fr" and "Interface en français. Tapez /reload pour tout mettre à jour."
                      or "Interface set to English. Type /reload to refresh everything.")
    end
  elseif low:match("^sim%s+.+") then
    -- simule un message reçu (pour tester la traduction) : /tw sim Hallo, ich suche eine Gruppe
    local txt = msg:match("^%S+%s+(.+)$")
    local c = GetConv("test", { name = "Test", target = "Test" })
    AddMsg(c, false, txt)
    mainFrame:Show()
    TW:Select("test")
  elseif low == "dnd" or low:match("^dnd%s+%a+$") then
    local v = low:match("^dnd%s+(%a+)$")
    if v == "on" then TW:ToggleDnd(true) elseif v == "off" then TW:ToggleDnd(false) else TW:ToggleDnd() end
  elseif low == "settings" or low == "reglages" then
    TW:SettingsToggle()
  elseif low:match("^alert%s+add%s+.+") then
    local w = msg:match("^%S+%s+%S+%s+(.+)$")
    if TW:AddKeyword(w) then Print(L.alertWord .. " + " .. w) end
  elseif low:match("^alert%s+del%s+.+") then
    local w = msg:match("^%S+%s+%S+%s+(.+)$")
    TW:RemoveKeyword(w and w:lower())
    Print(L.alertWord .. " - " .. tostring(w))
  elseif low == "alert" or low == "alert list" then
    Print(L.alertTitle .. " : " .. (#db.chat.keywords > 0 and table.concat(db.chat.keywords, ", ") or L.alertEmpty))
  elseif low:match("^spam%s+add%s+.+") then
    local w = msg:match("^%S+%s+%S+%s+(.+)$")
    if TW:AddSpam(w) then Print(L.spamBtn .. " + " .. w) end
  elseif low:match("^spam%s+del%s+.+") then
    local w = msg:match("^%S+%s+%S+%s+(.+)$")
    TW:RemoveSpam(w and w:lower())
    Print(L.spamBtn .. " - " .. tostring(w))
  elseif low == "spam" or low == "spam list" then
    Print(L.spamTitle .. " : " .. (#db.chat.spam > 0 and table.concat(db.chat.spam, ", ") or L.spamEmpty))
  elseif low == "learn list" or low == "dict" then
    for dir, tbl in pairs(db.learn) do
      for k, v in pairs(tbl) do Print((dir == "enfr" and "en" or "fr") .. ": " .. k .. " = " .. v) end
    end
  elseif low:match("^learn%s+.+") then
    local arg = msg:match("^%S+%s+(.+)$")
    local pre, rest = arg:match("^(%a%a):(.+)$")
    local dir = (pre and pre:lower() == "fr") and "fren" or "enfr"
    rest = rest or arg
    local k, v = rest:match("^(.-)%s*=%s*(.+)$")
    if k and k ~= "" and v then
      db.learn[dir][k:lower()] = v
      if TW.LearnEntry then TW.LearnEntry(dir, k, v) end
      Print(L.learnOk .. " : " .. k .. " = " .. v)
    else
      Print(L.learnHelp)
    end
  elseif low:match("^forget%s+.+") then
    local arg = msg:match("^%S+%s+(.+)$")
    local pre, rest = arg:match("^(%a%a):(.+)$")
    local dir = (pre and pre:lower() == "fr") and "fren" or "enfr"
    rest = (rest or arg):lower()
    db.learn[dir][rest] = nil
    if TW.ForgetEntry then TW.ForgetEntry(dir, rest) end
    Print(L.learnOk .. " - " .. rest)
  elseif low == "icontest" then
    TW:IconTest()
  elseif low == "menu" then
    if TW.menuBtn then TW.menuBtn:Click() end
  elseif low == "chat" then
    TW:ChatToggle()
  elseif low:match("^chan2?%s+%d+$") then
    local which = low:match("^chan2") and 2 or 1
    local n = tonumber(low:match("(%d+)%s*$"))
    if n and n >= 1 and n <= 10 then
      db.chat.slots[which].num, db.chat.slots[which].on = n, true
      TW:UpdateChatButtons()
    end
  elseif low == "scale" then
    Print(string.format("echelle interface: %.3f (effective %.3f) | racine: %.3f | WorldFrame: %s",
      UIParent:GetScale(), UIParent:GetEffectiveScale(), TW.root and TW.root:GetScale() or 0,
      WorldFrame and string.format("%.3f", WorldFrame:GetScale()) or "?"))
  elseif low == "mapdebug" then
    Print(TW.mapLog or "ouvrez puis fermez la carte (M), puis retapez /tw mapdebug")
  elseif low == "debug" then
    if WarnMissing() then
      Print("tous les fichiers sont chargés.")
      local sample = "hello i am french"
      local ok, out, src = pcall(TW.AutoTranslate, sample, "fr")
      Print("test '" .. sample .. "' -> " .. tostring(ok and out or ("ERREUR: " .. tostring(out))) .. " [langue: " .. tostring(src) .. "]")
    end
  elseif low == "focus" then
    local f = GetCurrentKeyBoardFocus and GetCurrentKeyBoardFocus()
    if f then
      Print("clavier retenu par : " .. tostring((f.GetName and f:GetName()) or "(champ sans nom)") .. " -> libéré")
      f:ClearFocus()
    else
      Print("aucun champ de saisie ne retient le clavier")
    end
  elseif low == "clear" then
    wipe(db.convs)
    TW.selected = nil
    TW:Refresh()
    Print(L.cleared)
  elseif toggles[low] then
    local opt, label = toggles[low][1], toggles[low][2]
    db.opts[opt] = not db.opts[opt]
    TW:UpdateSpellButton()
    Print(L[label] .. " : " .. (db.opts[opt] and L.on or L.off))
  else
    TW:OpenWith(msg)
  end
end

----------------------------------------------------------------------
-- Initialisation
----------------------------------------------------------------------
local ev = CreateFrame("Frame")
ev:RegisterEvent("ADDON_LOADED")
ev:SetScript("OnEvent", function(self, event, ...)
  if event == "ADDON_LOADED" then
    if ... ~= ADDON_NAME then return end
    self:UnregisterEvent("ADDON_LOADED")

    TavernWhispersDB = TavernWhispersDB or {}
    db = TavernWhispersDB
    db.opts = db.opts or {}
    for k, v in pairs(defaults) do
      if db.opts[k] == nil then db.opts[k] = v end
    end
    db.convs = db.convs or {}
    if (db.opts.ver or 0) < 5 then
      db.opts.readLang = "auto" -- l'ancien réglage dépendait de la langue du client
      db.opts.ver = 5
    end
    db.opts.lang = db.opts.lang or "fr"
    SetUILang(db.opts.lang ~= "en")

    db.chat = db.chat or {}
    for k, v in pairs({ party = true, chan = true, guild = false, say = false, chanNum = 1, onlyForeign = true,
                        alertSound = true, alertPrint = true }) do
      if db.chat[k] == nil then db.chat[k] = v end
    end
    db.chat.keywords = db.chat.keywords or {}
    db.chat.spam = db.chat.spam or {}
    db.learn = db.learn or { enfr = {}, fren = {} }
    if not db.chat.slots then
      -- ancien réglage : un seul canal (numéro + interrupteur)
      local n = db.chat.chanNum or 1
      db.chat.slots = {
        { num = 1, on = (db.chat.chan and n == 1) and true or false },
        { num = 2, on = (db.chat.chan and n == 2) and true or false },
      }
    end
    if db.chat.speakTo == nil then db.chat.speakTo = "party" end
    if db.chat.speakTr == nil then db.chat.speakTr = "fren" end
    db.dnd = db.dnd or {}
    for k, v in pairs({ manual = false, combat = true, bg = true, instance = true }) do
      if db.dnd[k] == nil then db.dnd[k] = v end
    end
    db.dnd.msgs = db.dnd.msgs or {}

    BuildRoot()
    BuildUI()
    BuildArchiveUI()
    BuildLauncher()
    BuildChatWindow()
    BuildChatLauncher()
    BuildSettings()
    BuildKeywordsPopup()
    BuildSpamPopup()
    BuildSpeakBar()
    BuildMenus()
    if TW.LearnEntry then
      for dir, tbl in pairs(db.learn) do
        for k, v in pairs(tbl) do TW.LearnEntry(dir, k, v) end
      end
    end
    TrackWindow(mainFrame)
    TrackWindow(chatWin)
    TrackWindow(settingsWin)
    HookMap()
    InstallHooks()
    TW:UpdateDndIndicator()

    self:RegisterEvent("CHAT_MSG_WHISPER")
    self:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
    self:RegisterEvent("CHAT_MSG_BN_WHISPER")
    self:RegisterEvent("CHAT_MSG_BN_WHISPER_INFORM")
    for ev2 in pairs(CHAT_EVENTS) do self:RegisterEvent(ev2) end
    self:RegisterEvent("CHAT_MSG_CHANNEL")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:RegisterEvent("UI_SCALE_CHANGED")
    self:RegisterEvent("DISPLAY_SIZE_CHANGED")
    TW:Refresh()
    WarmLang()
    After(3, WarnMissing) -- prévient si des fichiers n'ont pas été chargés
  elseif event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED"
      or event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
    TW:UpdateDndIndicator()
    TW:SyncRoot()
  elseif event == "UI_SCALE_CHANGED" or event == "DISPLAY_SIZE_CHANGED" then
    TW:SyncRoot()
    After(0.5, function() TW:SyncRoot() end)
  elseif event:find("WHISPER", 1, true) then
    OnWhisper(event, ...)
  else
    TW:OnChatLine(event, ...)
  end
end)
