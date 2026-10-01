TavernWhispers 0.12.1 - messagerie privée façon messenger pour WoW (Ascension / WotLK 3.3.5)

INSTALLATION
IMPORTANT : quand une mise à jour AJOUTE des fichiers (0.3 : dictionnaires, 0.5 : traduction multilingue, 0.6 : icône du globe, 0.10 : icônes du correcteur),
il faut QUITTER COMPLÈTEMENT le jeu et le relancer. Un simple /reload ne relit pas la liste des fichiers (.toc).
L'addon vous prévient dans le chat si des fichiers ne sont pas chargés ; /tw debug vérifie l'état.
Supprimer l'ancien dossier TavernWhispers, copier le nouveau dans Interface\AddOns\, puis /reload.

FONCTIONS
- Fenêtre redimensionnable (coin en bas à droite), taille mémorisée, réductible jusqu'à 320x240.
  En dessous de ~600 px la liste des contacts se réduit, puis passe en icônes seules ; les boutons raccourcissent.
- OPACITÉ : bouton "Opacité" dans la barre de titre (curseur 20-100 %). Seuls les fonds deviennent
  transparents, le texte reste net. Aussi : /tw opacity 60
- Icône de classe + nom en couleur + "Classe - Niv. - Zone".
- Maj + clic sur un objet/sort/quête : le lien va dans la saisie. Liens reçus cliquables sous la bulle.
- EMOJIS en vraies images : bouton ":)" ouvre le sélecteur (icônes de raid + 50 emojis).
  Ils s'envoient sous forme de codes (:joy: :heart: ...) et s'affichent en images chez les
  joueurs qui ont l'addon. Les smileys tapés (:) :D ;) :P :( <3 xD ^^ o/ ...) sont convertis à l'affichage.
- CORRECTEUR orthographique FR/EN hors ligne (bouton "Ortho", vert = actif) :
  accents oubliés, fautes de frappe, mots collés, élisions (jai -> j'ai), SMS (slt, bjr, mrc...).
  La correction apparaît en vert sous la saisie ; Tab l'applique ; appliquée aussi à l'envoi.
  Ne touche jamais aux liens, icônes, emojis ni aux noms propres (majuscule).
- TRADUCTION DU CHAT : bouton "Traduction" (globe) à droite de la bulle messenger (ou /tw chat).
  Fenêtre séparée, redimensionnable, qui traduit ce que disent les autres joueurs. Boutons au choix :
  Groupe (groupe / raid / champ de bataille), Canal N (clic gauche : on/off, clic droit : numéro 1 à 10,
  ou /tw chan 2), Guilde, Dire (/dire et /crier). Bouton "Traduits" : n'affiche que les messages dans une
  autre langue que la vôtre ; "Tout" : affiche tout. Noms cliquables (chuchoter), liens d'objets cliquables,
  molette pour défiler (Maj = page). Opacité commune avec la fenêtre principale.
- RÉGLAGES : bouton "Réglages" (barre de titre) ou /tw settings. Son de notification, ouverture auto,
  masquer le chat par défaut, et tout le mode NE PAS DÉRANGER (voir ci-dessous).
- NE PAS DÉRANGER + RÉPONSES AUTOMATIQUES :
  * Réponse auto en combat ("je te réponds tout de suite"), en champ de bataille / arène et en
    donjon / raid ("je vais mettre du temps à te répondre"), chacune activable à part.
  * Mode manuel "indisponible" : clic DROIT sur la bulle messenger, /tw dnd (on/off) ou case dans les réglages.
  * Les 4 messages sont modifiables dans les réglages. "[Auto]" est ajouté au début (jamais de boucle entre
    deux réponses automatiques). La réponse part dans la langue de l'interlocuteur (FR ou EN).
  * Un seul envoi par personne (60 s en combat, 10 min sinon). Pendant un mode actif : pas de son ni
    d'ouverture automatique. La bordure de la bulle devient rouge (manuel) ou orange (automatique).
- SON PAR CONTACT : Ctrl + clic sur un contact pour couper / réactiver son son.
- ALERTES MOTS-CLÉS : bouton "Alertes" dans la fenêtre Trad (ou /tw alert add mot, /tw alert del mot,
  /tw alert). Un message contenant un de vos mots est surligné (étoile), joue un son et s'écrit aussi dans le
  chat (options à cocher). Les messages surlignés s'affichent même en mode "Traduits".
- MENUS (0.11) : les petits boutons rouges sans texte sont remplacés par deux menus déroulants.
  * "Menu" (barre de titre) : Réglages, Ne pas déranger, traduction des messages reçus (français / anglais / aucune),
    opacité de la fenêtre (100 / 80 / 60 / 40 / 30 / 20 %).
  Les deux menus ont une petite croix (en haut à droite) pour les fermer ; cliquer ailleurs les ferme aussi.
  * "Outils" (bas de la fenêtre) : correcteur orthographique (activé, langue auto / français / anglais) et
    traduction de MES messages pour la conversation ouverte (aucune / FR>EN / EN>FR).
  * /tw icontest : affiche vos images personnalisées à côté d'une icône native, pour diagnostiquer les images qui ne s'affichent pas.
- CORRECTEUR (0.10, remplacé par le menu Outils en 0.11) : le bouton est maintenant une ICÔNE (drapeau + coche verte). Clic gauche :
  activer / désactiver (l'icône se grise). Clic droit : langue du correcteur -> auto, français, anglais.
  En "auto", le drapeau suit le sens de traduction de la conversation.
- FENÊTRE TRADUCTION : boutons "Canal 1" ET "Canal 2" côte à côte (clic gauche : activer, clic droit : changer
  le numéro ; /tw chan N et /tw chan2 N). Barre "Parler dans le chat" en bas : écrivez, choisissez la destination
  (groupe / guilde / dire / canal 1 / canal 2) et FR>EN / EN>FR / aucune traduction ; Entrée envoie.
  Bouton "Filtre" : mots à masquer (vendeurs d'or...), /tw spam add mot, /tw spam del mot, /tw spam.
- DICTIONNAIRE PERSO : /tw learn en:big deal=grosse affaire (ou fr:...), /tw learn list, /tw forget en:big deal.
  Vos entrées ont la priorité absolue et sont conservées.
- ARCHIVES : chaque conversation a une croix (x) pour l'archiver = la fermer sans perdre l'historique
  (clic droit fait pareil). Le bouton "Archives (n)" sous la liste affiche les conversations archivées ;
  cliquer sur l'une la rouvre. Un nouveau message la fait revenir tout seul dans la liste.
  Dans la vue Archives, la croix supprime DÉFINITIVEMENT. Maj + clic droit supprime aussi.
- CARTE DU MONDE : les fenêtres et boutons sont sur une racine indépendante de UIParent, passent au-dessus
  de la carte, et sont rouverts automatiquement si le jeu les cache sans que vous les ayez fermées.
  Échap ne ferme plus ces fenêtres (elles ne sont plus enregistrées comme "fenêtres spéciales") : utilisez la croix.
  Si le problème persiste : ouvrez puis fermez la carte, tapez /tw mapdebug et envoyez la ligne affichée.
- TRADUCTION 0.11.4 : argot WoW ("toon" -> perso, "relog" -> se reconnecter, glitch -> bug, "gonna afk" -> je m'absente),
  tournures figées ("all i had to do was..." -> il m'a suffi de..., "That'll do it" -> ça devrait le faire) ;
  les mots WoW ne sont plus "corrigés" par erreur avant traduction (toon n'est plus lu comme "too").
- TRADUCTION 0.11.3 : gérondifs ("try making" -> "essayer de faire", "stopped playing" -> "arrêté de jouer",
  "started farming" -> "commencé à farmer"), "a new one" -> "un nouveau", élision automatique (de/que + voyelle), vocabulaire complété.
- TRADUCTION 0.11.2 : impératif en début de phrase ("Wait" -> "Attends"), "it" complément ("buy it" -> "acheter ça"),
  "all" accordé (tous les / toutes les), adjectifs au pluriel après "sont", "aucun ... est", verbes après un sujet nominal
  ("my friends have" -> "mes amis ont"), pronoms après préposition (for me -> pour moi), et le texte entre [crochets]
  (noms d'objets) n'est plus jamais traduit.
- TRADUCTION 0.9 : environ 11 000 tournures générées automatiquement (sujet + verbe conjugué, négations,
  questions, passé, "want to / need to", futur proche, perfect...) dans les DEUX sens, argot et abréviations de chat
  (gj, gz, ty, np, nvm, brb, idk, "big deal", "my bad"...), accord des articles et possessifs en genre et nombre
  (le/la/les, un/une, mon/ma/mes, du/au...), h aspiré, participes accordés, "this/that/her/to/too" selon le contexte.
  Reste une traduction par règles et dictionnaires : elle est bien meilleure, mais pas parfaite.
- TRADUCTION (0.8) : vocabulaire de base beaucoup plus complet (EN<->FR), formes conjuguées et pluriels,
  correction prudente des fautes de frappe des messages reçus avant traduction, vocabulaire champ de bataille.
- LECTURE MULTILINGUE : bouton "Lire" (barre de titre) ou /tw read fr|en|off.
  Chaque message reçu est détecté (FR, EN, allemand, espagnol, portugais, italien, russe) puis traduit
  sous la bulle, ex. "[DE] Bonjour, je cherche un groupe pour le donjon". Traduction mot à mot hors ligne :
  elle aide à comprendre, elle n'est pas parfaite (couverture plus faible pour l'italien et le russe).
- TRADUCTEUR FR<->EN hors ligne (bouton "Trad") : glossaire + modèles de phrases
  ("je m'appelle X", "j'ai N ans", "j'habite à X"...). Aperçu avant envoi.
  Ce n'est pas Google Traduction : un addon WoW n'a pas d'accès internet.
- CLAVIER : la fenêtre ne prend le clavier que si vous cliquez dans le panneau de discussion.
  Un clic en dehors de la fenêtre (monde, barres d'action...) le rend au jeu. Entrée (après envoi) et Échap aussi.
  Ctrl+Entrée : envoie le texte tel quel (sans correction ni traduction).

COMMANDES
/tw lang fr|en   langue de l'interface (français par défaut ; /reload ensuite)
/tw settings     ouvrir les réglages
/tw dnd [on|off] ne pas déranger (manuel)
/tw alert ...    add mot | del mot | (liste)
/tw chat         ouvrir/fermer la fenêtre de traduction du chat
/tw chan N       choisir le numéro du canal traduit (1 à 10)
/tw sim <texte>  simule un message reçu, pour tester la traduction. Ex. : /tw sim Hallo, ich suche eine Gruppe
/tw scale        affiche l'échelle de l'interface et de la racine des fenêtres (diagnostic de taille)
/tw mapdebug     état des fenêtres avant/après ouverture de la carte
/tw debug        vérifie que tous les fichiers sont chargés et teste la traduction
/tw focus        diagnostic : indique quel champ retient le clavier et le libère
/tw    ouvrir/fermer      /tw Nom    ouvrir une conversation
/tw sound | hide | auto | intercept | spell    activer/désactiver une option
/tw clear    supprimer toutes les conversations

CRÉDITS
- Emojis : Twemoji (c) Twitter, Inc. et contributeurs, licence CC-BY 4.0 (https://github.com/jdecked/twemoji)
- Dictionnaires orthographe : FrequencyWords de hermitdave (données OpenSubtitles 2018), filtrées.
- Dictionnaires bilingues : FreeDict (licence GPL, https://freedict.org), filtrés et complétés à la main.

NOUVEAU 0.12.0
- Écrire dans la langue de l'autre : menu Outils > "J'écris en français > envoi en allemand / espagnol / italien / portugais / russe"
  (passe par l'anglais, mot à mot : approximatif mais utile pour dépanner).
- "Répondre dans sa langue (auto)" : suit la langue détectée du dernier message reçu.
- Fenêtre Traduction : un clic sur un nom ouvre un menu (chuchoter, inviter en groupe, ajouter en ami, ignorer, voir le niveau).
- Barre de parole : le bouton de traduction propose aussi DE/ES/IT/PT/RU.
