-- TavernWhispers : traducteur par glossaire FR <-> EN (100% hors ligne)
-- Un addon WoW n'a pas accès à internet : ce module traduit les mots et expressions
-- courantes (jeu, commerce, politesse). Ce n'est PAS une traduction automatique complète.
--
-- Format : "fr|en" = dans les deux sens, "fr>en" = FR vers EN seulement, "en<fr" = EN vers FR seulement

TavernWhispers = TavernWhispers or {}
local TW = TavernWhispers

local GLOSSARY = [[
##PRI-START##
go<aller
goes<va
went<allé
aller>go
come<venir
comes<vient
came<venu
venir>come
get<obtenir
gets<obtient
got<obtenu
obtenir>get
do<faire
does<fait
did<fait
faire>do
make<faire
makes<fait
made<fait
know<savoir
knows<sait
knew<su
savoir>know
think<penser
thinks<pense
thought<pensé
penser>think
see<voir
sees<voit
saw<vu
voir>see
want<vouloir
wants<veut
wanted<voulu
vouloir>want
need<avoir besoin de
needs<a besoin de
needed<eu besoin de
avoir besoin de>need
like<aimer
likes<aime
liked<aimé
aimer>like
love<adorer
loves<adore
loved<adoré
adorer>love
hate<détester
hates<déteste
hated<détesté
détester>hate
take<prendre
takes<prend
took<pris
prendre>take
give<donner
gives<donne
gave<donné
donner>give
tell<dire
tells<dit
told<dit
dire>tell
say<dire
says<dit
said<dit
ask<demander
asks<demande
asked<demandé
demander>ask
find<trouver
finds<trouve
found<trouvé
trouver>find
look<regarder
looks<regarde
looked<regardé
regarder>look
watch<regarder
watches<regarde
watched<regardé
use<utiliser
uses<utilise
used<utilisé
utiliser>use
try<essayer
tries<essaie
tried<essayé
essayer>try
play<jouer
plays<joue
played<joué
jouer>play
help<aider
helps<aide
helped<aidé
aider>help
wait<attendre
waits<attend
waited<attendu
attendre>wait
work<travailler
works<travaille
worked<travaillé
travailler>work
buy<acheter
buys<achète
bought<acheté
acheter>buy
sell<vendre
sells<vend
sold<vendu
vendre>sell
join<rejoindre
joins<rejoint
joined<rejoint
rejoindre>join
invite<inviter
invites<invite
invited<invité
inviter>invite
kill<tuer
kills<tue
killed<tué
tuer>kill
die<mourir
dies<meurt
died<mort
mourir>die
win<gagner
wins<gagne
won<gagné
gagner>win
lose<perdre
loses<perd
lost<perdu
perdre>lose
run<courir
runs<court
ran<couru
courir>run
leave<partir
leaves<part
left<parti
partir>leave
stay<rester
stays<reste
stayed<resté
rester>stay
meet<rencontrer
meets<rencontre
met<rencontré
rencontrer>meet
follow<suivre
follows<suit
followed<suivi
suivre>follow
stop<arrêter
stops<arrête
stopped<arrêté
arrêter>stop
start<commencer
starts<commence
started<commencé
commencer>start
finish<finir
finishes<finit
finished<fini
finir>finish
fix<réparer
fixes<répare
fixed<réparé
réparer>fix
bring<apporter
brings<apporte
brought<apporté
apporter>bring
send<envoyer
sends<envoie
sent<envoyé
envoyer>send
call<appeler
calls<appelle
called<appelé
appeler>call
pay<payer
pays<paie
paid<payé
payer>pay
talk<parler
talks<parle
talked<parlé
parler>talk
speak<parler
speaks<parle
spoke<parlé
understand<comprendre
understands<comprend
understood<compris
comprendre>understand
forget<oublier
forgets<oublie
forgot<oublié
oublier>forget
believe<croire
believes<croit
believed<cru
croire>believe
hope<espérer
hopes<espère
hoped<espéré
espérer>hope
wish<souhaiter
wishes<souhaite
wished<souhaité
souhaiter>wish
mean<vouloir dire
means<veut dire
meant<voulu dire
vouloir dire>mean
feel<sentir
feels<sent
felt<senti
sentir>feel
hear<entendre
hears<entend
heard<entendu
entendre>hear
learn<apprendre
learns<apprend
learned<appris
apprendre>learn
change<changer
changes<change
changed<changé
changer>change
open<ouvrir
opens<ouvre
opened<ouvert
ouvrir>open
close<fermer
closes<ferme
closed<fermé
fermer>close
pull<tirer
pulls<tire
pulled<tiré
tirer>pull
farm<farmer
farms<farme
farmed<farmé
farmer>farm
put<mettre
puts<met
mettre>put
keep<garder
keeps<garde
kept<gardé
garder>keep
let<laisser
lets<laisse
laisser>let
live<vivre
lives<vit
lived<vécu
vivre>live
move<bouger
moves<bouge
moved<bougé
bouger>move
hold<tenir
holds<tient
held<tenu
tenir>hold
read<lire
reads<lit
lire>read
write<écrire
writes<écrit
wrote<écrit
écrire>write
eat<manger
eats<mange
ate<mangé
manger>eat
sleep<dormir
sleeps<dort
slept<dormi
dormir>sleep
guess<supposer
guesses<suppose
guessed<supposé
supposer>guess
log<se connecter
logs<se connecte
logged<connecté
se connecter>log
trop>too
trop de>too much
trop loin>too far
trop tard>too late
trop tôt>too early
trop fort>too strong
trop facile>too easy
trop dur>too hard
là bas>over there
la bas>over there
par là>that way
ce qu'il>what he
ce qu'elle>what she
ce qu'ils>what they
ce qu'on>what we
ce que tu>what you
ce que je>what i
ce que nous>what we
ce que vous>what you
ce qui>what
ce que>what
c'est quoi>what is
qu'est ce qu'il>what is he
qu'est ce que tu>what do you
je n'ai pas trouvé>i didn't find
tu n'as pas trouvé>you didn't find
on n'a pas>we didn't have
il y a un>there is a
il y a une>there is a
il y a des>there are
il n'y a plus>there is no more
pas du tout>not at all
pas encore>not yet
pas toujours>not always
pas mal>not bad
bien sûr>of course
tout le monde>everyone
n'importe qui>anyone
n'importe quoi>anything
quelqu'un>someone
personne>nobody
rien>nothing
tout>everything
tous>everyone
toute la>the whole
tout le>the whole
la plupart>most
beaucoup de>a lot of
un peu de>a bit of
peu de>few
plein de>lots of
assez de>enough
un autre>another
une autre>another
d'autres>others
l'autre>the other
le même>the same
la même>the same
encore un>one more
encore une>one more
en train de>currently
en fait>actually
au fait>by the way
en général>usually
en ce moment>right now
tout de suite>right now
maintenant>now
bientôt>soon
déjà>already
toujours>always
jamais>never
souvent>often
parfois>sometimes
gonna<je vais
wanna<je veux
gotta<je dois
it works<ça marche
it doesn't work<ça ne marche pas
it didn't work<ça n'a pas marché
it worked<ça a marché
it will work<ça va marcher
it should work<ça devrait marcher
it's working<ça marche
it is working<ça marche
it's not working<ça ne marche pas
it still doesn't show up<il n'apparaît toujours pas
it doesn't show up<il n'apparaît pas
it still doesn't work<ça ne marche toujours pas
still doesn't work<ne marche toujours pas
still doesn't show up<n'apparaît toujours pas
that works<ça marche
that doesn't work<ça ne marche pas
that worked<ça a marché
vanity tab<onglet vanity
in<dans
on<sur
at<à
to<à
of<de
by<par
with<avec
for<pour
from<de
there<là
is<est
key<clé
keys<clés
sword<épée
swords<épées
the<le
with the<avec le
nous allons>we're going to
tu vas>you're going to
il va>he's going to
elle va>she's going to
vous allez>you're going to
ils vont>they're going to
elles vont>they're going to
on va>we're going to
je vais>i'm going to
ce qu'il fait>what he does
ce qu'elle fait>what she does
ce que tu fais>what you do
ce que je fais>what i do
ce qu'ils font>what they do
ce que vous faites>what you do
ce que nous faisons>what we do
je n'ai pas de>i don't have any
tu n'as pas de>you don't have any
il n'a pas de>he doesn't have any
elle n'a pas de>she doesn't have any
nous n'avons pas de>we don't have any
vous n'avez pas de>you don't have any
ils n'ont pas de>they don't have any
il n'y a pas de>there is no
il n'y a pas d'>there is no
je ne suis pas allé>i didn't go
je ne suis pas allé de>i didn't go any
tu n'es pas allé>you didn't go
tu n'es pas allé de>you didn't go any
il n'est pas allé>he didn't go
il n'est pas allé de>he didn't go any
elle n'est pas allé>she didn't go
elle n'est pas allé de>she didn't go any
nous ne sommes pas allé>we didn't go
nous ne sommes pas allé de>we didn't go any
vous n'êtes pas allé>you didn't go
vous n'êtes pas allé de>you didn't go any
ils ne sont pas allé>they didn't go
ils ne sont pas allé de>they didn't go any
elles ne sont pas allé>they didn't go
elles ne sont pas allé de>they didn't go any
je ne suis pas venu>i didn't come
je ne suis pas venu de>i didn't come any
tu n'es pas venu>you didn't come
tu n'es pas venu de>you didn't come any
il n'est pas venu>he didn't come
il n'est pas venu de>he didn't come any
elle n'est pas venu>she didn't come
elle n'est pas venu de>she didn't come any
nous ne sommes pas venu>we didn't come
nous ne sommes pas venu de>we didn't come any
vous n'êtes pas venu>you didn't come
vous n'êtes pas venu de>you didn't come any
ils ne sont pas venu>they didn't come
ils ne sont pas venu de>they didn't come any
elles ne sont pas venu>they didn't come
elles ne sont pas venu de>they didn't come any
je n'ai pas obtenu>i didn't get
je n'ai pas obtenu de>i didn't get any
tu n'as pas obtenu>you didn't get
tu n'as pas obtenu de>you didn't get any
il n'a pas obtenu>he didn't get
il n'a pas obtenu de>he didn't get any
elle n'a pas obtenu>she didn't get
elle n'a pas obtenu de>she didn't get any
nous n'avons pas obtenu>we didn't get
nous n'avons pas obtenu de>we didn't get any
vous n'avez pas obtenu>you didn't get
vous n'avez pas obtenu de>you didn't get any
ils n'ont pas obtenu>they didn't get
ils n'ont pas obtenu de>they didn't get any
elles n'ont pas obtenu>they didn't get
elles n'ont pas obtenu de>they didn't get any
je n'ai pas fait>i didn't do
je n'ai pas fait de>i didn't do any
tu n'as pas fait>you didn't do
tu n'as pas fait de>you didn't do any
il n'a pas fait>he didn't do
il n'a pas fait de>he didn't do any
elle n'a pas fait>she didn't do
elle n'a pas fait de>she didn't do any
nous n'avons pas fait>we didn't do
nous n'avons pas fait de>we didn't do any
vous n'avez pas fait>you didn't do
vous n'avez pas fait de>you didn't do any
ils n'ont pas fait>they didn't do
ils n'ont pas fait de>they didn't do any
elles n'ont pas fait>they didn't do
elles n'ont pas fait de>they didn't do any
je n'ai pas su>i didn't know
je n'ai pas su de>i didn't know any
tu n'as pas su>you didn't know
tu n'as pas su de>you didn't know any
il n'a pas su>he didn't know
il n'a pas su de>he didn't know any
elle n'a pas su>she didn't know
elle n'a pas su de>she didn't know any
nous n'avons pas su>we didn't know
nous n'avons pas su de>we didn't know any
vous n'avez pas su>you didn't know
vous n'avez pas su de>you didn't know any
ils n'ont pas su>they didn't know
ils n'ont pas su de>they didn't know any
elles n'ont pas su>they didn't know
elles n'ont pas su de>they didn't know any
je n'ai pas pensé>i didn't think
je n'ai pas pensé de>i didn't think any
tu n'as pas pensé>you didn't think
tu n'as pas pensé de>you didn't think any
il n'a pas pensé>he didn't think
il n'a pas pensé de>he didn't think any
elle n'a pas pensé>she didn't think
elle n'a pas pensé de>she didn't think any
nous n'avons pas pensé>we didn't think
nous n'avons pas pensé de>we didn't think any
vous n'avez pas pensé>you didn't think
vous n'avez pas pensé de>you didn't think any
ils n'ont pas pensé>they didn't think
ils n'ont pas pensé de>they didn't think any
elles n'ont pas pensé>they didn't think
elles n'ont pas pensé de>they didn't think any
je n'ai pas vu>i didn't see
je n'ai pas vu de>i didn't see any
tu n'as pas vu>you didn't see
tu n'as pas vu de>you didn't see any
il n'a pas vu>he didn't see
il n'a pas vu de>he didn't see any
elle n'a pas vu>she didn't see
elle n'a pas vu de>she didn't see any
nous n'avons pas vu>we didn't see
nous n'avons pas vu de>we didn't see any
vous n'avez pas vu>you didn't see
vous n'avez pas vu de>you didn't see any
ils n'ont pas vu>they didn't see
ils n'ont pas vu de>they didn't see any
elles n'ont pas vu>they didn't see
elles n'ont pas vu de>they didn't see any
je n'ai pas voulu>i didn't want
je n'ai pas voulu de>i didn't want any
tu n'as pas voulu>you didn't want
tu n'as pas voulu de>you didn't want any
il n'a pas voulu>he didn't want
il n'a pas voulu de>he didn't want any
elle n'a pas voulu>she didn't want
elle n'a pas voulu de>she didn't want any
nous n'avons pas voulu>we didn't want
nous n'avons pas voulu de>we didn't want any
vous n'avez pas voulu>you didn't want
vous n'avez pas voulu de>you didn't want any
ils n'ont pas voulu>they didn't want
ils n'ont pas voulu de>they didn't want any
elles n'ont pas voulu>they didn't want
elles n'ont pas voulu de>they didn't want any
je n'ai pas eu besoin de>i didn't need
je n'ai pas eu besoin de de>i didn't need any
tu n'as pas eu besoin de>you didn't need
tu n'as pas eu besoin de de>you didn't need any
il n'a pas eu besoin de>he didn't need
il n'a pas eu besoin de de>he didn't need any
elle n'a pas eu besoin de>she didn't need
elle n'a pas eu besoin de de>she didn't need any
nous n'avons pas eu besoin de>we didn't need
nous n'avons pas eu besoin de de>we didn't need any
vous n'avez pas eu besoin de>you didn't need
vous n'avez pas eu besoin de de>you didn't need any
ils n'ont pas eu besoin de>they didn't need
ils n'ont pas eu besoin de de>they didn't need any
elles n'ont pas eu besoin de>they didn't need
elles n'ont pas eu besoin de de>they didn't need any
je n'ai pas aimé>i didn't like
je n'ai pas aimé de>i didn't like any
tu n'as pas aimé>you didn't like
tu n'as pas aimé de>you didn't like any
il n'a pas aimé>he didn't like
il n'a pas aimé de>he didn't like any
elle n'a pas aimé>she didn't like
elle n'a pas aimé de>she didn't like any
nous n'avons pas aimé>we didn't like
nous n'avons pas aimé de>we didn't like any
vous n'avez pas aimé>you didn't like
vous n'avez pas aimé de>you didn't like any
ils n'ont pas aimé>they didn't like
ils n'ont pas aimé de>they didn't like any
elles n'ont pas aimé>they didn't like
elles n'ont pas aimé de>they didn't like any
je n'ai pas adoré>i didn't love
je n'ai pas adoré de>i didn't love any
tu n'as pas adoré>you didn't love
tu n'as pas adoré de>you didn't love any
il n'a pas adoré>he didn't love
il n'a pas adoré de>he didn't love any
elle n'a pas adoré>she didn't love
elle n'a pas adoré de>she didn't love any
nous n'avons pas adoré>we didn't love
nous n'avons pas adoré de>we didn't love any
vous n'avez pas adoré>you didn't love
vous n'avez pas adoré de>you didn't love any
ils n'ont pas adoré>they didn't love
ils n'ont pas adoré de>they didn't love any
elles n'ont pas adoré>they didn't love
elles n'ont pas adoré de>they didn't love any
je n'ai pas détesté>i didn't hate
je n'ai pas détesté de>i didn't hate any
tu n'as pas détesté>you didn't hate
tu n'as pas détesté de>you didn't hate any
il n'a pas détesté>he didn't hate
il n'a pas détesté de>he didn't hate any
elle n'a pas détesté>she didn't hate
elle n'a pas détesté de>she didn't hate any
nous n'avons pas détesté>we didn't hate
nous n'avons pas détesté de>we didn't hate any
vous n'avez pas détesté>you didn't hate
vous n'avez pas détesté de>you didn't hate any
ils n'ont pas détesté>they didn't hate
ils n'ont pas détesté de>they didn't hate any
elles n'ont pas détesté>they didn't hate
elles n'ont pas détesté de>they didn't hate any
je n'ai pas pris>i didn't take
je n'ai pas pris de>i didn't take any
tu n'as pas pris>you didn't take
tu n'as pas pris de>you didn't take any
il n'a pas pris>he didn't take
il n'a pas pris de>he didn't take any
elle n'a pas pris>she didn't take
elle n'a pas pris de>she didn't take any
nous n'avons pas pris>we didn't take
nous n'avons pas pris de>we didn't take any
vous n'avez pas pris>you didn't take
vous n'avez pas pris de>you didn't take any
ils n'ont pas pris>they didn't take
ils n'ont pas pris de>they didn't take any
elles n'ont pas pris>they didn't take
elles n'ont pas pris de>they didn't take any
je n'ai pas donné>i didn't give
je n'ai pas donné de>i didn't give any
tu n'as pas donné>you didn't give
tu n'as pas donné de>you didn't give any
il n'a pas donné>he didn't give
il n'a pas donné de>he didn't give any
elle n'a pas donné>she didn't give
elle n'a pas donné de>she didn't give any
nous n'avons pas donné>we didn't give
nous n'avons pas donné de>we didn't give any
vous n'avez pas donné>you didn't give
vous n'avez pas donné de>you didn't give any
ils n'ont pas donné>they didn't give
ils n'ont pas donné de>they didn't give any
elles n'ont pas donné>they didn't give
elles n'ont pas donné de>they didn't give any
je n'ai pas dit>i didn't tell
je n'ai pas dit de>i didn't tell any
tu n'as pas dit>you didn't tell
tu n'as pas dit de>you didn't tell any
il n'a pas dit>he didn't tell
il n'a pas dit de>he didn't tell any
elle n'a pas dit>she didn't tell
elle n'a pas dit de>she didn't tell any
nous n'avons pas dit>we didn't tell
nous n'avons pas dit de>we didn't tell any
vous n'avez pas dit>you didn't tell
vous n'avez pas dit de>you didn't tell any
ils n'ont pas dit>they didn't tell
ils n'ont pas dit de>they didn't tell any
elles n'ont pas dit>they didn't tell
elles n'ont pas dit de>they didn't tell any
je n'ai pas demandé>i didn't ask
je n'ai pas demandé de>i didn't ask any
tu n'as pas demandé>you didn't ask
tu n'as pas demandé de>you didn't ask any
il n'a pas demandé>he didn't ask
il n'a pas demandé de>he didn't ask any
elle n'a pas demandé>she didn't ask
elle n'a pas demandé de>she didn't ask any
nous n'avons pas demandé>we didn't ask
nous n'avons pas demandé de>we didn't ask any
vous n'avez pas demandé>you didn't ask
vous n'avez pas demandé de>you didn't ask any
ils n'ont pas demandé>they didn't ask
ils n'ont pas demandé de>they didn't ask any
elles n'ont pas demandé>they didn't ask
elles n'ont pas demandé de>they didn't ask any
je n'ai pas trouvé de>i didn't find any
tu n'as pas trouvé de>you didn't find any
il n'a pas trouvé>he didn't find
il n'a pas trouvé de>he didn't find any
elle n'a pas trouvé>she didn't find
elle n'a pas trouvé de>she didn't find any
nous n'avons pas trouvé>we didn't find
nous n'avons pas trouvé de>we didn't find any
vous n'avez pas trouvé>you didn't find
vous n'avez pas trouvé de>you didn't find any
ils n'ont pas trouvé>they didn't find
ils n'ont pas trouvé de>they didn't find any
elles n'ont pas trouvé>they didn't find
elles n'ont pas trouvé de>they didn't find any
je n'ai pas regardé>i didn't look
je n'ai pas regardé de>i didn't look any
tu n'as pas regardé>you didn't look
tu n'as pas regardé de>you didn't look any
il n'a pas regardé>he didn't look
il n'a pas regardé de>he didn't look any
elle n'a pas regardé>she didn't look
elle n'a pas regardé de>she didn't look any
nous n'avons pas regardé>we didn't look
nous n'avons pas regardé de>we didn't look any
vous n'avez pas regardé>you didn't look
vous n'avez pas regardé de>you didn't look any
ils n'ont pas regardé>they didn't look
ils n'ont pas regardé de>they didn't look any
elles n'ont pas regardé>they didn't look
elles n'ont pas regardé de>they didn't look any
je n'ai pas utilisé>i didn't use
je n'ai pas utilisé de>i didn't use any
tu n'as pas utilisé>you didn't use
tu n'as pas utilisé de>you didn't use any
il n'a pas utilisé>he didn't use
il n'a pas utilisé de>he didn't use any
elle n'a pas utilisé>she didn't use
elle n'a pas utilisé de>she didn't use any
nous n'avons pas utilisé>we didn't use
nous n'avons pas utilisé de>we didn't use any
vous n'avez pas utilisé>you didn't use
vous n'avez pas utilisé de>you didn't use any
ils n'ont pas utilisé>they didn't use
ils n'ont pas utilisé de>they didn't use any
elles n'ont pas utilisé>they didn't use
elles n'ont pas utilisé de>they didn't use any
je n'ai pas essayé>i didn't try
je n'ai pas essayé de>i didn't try any
tu n'as pas essayé>you didn't try
tu n'as pas essayé de>you didn't try any
il n'a pas essayé>he didn't try
il n'a pas essayé de>he didn't try any
elle n'a pas essayé>she didn't try
elle n'a pas essayé de>she didn't try any
nous n'avons pas essayé>we didn't try
nous n'avons pas essayé de>we didn't try any
vous n'avez pas essayé>you didn't try
vous n'avez pas essayé de>you didn't try any
ils n'ont pas essayé>they didn't try
ils n'ont pas essayé de>they didn't try any
elles n'ont pas essayé>they didn't try
elles n'ont pas essayé de>they didn't try any
je n'ai pas joué>i didn't play
je n'ai pas joué de>i didn't play any
tu n'as pas joué>you didn't play
tu n'as pas joué de>you didn't play any
il n'a pas joué>he didn't play
il n'a pas joué de>he didn't play any
elle n'a pas joué>she didn't play
elle n'a pas joué de>she didn't play any
nous n'avons pas joué>we didn't play
nous n'avons pas joué de>we didn't play any
vous n'avez pas joué>you didn't play
vous n'avez pas joué de>you didn't play any
ils n'ont pas joué>they didn't play
ils n'ont pas joué de>they didn't play any
elles n'ont pas joué>they didn't play
elles n'ont pas joué de>they didn't play any
je n'ai pas aidé>i didn't help
je n'ai pas aidé de>i didn't help any
tu n'as pas aidé>you didn't help
tu n'as pas aidé de>you didn't help any
il n'a pas aidé>he didn't help
il n'a pas aidé de>he didn't help any
elle n'a pas aidé>she didn't help
elle n'a pas aidé de>she didn't help any
nous n'avons pas aidé>we didn't help
nous n'avons pas aidé de>we didn't help any
vous n'avez pas aidé>you didn't help
vous n'avez pas aidé de>you didn't help any
ils n'ont pas aidé>they didn't help
ils n'ont pas aidé de>they didn't help any
elles n'ont pas aidé>they didn't help
elles n'ont pas aidé de>they didn't help any
je n'ai pas attendu>i didn't wait
je n'ai pas attendu de>i didn't wait any
tu n'as pas attendu>you didn't wait
tu n'as pas attendu de>you didn't wait any
il n'a pas attendu>he didn't wait
il n'a pas attendu de>he didn't wait any
elle n'a pas attendu>she didn't wait
elle n'a pas attendu de>she didn't wait any
nous n'avons pas attendu>we didn't wait
nous n'avons pas attendu de>we didn't wait any
vous n'avez pas attendu>you didn't wait
vous n'avez pas attendu de>you didn't wait any
ils n'ont pas attendu>they didn't wait
ils n'ont pas attendu de>they didn't wait any
elles n'ont pas attendu>they didn't wait
elles n'ont pas attendu de>they didn't wait any
je n'ai pas travaillé>i didn't work
je n'ai pas travaillé de>i didn't work any
tu n'as pas travaillé>you didn't work
tu n'as pas travaillé de>you didn't work any
il n'a pas travaillé>he didn't work
il n'a pas travaillé de>he didn't work any
elle n'a pas travaillé>she didn't work
elle n'a pas travaillé de>she didn't work any
nous n'avons pas travaillé>we didn't work
nous n'avons pas travaillé de>we didn't work any
vous n'avez pas travaillé>you didn't work
vous n'avez pas travaillé de>you didn't work any
ils n'ont pas travaillé>they didn't work
ils n'ont pas travaillé de>they didn't work any
elles n'ont pas travaillé>they didn't work
elles n'ont pas travaillé de>they didn't work any
je n'ai pas acheté>i didn't buy
je n'ai pas acheté de>i didn't buy any
tu n'as pas acheté>you didn't buy
tu n'as pas acheté de>you didn't buy any
il n'a pas acheté>he didn't buy
il n'a pas acheté de>he didn't buy any
elle n'a pas acheté>she didn't buy
elle n'a pas acheté de>she didn't buy any
nous n'avons pas acheté>we didn't buy
nous n'avons pas acheté de>we didn't buy any
vous n'avez pas acheté>you didn't buy
vous n'avez pas acheté de>you didn't buy any
ils n'ont pas acheté>they didn't buy
ils n'ont pas acheté de>they didn't buy any
elles n'ont pas acheté>they didn't buy
elles n'ont pas acheté de>they didn't buy any
je n'ai pas vendu>i didn't sell
je n'ai pas vendu de>i didn't sell any
tu n'as pas vendu>you didn't sell
tu n'as pas vendu de>you didn't sell any
il n'a pas vendu>he didn't sell
il n'a pas vendu de>he didn't sell any
elle n'a pas vendu>she didn't sell
elle n'a pas vendu de>she didn't sell any
nous n'avons pas vendu>we didn't sell
nous n'avons pas vendu de>we didn't sell any
vous n'avez pas vendu>you didn't sell
vous n'avez pas vendu de>you didn't sell any
ils n'ont pas vendu>they didn't sell
ils n'ont pas vendu de>they didn't sell any
elles n'ont pas vendu>they didn't sell
elles n'ont pas vendu de>they didn't sell any
je n'ai pas rejoint>i didn't join
je n'ai pas rejoint de>i didn't join any
tu n'as pas rejoint>you didn't join
tu n'as pas rejoint de>you didn't join any
il n'a pas rejoint>he didn't join
il n'a pas rejoint de>he didn't join any
elle n'a pas rejoint>she didn't join
elle n'a pas rejoint de>she didn't join any
nous n'avons pas rejoint>we didn't join
nous n'avons pas rejoint de>we didn't join any
vous n'avez pas rejoint>you didn't join
vous n'avez pas rejoint de>you didn't join any
ils n'ont pas rejoint>they didn't join
ils n'ont pas rejoint de>they didn't join any
elles n'ont pas rejoint>they didn't join
elles n'ont pas rejoint de>they didn't join any
je n'ai pas invité>i didn't invite
je n'ai pas invité de>i didn't invite any
tu n'as pas invité>you didn't invite
tu n'as pas invité de>you didn't invite any
il n'a pas invité>he didn't invite
il n'a pas invité de>he didn't invite any
elle n'a pas invité>she didn't invite
elle n'a pas invité de>she didn't invite any
nous n'avons pas invité>we didn't invite
nous n'avons pas invité de>we didn't invite any
vous n'avez pas invité>you didn't invite
vous n'avez pas invité de>you didn't invite any
ils n'ont pas invité>they didn't invite
ils n'ont pas invité de>they didn't invite any
elles n'ont pas invité>they didn't invite
elles n'ont pas invité de>they didn't invite any
je n'ai pas tué>i didn't kill
je n'ai pas tué de>i didn't kill any
tu n'as pas tué>you didn't kill
tu n'as pas tué de>you didn't kill any
il n'a pas tué>he didn't kill
il n'a pas tué de>he didn't kill any
elle n'a pas tué>she didn't kill
elle n'a pas tué de>she didn't kill any
nous n'avons pas tué>we didn't kill
nous n'avons pas tué de>we didn't kill any
vous n'avez pas tué>you didn't kill
vous n'avez pas tué de>you didn't kill any
ils n'ont pas tué>they didn't kill
ils n'ont pas tué de>they didn't kill any
elles n'ont pas tué>they didn't kill
elles n'ont pas tué de>they didn't kill any
je ne suis pas mort>i didn't die
je ne suis pas mort de>i didn't die any
tu n'es pas mort>you didn't die
tu n'es pas mort de>you didn't die any
il n'est pas mort>he didn't die
il n'est pas mort de>he didn't die any
elle n'est pas mort>she didn't die
elle n'est pas mort de>she didn't die any
nous ne sommes pas mort>we didn't die
nous ne sommes pas mort de>we didn't die any
vous n'êtes pas mort>you didn't die
vous n'êtes pas mort de>you didn't die any
ils ne sont pas mort>they didn't die
ils ne sont pas mort de>they didn't die any
elles ne sont pas mort>they didn't die
elles ne sont pas mort de>they didn't die any
je n'ai pas gagné>i didn't win
je n'ai pas gagné de>i didn't win any
tu n'as pas gagné>you didn't win
tu n'as pas gagné de>you didn't win any
il n'a pas gagné>he didn't win
il n'a pas gagné de>he didn't win any
elle n'a pas gagné>she didn't win
elle n'a pas gagné de>she didn't win any
nous n'avons pas gagné>we didn't win
nous n'avons pas gagné de>we didn't win any
vous n'avez pas gagné>you didn't win
vous n'avez pas gagné de>you didn't win any
ils n'ont pas gagné>they didn't win
ils n'ont pas gagné de>they didn't win any
elles n'ont pas gagné>they didn't win
elles n'ont pas gagné de>they didn't win any
je n'ai pas perdu>i didn't lose
je n'ai pas perdu de>i didn't lose any
tu n'as pas perdu>you didn't lose
tu n'as pas perdu de>you didn't lose any
il n'a pas perdu>he didn't lose
il n'a pas perdu de>he didn't lose any
elle n'a pas perdu>she didn't lose
elle n'a pas perdu de>she didn't lose any
nous n'avons pas perdu>we didn't lose
nous n'avons pas perdu de>we didn't lose any
vous n'avez pas perdu>you didn't lose
vous n'avez pas perdu de>you didn't lose any
ils n'ont pas perdu>they didn't lose
ils n'ont pas perdu de>they didn't lose any
elles n'ont pas perdu>they didn't lose
elles n'ont pas perdu de>they didn't lose any
je n'ai pas couru>i didn't run
je n'ai pas couru de>i didn't run any
tu n'as pas couru>you didn't run
tu n'as pas couru de>you didn't run any
il n'a pas couru>he didn't run
il n'a pas couru de>he didn't run any
elle n'a pas couru>she didn't run
elle n'a pas couru de>she didn't run any
nous n'avons pas couru>we didn't run
nous n'avons pas couru de>we didn't run any
vous n'avez pas couru>you didn't run
vous n'avez pas couru de>you didn't run any
ils n'ont pas couru>they didn't run
ils n'ont pas couru de>they didn't run any
elles n'ont pas couru>they didn't run
elles n'ont pas couru de>they didn't run any
je ne suis pas parti>i didn't leave
je ne suis pas parti de>i didn't leave any
tu n'es pas parti>you didn't leave
tu n'es pas parti de>you didn't leave any
il n'est pas parti>he didn't leave
il n'est pas parti de>he didn't leave any
elle n'est pas parti>she didn't leave
elle n'est pas parti de>she didn't leave any
nous ne sommes pas parti>we didn't leave
nous ne sommes pas parti de>we didn't leave any
vous n'êtes pas parti>you didn't leave
vous n'êtes pas parti de>you didn't leave any
ils ne sont pas parti>they didn't leave
ils ne sont pas parti de>they didn't leave any
elles ne sont pas parti>they didn't leave
elles ne sont pas parti de>they didn't leave any
je ne suis pas resté>i didn't stay
je ne suis pas resté de>i didn't stay any
tu n'es pas resté>you didn't stay
tu n'es pas resté de>you didn't stay any
il n'est pas resté>he didn't stay
il n'est pas resté de>he didn't stay any
elle n'est pas resté>she didn't stay
elle n'est pas resté de>she didn't stay any
nous ne sommes pas resté>we didn't stay
nous ne sommes pas resté de>we didn't stay any
vous n'êtes pas resté>you didn't stay
vous n'êtes pas resté de>you didn't stay any
ils ne sont pas resté>they didn't stay
ils ne sont pas resté de>they didn't stay any
elles ne sont pas resté>they didn't stay
elles ne sont pas resté de>they didn't stay any
je n'ai pas rencontré>i didn't meet
je n'ai pas rencontré de>i didn't meet any
tu n'as pas rencontré>you didn't meet
tu n'as pas rencontré de>you didn't meet any
il n'a pas rencontré>he didn't meet
il n'a pas rencontré de>he didn't meet any
elle n'a pas rencontré>she didn't meet
elle n'a pas rencontré de>she didn't meet any
nous n'avons pas rencontré>we didn't meet
nous n'avons pas rencontré de>we didn't meet any
vous n'avez pas rencontré>you didn't meet
vous n'avez pas rencontré de>you didn't meet any
ils n'ont pas rencontré>they didn't meet
ils n'ont pas rencontré de>they didn't meet any
elles n'ont pas rencontré>they didn't meet
elles n'ont pas rencontré de>they didn't meet any
je n'ai pas suivi>i didn't follow
je n'ai pas suivi de>i didn't follow any
tu n'as pas suivi>you didn't follow
tu n'as pas suivi de>you didn't follow any
il n'a pas suivi>he didn't follow
il n'a pas suivi de>he didn't follow any
elle n'a pas suivi>she didn't follow
elle n'a pas suivi de>she didn't follow any
nous n'avons pas suivi>we didn't follow
nous n'avons pas suivi de>we didn't follow any
vous n'avez pas suivi>you didn't follow
vous n'avez pas suivi de>you didn't follow any
ils n'ont pas suivi>they didn't follow
ils n'ont pas suivi de>they didn't follow any
elles n'ont pas suivi>they didn't follow
elles n'ont pas suivi de>they didn't follow any
je n'ai pas arrêté>i didn't stop
je n'ai pas arrêté de>i didn't stop any
tu n'as pas arrêté>you didn't stop
tu n'as pas arrêté de>you didn't stop any
il n'a pas arrêté>he didn't stop
il n'a pas arrêté de>he didn't stop any
elle n'a pas arrêté>she didn't stop
elle n'a pas arrêté de>she didn't stop any
nous n'avons pas arrêté>we didn't stop
nous n'avons pas arrêté de>we didn't stop any
vous n'avez pas arrêté>you didn't stop
vous n'avez pas arrêté de>you didn't stop any
ils n'ont pas arrêté>they didn't stop
ils n'ont pas arrêté de>they didn't stop any
elles n'ont pas arrêté>they didn't stop
elles n'ont pas arrêté de>they didn't stop any
je n'ai pas commencé>i didn't start
je n'ai pas commencé de>i didn't start any
tu n'as pas commencé>you didn't start
tu n'as pas commencé de>you didn't start any
il n'a pas commencé>he didn't start
il n'a pas commencé de>he didn't start any
elle n'a pas commencé>she didn't start
elle n'a pas commencé de>she didn't start any
nous n'avons pas commencé>we didn't start
nous n'avons pas commencé de>we didn't start any
vous n'avez pas commencé>you didn't start
vous n'avez pas commencé de>you didn't start any
ils n'ont pas commencé>they didn't start
ils n'ont pas commencé de>they didn't start any
elles n'ont pas commencé>they didn't start
elles n'ont pas commencé de>they didn't start any
je n'ai pas fini>i didn't finish
je n'ai pas fini de>i didn't finish any
tu n'as pas fini>you didn't finish
tu n'as pas fini de>you didn't finish any
il n'a pas fini>he didn't finish
il n'a pas fini de>he didn't finish any
elle n'a pas fini>she didn't finish
elle n'a pas fini de>she didn't finish any
nous n'avons pas fini>we didn't finish
nous n'avons pas fini de>we didn't finish any
vous n'avez pas fini>you didn't finish
vous n'avez pas fini de>you didn't finish any
ils n'ont pas fini>they didn't finish
ils n'ont pas fini de>they didn't finish any
elles n'ont pas fini>they didn't finish
elles n'ont pas fini de>they didn't finish any
je n'ai pas réparé>i didn't fix
je n'ai pas réparé de>i didn't fix any
tu n'as pas réparé>you didn't fix
tu n'as pas réparé de>you didn't fix any
il n'a pas réparé>he didn't fix
il n'a pas réparé de>he didn't fix any
elle n'a pas réparé>she didn't fix
elle n'a pas réparé de>she didn't fix any
nous n'avons pas réparé>we didn't fix
nous n'avons pas réparé de>we didn't fix any
vous n'avez pas réparé>you didn't fix
vous n'avez pas réparé de>you didn't fix any
ils n'ont pas réparé>they didn't fix
ils n'ont pas réparé de>they didn't fix any
elles n'ont pas réparé>they didn't fix
elles n'ont pas réparé de>they didn't fix any
je n'ai pas apporté>i didn't bring
je n'ai pas apporté de>i didn't bring any
tu n'as pas apporté>you didn't bring
tu n'as pas apporté de>you didn't bring any
il n'a pas apporté>he didn't bring
il n'a pas apporté de>he didn't bring any
elle n'a pas apporté>she didn't bring
elle n'a pas apporté de>she didn't bring any
nous n'avons pas apporté>we didn't bring
nous n'avons pas apporté de>we didn't bring any
vous n'avez pas apporté>you didn't bring
vous n'avez pas apporté de>you didn't bring any
ils n'ont pas apporté>they didn't bring
ils n'ont pas apporté de>they didn't bring any
elles n'ont pas apporté>they didn't bring
elles n'ont pas apporté de>they didn't bring any
je n'ai pas envoyé>i didn't send
je n'ai pas envoyé de>i didn't send any
tu n'as pas envoyé>you didn't send
tu n'as pas envoyé de>you didn't send any
il n'a pas envoyé>he didn't send
il n'a pas envoyé de>he didn't send any
elle n'a pas envoyé>she didn't send
elle n'a pas envoyé de>she didn't send any
nous n'avons pas envoyé>we didn't send
nous n'avons pas envoyé de>we didn't send any
vous n'avez pas envoyé>you didn't send
vous n'avez pas envoyé de>you didn't send any
ils n'ont pas envoyé>they didn't send
ils n'ont pas envoyé de>they didn't send any
elles n'ont pas envoyé>they didn't send
elles n'ont pas envoyé de>they didn't send any
je n'ai pas appelé>i didn't call
je n'ai pas appelé de>i didn't call any
tu n'as pas appelé>you didn't call
tu n'as pas appelé de>you didn't call any
il n'a pas appelé>he didn't call
il n'a pas appelé de>he didn't call any
elle n'a pas appelé>she didn't call
elle n'a pas appelé de>she didn't call any
nous n'avons pas appelé>we didn't call
nous n'avons pas appelé de>we didn't call any
vous n'avez pas appelé>you didn't call
vous n'avez pas appelé de>you didn't call any
ils n'ont pas appelé>they didn't call
ils n'ont pas appelé de>they didn't call any
elles n'ont pas appelé>they didn't call
elles n'ont pas appelé de>they didn't call any
je n'ai pas payé>i didn't pay
je n'ai pas payé de>i didn't pay any
tu n'as pas payé>you didn't pay
tu n'as pas payé de>you didn't pay any
il n'a pas payé>he didn't pay
il n'a pas payé de>he didn't pay any
elle n'a pas payé>she didn't pay
elle n'a pas payé de>she didn't pay any
nous n'avons pas payé>we didn't pay
nous n'avons pas payé de>we didn't pay any
vous n'avez pas payé>you didn't pay
vous n'avez pas payé de>you didn't pay any
ils n'ont pas payé>they didn't pay
ils n'ont pas payé de>they didn't pay any
elles n'ont pas payé>they didn't pay
elles n'ont pas payé de>they didn't pay any
je n'ai pas parlé>i didn't talk
je n'ai pas parlé de>i didn't talk any
tu n'as pas parlé>you didn't talk
tu n'as pas parlé de>you didn't talk any
il n'a pas parlé>he didn't talk
il n'a pas parlé de>he didn't talk any
elle n'a pas parlé>she didn't talk
elle n'a pas parlé de>she didn't talk any
nous n'avons pas parlé>we didn't talk
nous n'avons pas parlé de>we didn't talk any
vous n'avez pas parlé>you didn't talk
vous n'avez pas parlé de>you didn't talk any
ils n'ont pas parlé>they didn't talk
ils n'ont pas parlé de>they didn't talk any
elles n'ont pas parlé>they didn't talk
elles n'ont pas parlé de>they didn't talk any
je n'ai pas compris>i didn't understand
je n'ai pas compris de>i didn't understand any
tu n'as pas compris>you didn't understand
tu n'as pas compris de>you didn't understand any
il n'a pas compris>he didn't understand
il n'a pas compris de>he didn't understand any
elle n'a pas compris>she didn't understand
elle n'a pas compris de>she didn't understand any
nous n'avons pas compris>we didn't understand
nous n'avons pas compris de>we didn't understand any
vous n'avez pas compris>you didn't understand
vous n'avez pas compris de>you didn't understand any
ils n'ont pas compris>they didn't understand
ils n'ont pas compris de>they didn't understand any
elles n'ont pas compris>they didn't understand
elles n'ont pas compris de>they didn't understand any
je n'ai pas oublié>i didn't forget
je n'ai pas oublié de>i didn't forget any
tu n'as pas oublié>you didn't forget
tu n'as pas oublié de>you didn't forget any
il n'a pas oublié>he didn't forget
il n'a pas oublié de>he didn't forget any
elle n'a pas oublié>she didn't forget
elle n'a pas oublié de>she didn't forget any
nous n'avons pas oublié>we didn't forget
nous n'avons pas oublié de>we didn't forget any
vous n'avez pas oublié>you didn't forget
vous n'avez pas oublié de>you didn't forget any
ils n'ont pas oublié>they didn't forget
ils n'ont pas oublié de>they didn't forget any
elles n'ont pas oublié>they didn't forget
elles n'ont pas oublié de>they didn't forget any
je n'ai pas cru>i didn't believe
je n'ai pas cru de>i didn't believe any
tu n'as pas cru>you didn't believe
tu n'as pas cru de>you didn't believe any
il n'a pas cru>he didn't believe
il n'a pas cru de>he didn't believe any
elle n'a pas cru>she didn't believe
elle n'a pas cru de>she didn't believe any
nous n'avons pas cru>we didn't believe
nous n'avons pas cru de>we didn't believe any
vous n'avez pas cru>you didn't believe
vous n'avez pas cru de>you didn't believe any
ils n'ont pas cru>they didn't believe
ils n'ont pas cru de>they didn't believe any
elles n'ont pas cru>they didn't believe
elles n'ont pas cru de>they didn't believe any
je n'ai pas espéré>i didn't hope
je n'ai pas espéré de>i didn't hope any
tu n'as pas espéré>you didn't hope
tu n'as pas espéré de>you didn't hope any
il n'a pas espéré>he didn't hope
il n'a pas espéré de>he didn't hope any
elle n'a pas espéré>she didn't hope
elle n'a pas espéré de>she didn't hope any
nous n'avons pas espéré>we didn't hope
nous n'avons pas espéré de>we didn't hope any
vous n'avez pas espéré>you didn't hope
vous n'avez pas espéré de>you didn't hope any
ils n'ont pas espéré>they didn't hope
ils n'ont pas espéré de>they didn't hope any
elles n'ont pas espéré>they didn't hope
elles n'ont pas espéré de>they didn't hope any
je n'ai pas souhaité>i didn't wish
je n'ai pas souhaité de>i didn't wish any
tu n'as pas souhaité>you didn't wish
tu n'as pas souhaité de>you didn't wish any
il n'a pas souhaité>he didn't wish
il n'a pas souhaité de>he didn't wish any
elle n'a pas souhaité>she didn't wish
elle n'a pas souhaité de>she didn't wish any
nous n'avons pas souhaité>we didn't wish
nous n'avons pas souhaité de>we didn't wish any
vous n'avez pas souhaité>you didn't wish
vous n'avez pas souhaité de>you didn't wish any
ils n'ont pas souhaité>they didn't wish
ils n'ont pas souhaité de>they didn't wish any
elles n'ont pas souhaité>they didn't wish
elles n'ont pas souhaité de>they didn't wish any
je n'ai pas voulu dire>i didn't mean
je n'ai pas voulu dire de>i didn't mean any
tu n'as pas voulu dire>you didn't mean
tu n'as pas voulu dire de>you didn't mean any
il n'a pas voulu dire>he didn't mean
il n'a pas voulu dire de>he didn't mean any
elle n'a pas voulu dire>she didn't mean
elle n'a pas voulu dire de>she didn't mean any
nous n'avons pas voulu dire>we didn't mean
nous n'avons pas voulu dire de>we didn't mean any
vous n'avez pas voulu dire>you didn't mean
vous n'avez pas voulu dire de>you didn't mean any
ils n'ont pas voulu dire>they didn't mean
ils n'ont pas voulu dire de>they didn't mean any
elles n'ont pas voulu dire>they didn't mean
elles n'ont pas voulu dire de>they didn't mean any
je n'ai pas senti>i didn't feel
je n'ai pas senti de>i didn't feel any
tu n'as pas senti>you didn't feel
tu n'as pas senti de>you didn't feel any
il n'a pas senti>he didn't feel
il n'a pas senti de>he didn't feel any
elle n'a pas senti>she didn't feel
elle n'a pas senti de>she didn't feel any
nous n'avons pas senti>we didn't feel
nous n'avons pas senti de>we didn't feel any
vous n'avez pas senti>you didn't feel
vous n'avez pas senti de>you didn't feel any
ils n'ont pas senti>they didn't feel
ils n'ont pas senti de>they didn't feel any
elles n'ont pas senti>they didn't feel
elles n'ont pas senti de>they didn't feel any
je n'ai pas entendu>i didn't hear
je n'ai pas entendu de>i didn't hear any
tu n'as pas entendu>you didn't hear
tu n'as pas entendu de>you didn't hear any
il n'a pas entendu>he didn't hear
il n'a pas entendu de>he didn't hear any
elle n'a pas entendu>she didn't hear
elle n'a pas entendu de>she didn't hear any
nous n'avons pas entendu>we didn't hear
nous n'avons pas entendu de>we didn't hear any
vous n'avez pas entendu>you didn't hear
vous n'avez pas entendu de>you didn't hear any
ils n'ont pas entendu>they didn't hear
ils n'ont pas entendu de>they didn't hear any
elles n'ont pas entendu>they didn't hear
elles n'ont pas entendu de>they didn't hear any
je n'ai pas appris>i didn't learn
je n'ai pas appris de>i didn't learn any
tu n'as pas appris>you didn't learn
tu n'as pas appris de>you didn't learn any
il n'a pas appris>he didn't learn
il n'a pas appris de>he didn't learn any
elle n'a pas appris>she didn't learn
elle n'a pas appris de>she didn't learn any
nous n'avons pas appris>we didn't learn
nous n'avons pas appris de>we didn't learn any
vous n'avez pas appris>you didn't learn
vous n'avez pas appris de>you didn't learn any
ils n'ont pas appris>they didn't learn
ils n'ont pas appris de>they didn't learn any
elles n'ont pas appris>they didn't learn
elles n'ont pas appris de>they didn't learn any
je n'ai pas changé>i didn't change
je n'ai pas changé de>i didn't change any
tu n'as pas changé>you didn't change
tu n'as pas changé de>you didn't change any
il n'a pas changé>he didn't change
il n'a pas changé de>he didn't change any
elle n'a pas changé>she didn't change
elle n'a pas changé de>she didn't change any
nous n'avons pas changé>we didn't change
nous n'avons pas changé de>we didn't change any
vous n'avez pas changé>you didn't change
vous n'avez pas changé de>you didn't change any
ils n'ont pas changé>they didn't change
ils n'ont pas changé de>they didn't change any
elles n'ont pas changé>they didn't change
elles n'ont pas changé de>they didn't change any
je n'ai pas ouvert>i didn't open
je n'ai pas ouvert de>i didn't open any
tu n'as pas ouvert>you didn't open
tu n'as pas ouvert de>you didn't open any
il n'a pas ouvert>he didn't open
il n'a pas ouvert de>he didn't open any
elle n'a pas ouvert>she didn't open
elle n'a pas ouvert de>she didn't open any
nous n'avons pas ouvert>we didn't open
nous n'avons pas ouvert de>we didn't open any
vous n'avez pas ouvert>you didn't open
vous n'avez pas ouvert de>you didn't open any
ils n'ont pas ouvert>they didn't open
ils n'ont pas ouvert de>they didn't open any
elles n'ont pas ouvert>they didn't open
elles n'ont pas ouvert de>they didn't open any
je n'ai pas fermé>i didn't close
je n'ai pas fermé de>i didn't close any
tu n'as pas fermé>you didn't close
tu n'as pas fermé de>you didn't close any
il n'a pas fermé>he didn't close
il n'a pas fermé de>he didn't close any
elle n'a pas fermé>she didn't close
elle n'a pas fermé de>she didn't close any
nous n'avons pas fermé>we didn't close
nous n'avons pas fermé de>we didn't close any
vous n'avez pas fermé>you didn't close
vous n'avez pas fermé de>you didn't close any
ils n'ont pas fermé>they didn't close
ils n'ont pas fermé de>they didn't close any
elles n'ont pas fermé>they didn't close
elles n'ont pas fermé de>they didn't close any
je n'ai pas tiré>i didn't pull
je n'ai pas tiré de>i didn't pull any
tu n'as pas tiré>you didn't pull
tu n'as pas tiré de>you didn't pull any
il n'a pas tiré>he didn't pull
il n'a pas tiré de>he didn't pull any
elle n'a pas tiré>she didn't pull
elle n'a pas tiré de>she didn't pull any
nous n'avons pas tiré>we didn't pull
nous n'avons pas tiré de>we didn't pull any
vous n'avez pas tiré>you didn't pull
vous n'avez pas tiré de>you didn't pull any
ils n'ont pas tiré>they didn't pull
ils n'ont pas tiré de>they didn't pull any
elles n'ont pas tiré>they didn't pull
elles n'ont pas tiré de>they didn't pull any
je n'ai pas farmé>i didn't farm
je n'ai pas farmé de>i didn't farm any
tu n'as pas farmé>you didn't farm
tu n'as pas farmé de>you didn't farm any
il n'a pas farmé>he didn't farm
il n'a pas farmé de>he didn't farm any
elle n'a pas farmé>she didn't farm
elle n'a pas farmé de>she didn't farm any
nous n'avons pas farmé>we didn't farm
nous n'avons pas farmé de>we didn't farm any
vous n'avez pas farmé>you didn't farm
vous n'avez pas farmé de>you didn't farm any
ils n'ont pas farmé>they didn't farm
ils n'ont pas farmé de>they didn't farm any
elles n'ont pas farmé>they didn't farm
elles n'ont pas farmé de>they didn't farm any
je n'ai pas mis>i didn't put
je n'ai pas mis de>i didn't put any
tu n'as pas mis>you didn't put
tu n'as pas mis de>you didn't put any
il n'a pas mis>he didn't put
il n'a pas mis de>he didn't put any
elle n'a pas mis>she didn't put
elle n'a pas mis de>she didn't put any
nous n'avons pas mis>we didn't put
nous n'avons pas mis de>we didn't put any
vous n'avez pas mis>you didn't put
vous n'avez pas mis de>you didn't put any
ils n'ont pas mis>they didn't put
ils n'ont pas mis de>they didn't put any
elles n'ont pas mis>they didn't put
elles n'ont pas mis de>they didn't put any
je n'ai pas gardé>i didn't keep
je n'ai pas gardé de>i didn't keep any
tu n'as pas gardé>you didn't keep
tu n'as pas gardé de>you didn't keep any
il n'a pas gardé>he didn't keep
il n'a pas gardé de>he didn't keep any
elle n'a pas gardé>she didn't keep
elle n'a pas gardé de>she didn't keep any
nous n'avons pas gardé>we didn't keep
nous n'avons pas gardé de>we didn't keep any
vous n'avez pas gardé>you didn't keep
vous n'avez pas gardé de>you didn't keep any
ils n'ont pas gardé>they didn't keep
ils n'ont pas gardé de>they didn't keep any
elles n'ont pas gardé>they didn't keep
elles n'ont pas gardé de>they didn't keep any
je n'ai pas laissé>i didn't let
je n'ai pas laissé de>i didn't let any
tu n'as pas laissé>you didn't let
tu n'as pas laissé de>you didn't let any
il n'a pas laissé>he didn't let
il n'a pas laissé de>he didn't let any
elle n'a pas laissé>she didn't let
elle n'a pas laissé de>she didn't let any
nous n'avons pas laissé>we didn't let
nous n'avons pas laissé de>we didn't let any
vous n'avez pas laissé>you didn't let
vous n'avez pas laissé de>you didn't let any
ils n'ont pas laissé>they didn't let
ils n'ont pas laissé de>they didn't let any
elles n'ont pas laissé>they didn't let
elles n'ont pas laissé de>they didn't let any
je n'ai pas vécu>i didn't live
je n'ai pas vécu de>i didn't live any
tu n'as pas vécu>you didn't live
tu n'as pas vécu de>you didn't live any
il n'a pas vécu>he didn't live
il n'a pas vécu de>he didn't live any
elle n'a pas vécu>she didn't live
elle n'a pas vécu de>she didn't live any
nous n'avons pas vécu>we didn't live
nous n'avons pas vécu de>we didn't live any
vous n'avez pas vécu>you didn't live
vous n'avez pas vécu de>you didn't live any
ils n'ont pas vécu>they didn't live
ils n'ont pas vécu de>they didn't live any
elles n'ont pas vécu>they didn't live
elles n'ont pas vécu de>they didn't live any
je n'ai pas bougé>i didn't move
je n'ai pas bougé de>i didn't move any
tu n'as pas bougé>you didn't move
tu n'as pas bougé de>you didn't move any
il n'a pas bougé>he didn't move
il n'a pas bougé de>he didn't move any
elle n'a pas bougé>she didn't move
elle n'a pas bougé de>she didn't move any
nous n'avons pas bougé>we didn't move
nous n'avons pas bougé de>we didn't move any
vous n'avez pas bougé>you didn't move
vous n'avez pas bougé de>you didn't move any
ils n'ont pas bougé>they didn't move
ils n'ont pas bougé de>they didn't move any
elles n'ont pas bougé>they didn't move
elles n'ont pas bougé de>they didn't move any
je n'ai pas tenu>i didn't hold
je n'ai pas tenu de>i didn't hold any
tu n'as pas tenu>you didn't hold
tu n'as pas tenu de>you didn't hold any
il n'a pas tenu>he didn't hold
il n'a pas tenu de>he didn't hold any
elle n'a pas tenu>she didn't hold
elle n'a pas tenu de>she didn't hold any
nous n'avons pas tenu>we didn't hold
nous n'avons pas tenu de>we didn't hold any
vous n'avez pas tenu>you didn't hold
vous n'avez pas tenu de>you didn't hold any
ils n'ont pas tenu>they didn't hold
ils n'ont pas tenu de>they didn't hold any
elles n'ont pas tenu>they didn't hold
elles n'ont pas tenu de>they didn't hold any
je n'ai pas lu>i didn't read
je n'ai pas lu de>i didn't read any
tu n'as pas lu>you didn't read
tu n'as pas lu de>you didn't read any
il n'a pas lu>he didn't read
il n'a pas lu de>he didn't read any
elle n'a pas lu>she didn't read
elle n'a pas lu de>she didn't read any
nous n'avons pas lu>we didn't read
nous n'avons pas lu de>we didn't read any
vous n'avez pas lu>you didn't read
vous n'avez pas lu de>you didn't read any
ils n'ont pas lu>they didn't read
ils n'ont pas lu de>they didn't read any
elles n'ont pas lu>they didn't read
elles n'ont pas lu de>they didn't read any
je n'ai pas écrit>i didn't write
je n'ai pas écrit de>i didn't write any
tu n'as pas écrit>you didn't write
tu n'as pas écrit de>you didn't write any
il n'a pas écrit>he didn't write
il n'a pas écrit de>he didn't write any
elle n'a pas écrit>she didn't write
elle n'a pas écrit de>she didn't write any
nous n'avons pas écrit>we didn't write
nous n'avons pas écrit de>we didn't write any
vous n'avez pas écrit>you didn't write
vous n'avez pas écrit de>you didn't write any
ils n'ont pas écrit>they didn't write
ils n'ont pas écrit de>they didn't write any
elles n'ont pas écrit>they didn't write
elles n'ont pas écrit de>they didn't write any
je n'ai pas mangé>i didn't eat
je n'ai pas mangé de>i didn't eat any
tu n'as pas mangé>you didn't eat
tu n'as pas mangé de>you didn't eat any
il n'a pas mangé>he didn't eat
il n'a pas mangé de>he didn't eat any
elle n'a pas mangé>she didn't eat
elle n'a pas mangé de>she didn't eat any
nous n'avons pas mangé>we didn't eat
nous n'avons pas mangé de>we didn't eat any
vous n'avez pas mangé>you didn't eat
vous n'avez pas mangé de>you didn't eat any
ils n'ont pas mangé>they didn't eat
ils n'ont pas mangé de>they didn't eat any
elles n'ont pas mangé>they didn't eat
elles n'ont pas mangé de>they didn't eat any
je n'ai pas dormi>i didn't sleep
je n'ai pas dormi de>i didn't sleep any
tu n'as pas dormi>you didn't sleep
tu n'as pas dormi de>you didn't sleep any
il n'a pas dormi>he didn't sleep
il n'a pas dormi de>he didn't sleep any
elle n'a pas dormi>she didn't sleep
elle n'a pas dormi de>she didn't sleep any
nous n'avons pas dormi>we didn't sleep
nous n'avons pas dormi de>we didn't sleep any
vous n'avez pas dormi>you didn't sleep
vous n'avez pas dormi de>you didn't sleep any
ils n'ont pas dormi>they didn't sleep
ils n'ont pas dormi de>they didn't sleep any
elles n'ont pas dormi>they didn't sleep
elles n'ont pas dormi de>they didn't sleep any
je n'ai pas supposé>i didn't guess
je n'ai pas supposé de>i didn't guess any
tu n'as pas supposé>you didn't guess
tu n'as pas supposé de>you didn't guess any
il n'a pas supposé>he didn't guess
il n'a pas supposé de>he didn't guess any
elle n'a pas supposé>she didn't guess
elle n'a pas supposé de>she didn't guess any
nous n'avons pas supposé>we didn't guess
nous n'avons pas supposé de>we didn't guess any
vous n'avez pas supposé>you didn't guess
vous n'avez pas supposé de>you didn't guess any
ils n'ont pas supposé>they didn't guess
ils n'ont pas supposé de>they didn't guess any
elles n'ont pas supposé>they didn't guess
elles n'ont pas supposé de>they didn't guess any
je n'ai pas connecté>i didn't log
je n'ai pas connecté de>i didn't log any
tu n'as pas connecté>you didn't log
tu n'as pas connecté de>you didn't log any
il n'a pas connecté>he didn't log
il n'a pas connecté de>he didn't log any
elle n'a pas connecté>she didn't log
elle n'a pas connecté de>she didn't log any
nous n'avons pas connecté>we didn't log
nous n'avons pas connecté de>we didn't log any
vous n'avez pas connecté>you didn't log
vous n'avez pas connecté de>you didn't log any
ils n'ont pas connecté>they didn't log
ils n'ont pas connecté de>they didn't log any
elles n'ont pas connecté>they didn't log
elles n'ont pas connecté de>they didn't log any
going<aller
coming<venir
getting<obtenir
doing<faire
making<faire
knowing<savoir
thinking<penser
seeing<voir
wanting<vouloir
needing<avoir besoin de
liking<aimer
loving<adorer
hating<détester
taking<prendre
giving<donner
telling<dire
saying<dire
asking<demander
finding<trouver
looking<regarder
watching<regarder
using<utiliser
trying<essayer
playing<jouer
helping<aider
waiting<attendre
working<travailler
buying<acheter
selling<vendre
joining<rejoindre
inviting<inviter
killing<tuer
dying<mourir
winning<gagner
losing<perdre
running<courir
leaving<partir
staying<rester
meeting<rencontrer
following<suivre
stopping<arrêter
starting<commencer
finishing<finir
fixing<réparer
bringing<apporter
sending<envoyer
calling<appeler
paying<payer
talking<parler
speaking<parler
understanding<comprendre
forgetting<oublier
believing<croire
hoping<espérer
wishing<souhaiter
meaning<vouloir dire
feeling<sentir
hearing<entendre
learning<apprendre
changing<changer
opening<ouvrir
closing<fermer
pulling<tirer
farming<farmer
putting<mettre
keeping<garder
letting<laisser
living<vivre
moving<bouger
holding<tenir
reading<lire
writing<écrire
eating<manger
sleeping<dormir
guessing<supposer
logging<se connecter
##INF## acheter adorer aider aimer aller appeler apporter apprendre arrêter attaquer attendre avoir boire bouger capturer changer chercher choisir commencer comprendre continuer courir croire demander descendre dire donner dormir défendre détester entendre entrer envoyer espérer essayer expliquer faire farmer fermer finir gagner garder grouper inviter invoquer jouer laisser lancer lire manger mettre monter montrer mourir obtenir oublier ouvrir parler partir payer penser perdre porter prendre quitter recevoir regarder rejoindre rencontrer rester réparer répondre savoir sentir soigner sortir souhaiter suivre supposer tanker tenir tirer travailler trouver tuer utiliser vendre venir vivre voir vouloir échanger écouter écrire être
##ENV## answer ask attack be believe bring buy call capture carry cast change choose climb close come continue cook craft defend die do eat enter exit explain farm feel find finish fish fix follow forget get give go group guess hate heal hear help hold hope invite join keep kill know learn leave let level like listen live log look loot lose love make mean meet mine move need open pay play pull put queue quit read receive repair roll run say search see sell send show skin sleep speak start stay stop summon take talk tank tell think trade try understand use wait want watch win wish work write
##ING## asking believing bringing buying calling changing closing coming doing dying eating farming feeling finding finishing fixing following forgetting getting giving going guessing hating hearing helping holding hoping inviting joining keeping killing knowing learning leaving letting liking living logging looking losing loving making meaning meeting moving needing opening paying playing pulling putting reading running saying seeing selling sending sleeping speaking starting staying stopping taking talking telling thinking trying understanding using waiting wanting watching winning wishing working writing
##PRI-END##
do<
does<
did<
has<a
have<avoir
wants<veut
anyone<quelqu'un
everyone<tout le monde
does anyone want<quelqu'un veut
who wants<qui veut
who has<qui a
do you have<tu as
do you<tu
looking for group<cherche un groupe
je m'appelle *|my name is *
mon nom est *|my name is *
mon prénom est *>my name is *
comment tu t'appelles|what's your name
comment t'appelles tu>what's your name
tu t'appelles comment>what's your name
comment vous vous appelez>what's your name
enchanté|nice to meet you
j'ai # ans|i am # years old
je suis # ans>i am # years old
mon âge est #>my age is #
mon âge est # ans>my age is # years
quel âge as tu|how old are you
tu as quel âge>how old are you
je viens de *|i'm from *
tu viens d'où|where are you from
d'où viens tu>where are you from
j'habite à *|i live in *
j'habite en *>i live in *
j'habite au *>i live in *
tu habites où|where do you live
je suis à *|i'm in *
je suis en *>i'm in *
je suis de *>i'm from *
je parle français|i speak french
je parle anglais|i speak english
je ne parle pas anglais|i don't speak english
je ne parle pas français|i don't speak french
je suis nouveau|i'm new
je suis nouveau ici>i'm new here
je suis niveau #|i'm level #
tu es quel niveau|what level are you
quel niveau|what level
quelle classe|what class
tu joues quelle classe|what class do you play
tu joues quoi|what do you play
tu vas bien|are you doing well
vous allez bien>are you doing well
comment vas tu|how are you
comment allez vous>how are you
comment tu vas>how are you
je vais bien|i'm fine
ça va bien|it's going well
ça va pas>it's not going well
pas mal|not bad
très bien|very good
et toi|and you
et vous>and you
moi aussi|me too
toi aussi|you too
c'est cool|that's cool
c'est nul|that sucks
c'est vrai|that's true
c'est faux|that's false
c'est bon|it's good
c'est bien|that's good
c'est quoi|what is it
c'est combien|how much is it
c'est où|where is it
c'est pas grave|no big deal
c'est pas>it's not
ce n'est pas|it's not
il n'y a pas|there isn't
il y a un problème|there's a problem
je suis content|i'm happy
je suis triste|i'm sad
je suis fatigué|i'm tired
je suis bloqué|i'm stuck
je suis perdu|i'm lost
j'ai faim|i'm hungry
j'ai besoin d'aide|i need help
tu peux m'aider|can you help me
peux tu m'aider>can you help me
tu veux de l'aide>do you want help
je cherche un groupe|i'm looking for a group
je cherche une guilde|i'm looking for a guild
tu cherches un groupe|are you looking for a group
tu es dans une guilde|are you in a guild
tu veux faire un donjon|do you want to do a dungeon
on fait un donjon|shall we do a dungeon
tu veux grouper|do you want to group up
je peux avoir une invit|can i have an invite
il me faut|i need
où est|where is
où se trouve>where is
comment faire|how to do it
comment on fait|how do we do it
combien ça coûte|how much does it cost
ça coûte combien>how much does it cost
c'est gratuit|it's free
je te paie|i'll pay you
tu acceptes|do you accept
je vais|i'm going to
tu vas|you go
il va|he goes
on va|we're going
on peut|we can
on fait|we do
je fais|i do
tu fais|you do
je dis|i say
tu dis|you say
je sais|i know
tu sais|you know
je pense|i think
je crois|i think
j'aime|i like
tu aimes|do you like
j'adore|i love
je déteste|i hate
je joue|i play
tu joues|do you play
je travaille|i work
tu travailles|do you work
j'attends|i'm waiting
tu attends|are you waiting
je vois|i see
je connais|i know
tu connais|do you know
je dois|i have to
tu dois|you have to
il faut|we need to
je veux bien|i'd love to
je ne peux pas|i can't
je peux pas>i can't
tu ne peux pas|you can't
tu peux pas>you can't
je viens|i'm coming
tu viens|are you coming
j'arrive|i'm coming
j'y vais|i'm going
merci de|thanks for
merci pour|thanks for
je t'en prie>you're welcome
avec plaisir|with pleasure
bien sûr|of course
évidemment|obviously
parce que|because
pourquoi pas|why not
c'est parti|let's go
allons y>let's go
on se voit|see you
rendez vous|meeting
à quelle heure|at what time
quelle heure est il|what time is it
il est # heures|it's # o'clock
ces>these
deux|two
trois|three
quatre|four
cinq|five
sept|seven
huit|eight
neuf|nine
dix|ten
vingt|twenty
trente|thirty
quarante|forty
cinquante|fifty
cent|hundred
mille|thousand
premier|first
dernier|last
âge|age
nom|name
prénom|first name
pays|country
jour|day
nuit|night
semaine|week
mois|month
an|year
ans|years
année|year
heure|hour
heures|hours
temps|time
travail|work
école|school
famille|family
enfant|child
enfants|children
fille|girl
garçon|boy
homme|man
femme|woman
chat|cat
chien|dog
maison|house
voiture|car
jeu|game
jeux|games
musique|music
film|movie
nourriture|food
eau|water
bière|beer
café|coffee
soir|evening
matin|morning
après midi|afternoon
lundi|monday
mardi|tuesday
mercredi|wednesday
jeudi|thursday
vendredi|friday
samedi|saturday
dimanche|sunday
heureux|happy
content|glad
fou|crazy
drôle|funny
gentil|nice
beau|beautiful
belle>beautiful
joli|pretty
nouveau|new
ancien|old
vieux|old
jeune|young
chaud|hot
froid|cold
plein|full
vide|empty
vrai|true
faux|false
seul|alone
ensemble|together
différent|different
même|same
autre|other
prochain|next
possible|possible
impossible|impossible
important|important
sûr|sure
donc|so
alors|so
puis|then
ensuite|then
si|if
comme|as
pendant|during
avant|before
après|after
entre|between
chez|at
depuis|since
jusqu'à|until
quand même|anyway
déjà|already
enfin|finally
seulement|only
juste|just
vraiment|really
sinon|otherwise
cet|this
cette>this
ce|this
ça|that
ceci|this
cela>that
notre|our
votre|your
leur|their
son|his
sa>his
ses>his
me|me
te|you
se|
en|in
au|to the
aux>to the
à|to
y|there
par|by
salut|hi
bonjour|hello
bonsoir|good evening
coucou|hey
bonne nuit|good night
bonne journée|have a nice day
bonne soirée|have a nice evening
au revoir|goodbye
à bientôt|see you soon
à plus|see you later
bienvenue|welcome
merci beaucoup|thank you very much
merci|thanks
de rien|you're welcome
s'il te plaît|please
s'il vous plaît>please
svp>please
stp>please
pardon|sorry
désolé|sorry
excuse moi|excuse me
félicitations|congratulations
bonne chance|good luck
amuse toi bien|have fun
bien joué|well played
oui|yes
non|no
peut être|maybe
d'accord|okay
ça marche|sounds good
pas de souci|no problem
pas de problème|no problem
je ne sais pas|i don't know
je sais pas>i don't know
je comprends|i understand
je ne comprends pas|i don't understand
tu parles français|do you speak french
tu parles anglais|do you speak english
un instant|one moment
une seconde|one second
une minute|one minute
attends|wait
attendez>wait
est ce que>
comment ça va|how are you
ça va|how's it going
quoi de neuf|what's up
je suis|i am
tu es|you are
il est|he is
elle est|she is
c'est|it's
j'ai besoin de|i need
j'ai|i have
tu as|you have
vous avez>you have
je veux|i want
tu veux|do you want
je peux|i can
tu peux|can you
vous pouvez>can you
je cherche|i'm looking for
tu cherches|are you looking for
je vends|i'm selling
j'achète|i'm buying
je voudrais|i would like
il y a|there is
je|i
tu|you
vous>you
il|he
elle|she
nous|we
ils|they
on>we
moi|me
mon|my
ma>my
mes>my
ton|your
ta>your
tes>your
le|the
la|the
les>the
un|a
une>a
des|some
de|of
et|and
ou|or
mais|but
avec|with
sans|without
pour|for
dans|in
sur|on
pas|not
ne>
très|very
trop|too much
beaucoup|a lot
peu|a little
assez|enough
aussi|also
tout|all
tous>all
rien|nothing
quelque chose|something
quelqu'un|someone
personne|nobody
ici|here
là>there
combien|how much
prix|price
cher|expensive
pas cher|cheap
gratuit|free
or|gold
argent|silver
quoi|what
qui|who
quand|when
où|where
pourquoi|why
comment|how
quel|which
quelle>which
maintenant|now
aujourd'hui|today
demain|tomorrow
hier|yesterday
ce soir|tonight
plus tard|later
tout de suite|right now
bientôt|soon
toujours|always
jamais|never
encore|again
bon|good
bonne>good
mauvais|bad
super|great
génial|awesome
nul>bad
facile|easy
difficile|hard
rapide|fast
lent|slow
grand|big
petit|small
prêt|ready
prête>ready
mort|dead
donjon|dungeon
groupe|group
guilde|guild
quête|quest
objet|item
arme|weapon
armure|armor
monture|mount
métier|profession
métiers|professions
couture|tailoring
forge|blacksmithing
joaillerie|jewelcrafting
travail du cuir|leatherworking
ingénierie|engineering
alchimie|alchemy
enchantement|enchanting
calligraphie|inscription
herboristerie|herbalism
minage|mining
dépeçage|skinning
cuisine|cooking
pêche|fishing
premiers soins|first aid
soigneur|healer
tank|tank
dégâts|damage
soins|healing
niveau|level
classe|class
joueur|player
personnage|character
serveur|server
royaume|realm
arène|arena
champ de bataille|battleground
classement|rating
victoire|victory
défaite|defeat
boss|boss
portail|portal
ville|city
ami|friend
amis|friends
frère|bro
mec|dude
aide|help
aide moi|help me
aider>help
donne|give
donne moi|give me
envoie|send
vends|sell
vendre>sell
acheter|buy
échanger|trade
échange>trade
regarde|look
viens|come
va|go
allez>go
on y va|let's go
vite|quickly
reste|stay
arrête|stop
commence|start
commencer>start
fini|done
terminé>done
essaie|try
essayer>try
trouve|find
trouver>find
voir|see
dire|say
parler|talk
jouer|play
faire|do
fais>do
avoir|have
être|be
veux|want
peux|can
dois|must
invite|invite
invite moi|invite me
inviter>invite
rejoins|join
rejoindre>join
invoque moi|summon me
ressuscite moi|resurrect me
je reviens|be right back
attention|careful
dommage|too bad
cherche|looking for
recherche>looking for
besoin|need
avidité|greed
hello<bonjour
hey<coucou
thx<merci
ty<merci
thank you<merci
plz<s'il te plaît
pls<s'il te plaît
sorry<désolé
yep<oui
yeah<oui
nope<non
ok<d'accord
i'm<je suis
i'll<je vais
you're<tu es
what's<quoi
wts<je vends
wtb<j'achète
wtt<j'échange
lfg<cherche un groupe
lfm<cherche des joueurs
lf<cherche
one sec<une seconde
are<sont
was<était
will<va
to<à
of<de
at<à
from<de
by<par
we<nous
this<ce
that<ça
these<ces

a<un
an<un
than<que
at<à
by<par
from<de
into<dans
of<de
onto<sur
out<dehors
over<sur
up<en haut
down<en bas
off<hors
about<à propos de
through<à travers
under<sous
against<contre
any<n'importe quel
both<les deux
each<chaque
every<chaque
few<peu de
more<plus
most<la plupart
some<quelques
such<tel
nor<ni
own<propre
too<trop
can<peut
will<va
should<devrait
would<voudrait
could<pourrait
may<peut-être
might<pourrait
must<doit
shall<devra
that<ça
these<ces
those<ceux
me<moi
myself<moi-même
us<nous
him<lui
her<elle
its<son
them<eux
it<il
what<quoi
which<quel
whom<qui
are<sont
were<étaient
be<être
been<été
being<étant
has<a
had<avait
get<obtenir
got<a obtenu
getting<obtenir
make<faire
made<fait
know<savoir
knew<savait
think<penser
thought<pensait
take<prendre
took<a pris
see<voir
saw<a vu
come<venir
came<est venu
look<regarder
use<utiliser
used<utilisé
find<trouver
found<trouvé
give<donner
gave<a donné
tell<dire
told<a dit
work<travailler
call<appeler
try<essayer
tried<a essayé
ask<demander
asked<a demandé
feel<sentir
felt<a senti
leave<partir
left<parti
put<mettre
mean<signifier
keep<garder
kept<gardé
let<laisser
begin<commencer
seem<sembler
talk<parler
turn<tourner
start<commencer
show<montrer
hear<entendre
heard<entendu
play<jouer
run<courir
move<bouger
live<vivre
believe<croire
hold<tenir
bring<apporter
happen<arriver
write<écrire
sit<s'asseoir
stand<se tenir
lose<perdre
lost<perdu
pay<payer
paid<payé
meet<rencontrer
include<inclure
continue<continuer
set<mettre
learn<apprendre
change<changer
lead<mener
understand<comprendre
watch<regarder
follow<suivre
stop<arrêter
create<créer
speak<parler
read<lire
spend<dépenser
grow<grandir
open<ouvrir
walk<marcher
win<gagner
won<gagné
teach<enseigner
offer<offrir
remember<se souvenir
love<aimer
consider<considérer
appear<apparaître
serve<servir
die<mourir
died<est mort
send<envoyer
sent<envoyé
expect<attendre
build<construire
stay<rester
fall<tomber
cut<couper
reach<atteindre
kill<tuer
killed<tué
remain<rester
suggest<suggérer
raise<lever
pass<passer
require<exiger
report<signaler
decide<décider
pull<tirer
fix<réparer
fixed<réparé
break<casser
broken<cassé
shut<fermer
shutdown<arrêt
crash<plantage
last<durer
lasts<dure
people<gens
person<personne
man<homme
woman<femme
child<enfant
world<monde
life<vie
hand<main
part<partie
place<endroit
case<cas
week<semaine
company<entreprise
system<système
program<programme
question<question
number<nombre
night<nuit
point<point
home<maison
water<eau
room<pièce
mother<mère
area<zone
money<argent
story<histoire
fact<fait
month<mois
lot<beaucoup
right<droit
book<livre
eye<oeil
job<travail
word<mot
business<affaire
side<côté
kind<sorte
head<tête
house<maison
service<service
father<père
power<pouvoir
hour<heure
line<ligne
end<fin
member<membre
law<loi
car<voiture
city<ville
team<équipe
minute<minute
idea<idée
kid<gamin
body<corps
information<information
back<retour
parent<parent
face<visage
others<les autres
door<porte
health<santé
war<guerre
history<histoire
party<groupe
result<résultat
morning<matin
reason<raison
girl<fille
guy<mec
guys<les gars
dude<mec
moment<moment
air<air
force<force
baddie<méchant
baddies<méchants
enemy<ennemi
enemies<ennemis
server<serveur
servers<serveurs
staff<staff
patch<mise à jour
update<mise à jour
bug<bug
bugs<bugs
event<évènement
queue<file d'attente
long<long
great<génial
little<petit
big<grand
high<haut
different<différent
small<petit
large<grand
next<prochain
early<tôt
young<jeune
important<important
public<public
able<capable
real<réel
best<meilleur
better<mieux
worse<pire
worst<le pire
slow<lent
strong<fort
weak<faible
low<bas
safe<sûr
alive<vivant
wrong<faux
fine<bien
angry<en colère
tired<fatigué
hungry<affamé
busy<occupé
afraid<peur
still<encore
often<souvent
sometimes<parfois
usually<généralement
maybe<peut-être
probably<probablement
actually<en fait
even<même
ever<jamais
once<une fois
twice<deux fois
soon<bientôt
yet<encore
far<loin
near<près
away<loin
around<autour
almost<presque
quite<assez
rather<plutôt
enough<assez
much<beaucoup
many<beaucoup de
less<moins
least<le moins
there<là
there's<il y a
that's<c'est
what's<qu'est-ce que
who's<qui est
he's<il est
she's<elle est
we're<nous sommes
they're<ils sont
i've<j'ai
we've<nous avons
they've<ils ont
you've<tu as
i'd<je voudrais
let's<allons
don't<ne pas
doesn't<ne pas
didn't<n'a pas
isn't<n'est pas
aren't<ne sont pas
wasn't<n'était pas
won't<ne va pas
can't<ne peut pas
couldn't<ne pouvait pas
shouldn't<ne devrait pas
wouldn't<ne voudrait pas
haven't<n'a pas
hasn't<n'a pas
i'll<je vais
you'll<tu vas
we'll<nous allons
they'll<ils vont
it'll<ça va
yeah<ouais
yep<oui
nope<non
gonna<va
wanna<veut
gotta<doit
kinda<un peu
sorta<en quelque sorte
lemme<laisse-moi
dunno<je sais pas
cuz<parce que
till<jusqu'à
also<aussi
ez<facile
wp<bien joué
too many<trop de
so many<tellement de
so much<tellement
a lot of<beaucoup de
lots of<beaucoup de
a lot<beaucoup
a few<quelques
a bit<un peu
a little<un peu
kind of<un peu
sort of<en quelque sorte
at the moment<en ce moment
for now<pour l'instant
as soon as<dès que
as well<aussi
as well as<ainsi que
in order to<afin de
such as<comme
all the time<tout le temps
at all<du tout
look for<chercher
looking for<cherche
find out<découvrir
shut it down<l'éteindre
shut down<arrêter
up to<jusqu'à
how many<combien
how long<combien de temps
what if<et si
no way<pas question
let me<laisse-moi
come on<allez
hurry up<dépêche-toi
wait for<attendre
be careful<fais attention
watch out<attention
take care<prends soin de toi
i mean<je veux dire
you know<tu sais
i guess<je suppose
i hope<j'espère
long time no see<ça fait longtemps
no sleep<pas de sommeil
will last<va durer
will be<sera
going to<va
want to<veut
have to<doit
has to<doit
need to<a besoin de
there are<il y a
there is<il y a
right now<maintenant
go up<monter
go down<descendre
go to<aller à
come back<revenir
get out<sortir
get in<entrer
log in<se connecter
log out<se déconnecter
sign up<s'inscrire

est>is
sont>are
es>are
suis>am
sommes>are
êtes>are
ai>have
as>have
a>has
ont>have
avons>have
avez>have
fait>done
vas>go
vont>go
peut>can
veut>wants
doit>must
pas>not
plus>more
moins>less
rien>nothing
chaque>each
autres>others
quelque>some
plusieurs>several
souvent>often
parfois>sometimes
que>that
dont>whose
celui>the one
celle>the one
ceux>those
lui>him
eux>them
toi>you
sous>under
contre>against
vers>towards
going on<se passe
is going on<se passe
what's going on<que se passe-t-il
we need<il nous faut
you need<il te faut
flag carrier<porteur du drapeau
carrier<porteur
flag<drapeau
flags<drapeaux
capture<capturer
defend<défendre
attack<attaquer
defending<défend
attacking<attaque
incoming<arrive
inc<arrive
mid<milieu
graveyard<cimetière
gy<cimetière
tower<tour
bridge<pont
fun<amusant
##GEN-START##
i go<je vais
i don't go<je ne vais pas
do i go<je vais
i went<je suis allé
i didn't go<je ne suis pas allé
did i go<je suis allé
i'm going<je vais
i am going<je vais
am i going<je vais
i've gone<je suis allé
i have gone<je suis allé
have i gone<je suis allé
you go<tu vas
you don't go<tu ne vas pas
do you go<tu vas
you went<tu es allé
you didn't go<tu n'es pas allé
did you go<tu es allé
you're going<tu vas
you are going<tu vas
are you going<tu vas
you've gone<tu es allé
you have gone<tu es allé
have you gone<tu es allé
we go<nous allons
we don't go<nous n'allons pas
do we go<nous allons
we went<nous sommes allé
we didn't go<nous ne sommes pas allé
did we go<nous sommes allé
we're going<nous allons
we are going<nous allons
are we going<nous allons
we've gone<nous sommes allé
we have gone<nous sommes allé
have we gone<nous sommes allé
they go<ils vont
they don't go<ils ne vont pas
do they go<ils vont
they went<ils sont allé
they didn't go<ils ne sont pas allé
did they go<ils sont allé
they're going<ils vont
they are going<ils vont
are they going<ils vont
they've gone<ils sont allé
they have gone<ils sont allé
have they gone<ils sont allé
he goes<il va
he doesn't go<il ne va pas
does he go<il va
he went<il est allé
he didn't go<il n'est pas allé
did he go<il est allé
he's going<il va
he is going<il va
is he going<il va
he has gone<il est allé
has he gone<il est allé
she goes<elle va
she doesn't go<elle ne va pas
does she go<elle va
she went<elle est allé
she didn't go<elle n'est pas allé
did she go<elle est allé
she's going<elle va
she is going<elle va
is she going<elle va
she has gone<elle est allé
has she gone<elle est allé
it goes<il va
it doesn't go<il ne va pas
does it go<il va
it went<il est allé
it didn't go<il n'est pas allé
did it go<il est allé
it's going<il va
it is going<il va
is it going<il va
it has gone<il est allé
has it gone<il est allé
je vais>i go
je ne vais pas>i don't go
tu vas>you go
tu ne vas pas>you don't go
il va>he goes
il ne va pas>he doesn't go
elle va>she goes
elle ne va pas>she doesn't go
nous allons>we go
nous n'allons pas>we don't go
vous allez>you go
vous n'allez pas>you don't go
ils vont>they go
ils ne vont pas>they don't go
elles vont>they go
elles ne vont pas>they don't go
vas tu>do you go
allez vous>do you go
est ce que tu vas>do you go
est ce que vous allez>do you go
je suis allé>i went
tu es allé>you went
il est allé>he went
elle est allé>she went
nous sommes allé>we went
vous êtes allé>you went
ils sont allé>they went
elles sont allé>they went
i come<je viens
i don't come<je ne viens pas
do i come<je viens
i came<je suis venu
i didn't come<je ne suis pas venu
did i come<je suis venu
i'm coming<je viens
i am coming<je viens
am i coming<je viens
i've come<je suis venu
i have come<je suis venu
have i come<je suis venu
you come<tu viens
you don't come<tu ne viens pas
do you come<tu viens
you came<tu es venu
you didn't come<tu n'es pas venu
did you come<tu es venu
you're coming<tu viens
you are coming<tu viens
are you coming<tu viens
you've come<tu es venu
you have come<tu es venu
have you come<tu es venu
we come<nous venons
we don't come<nous ne venons pas
do we come<nous venons
we came<nous sommes venu
we didn't come<nous ne sommes pas venu
did we come<nous sommes venu
we're coming<nous venons
we are coming<nous venons
are we coming<nous venons
we've come<nous sommes venu
we have come<nous sommes venu
have we come<nous sommes venu
they come<ils viennent
they don't come<ils ne viennent pas
do they come<ils viennent
they came<ils sont venu
they didn't come<ils ne sont pas venu
did they come<ils sont venu
they're coming<ils viennent
they are coming<ils viennent
are they coming<ils viennent
they've come<ils sont venu
they have come<ils sont venu
have they come<ils sont venu
he comes<il vient
he doesn't come<il ne vient pas
does he come<il vient
he came<il est venu
he didn't come<il n'est pas venu
did he come<il est venu
he's coming<il vient
he is coming<il vient
is he coming<il vient
he has come<il est venu
has he come<il est venu
she comes<elle vient
she doesn't come<elle ne vient pas
does she come<elle vient
she came<elle est venu
she didn't come<elle n'est pas venu
did she come<elle est venu
she's coming<elle vient
she is coming<elle vient
is she coming<elle vient
she has come<elle est venu
has she come<elle est venu
it comes<il vient
it doesn't come<il ne vient pas
does it come<il vient
it came<il est venu
it didn't come<il n'est pas venu
did it come<il est venu
it's coming<il vient
it is coming<il vient
is it coming<il vient
it has come<il est venu
has it come<il est venu
je viens>i come
je ne viens pas>i don't come
tu viens>you come
tu ne viens pas>you don't come
il vient>he comes
il ne vient pas>he doesn't come
elle vient>she comes
elle ne vient pas>she doesn't come
nous venons>we come
nous ne venons pas>we don't come
vous venez>you come
vous ne venez pas>you don't come
ils viennent>they come
ils ne viennent pas>they don't come
elles viennent>they come
elles ne viennent pas>they don't come
viens tu>do you come
venez vous>do you come
est ce que tu viens>do you come
est ce que vous venez>do you come
je suis venu>i came
tu es venu>you came
il est venu>he came
elle est venu>she came
nous sommes venu>we came
vous êtes venu>you came
ils sont venu>they came
elles sont venu>they came
i get<j'obtiens
i don't get<je n'obtiens pas
do i get<j'obtiens
i got<j'ai obtenu
i didn't get<je n'ai pas obtenu
did i get<j'ai obtenu
i'm getting<j'obtiens
i am getting<j'obtiens
am i getting<j'obtiens
i've gotten<j'ai obtenu
i have gotten<j'ai obtenu
have i gotten<j'ai obtenu
you get<tu obtiens
you don't get<tu n'obtiens pas
do you get<tu obtiens
you got<tu as obtenu
you didn't get<tu n'as pas obtenu
did you get<tu as obtenu
you're getting<tu obtiens
you are getting<tu obtiens
are you getting<tu obtiens
you've gotten<tu as obtenu
you have gotten<tu as obtenu
have you gotten<tu as obtenu
we get<nous obtenons
we don't get<nous n'obtenons pas
do we get<nous obtenons
we got<nous avons obtenu
we didn't get<nous n'avons pas obtenu
did we get<nous avons obtenu
we're getting<nous obtenons
we are getting<nous obtenons
are we getting<nous obtenons
we've gotten<nous avons obtenu
we have gotten<nous avons obtenu
have we gotten<nous avons obtenu
they get<ils obtiennent
they don't get<ils n'obtiennent pas
do they get<ils obtiennent
they got<ils ont obtenu
they didn't get<ils n'ont pas obtenu
did they get<ils ont obtenu
they're getting<ils obtiennent
they are getting<ils obtiennent
are they getting<ils obtiennent
they've gotten<ils ont obtenu
they have gotten<ils ont obtenu
have they gotten<ils ont obtenu
he gets<il obtient
he doesn't get<il n'obtient pas
does he get<il obtient
he got<il a obtenu
he didn't get<il n'a pas obtenu
did he get<il a obtenu
he's getting<il obtient
he is getting<il obtient
is he getting<il obtient
he has gotten<il a obtenu
has he gotten<il a obtenu
she gets<elle obtient
she doesn't get<elle n'obtient pas
does she get<elle obtient
she got<elle a obtenu
she didn't get<elle n'a pas obtenu
did she get<elle a obtenu
she's getting<elle obtient
she is getting<elle obtient
is she getting<elle obtient
she has gotten<elle a obtenu
has she gotten<elle a obtenu
it gets<il obtient
it doesn't get<il n'obtient pas
does it get<il obtient
it got<il a obtenu
it didn't get<il n'a pas obtenu
did it get<il a obtenu
it's getting<il obtient
it is getting<il obtient
is it getting<il obtient
it has gotten<il a obtenu
has it gotten<il a obtenu
j'obtiens>i get
je n'obtiens pas>i don't get
tu obtiens>you get
tu n'obtiens pas>you don't get
il obtient>he gets
il n'obtient pas>he doesn't get
elle obtient>she gets
elle n'obtient pas>she doesn't get
nous obtenons>we get
nous n'obtenons pas>we don't get
vous obtenez>you get
vous n'obtenez pas>you don't get
ils obtiennent>they get
ils n'obtiennent pas>they don't get
elles obtiennent>they get
elles n'obtiennent pas>they don't get
obtiens tu>do you get
obtenez vous>do you get
est ce que tu obtiens>do you get
est ce que vous obtenez>do you get
j'ai obtenu>i got
tu as obtenu>you got
il a obtenu>he got
elle a obtenu>she got
nous avons obtenu>we got
vous avez obtenu>you got
ils ont obtenu>they got
elles ont obtenu>they got
i do<je fais
i don't do<je ne fais pas
do i do<je fais
i did<j'ai fait
i didn't do<je n'ai pas fait
did i do<j'ai fait
i'm doing<je fais
i am doing<je fais
am i doing<je fais
i've done<j'ai fait
i have done<j'ai fait
have i done<j'ai fait
you do<tu fais
you don't do<tu ne fais pas
do you do<tu fais
you did<tu as fait
you didn't do<tu n'as pas fait
did you do<tu as fait
you're doing<tu fais
you are doing<tu fais
are you doing<tu fais
you've done<tu as fait
you have done<tu as fait
have you done<tu as fait
we do<nous faisons
we don't do<nous ne faisons pas
do we do<nous faisons
we did<nous avons fait
we didn't do<nous n'avons pas fait
did we do<nous avons fait
we're doing<nous faisons
we are doing<nous faisons
are we doing<nous faisons
we've done<nous avons fait
we have done<nous avons fait
have we done<nous avons fait
they do<ils font
they don't do<ils ne font pas
do they do<ils font
they did<ils ont fait
they didn't do<ils n'ont pas fait
did they do<ils ont fait
they're doing<ils font
they are doing<ils font
are they doing<ils font
they've done<ils ont fait
they have done<ils ont fait
have they done<ils ont fait
he does<il fait
he doesn't do<il ne fait pas
does he do<il fait
he did<il a fait
he didn't do<il n'a pas fait
did he do<il a fait
he's doing<il fait
he is doing<il fait
is he doing<il fait
he has done<il a fait
has he done<il a fait
she does<elle fait
she doesn't do<elle ne fait pas
does she do<elle fait
she did<elle a fait
she didn't do<elle n'a pas fait
did she do<elle a fait
she's doing<elle fait
she is doing<elle fait
is she doing<elle fait
she has done<elle a fait
has she done<elle a fait
it does<il fait
it doesn't do<il ne fait pas
does it do<il fait
it did<il a fait
it didn't do<il n'a pas fait
did it do<il a fait
it's doing<il fait
it is doing<il fait
is it doing<il fait
it has done<il a fait
has it done<il a fait
je fais>i do
je ne fais pas>i don't do
tu fais>you do
tu ne fais pas>you don't do
il fait>he does
il ne fait pas>he doesn't do
elle fait>she does
elle ne fait pas>she doesn't do
nous faisons>we do
nous ne faisons pas>we don't do
vous faites>you do
vous ne faites pas>you don't do
ils font>they do
ils ne font pas>they don't do
elles font>they do
elles ne font pas>they don't do
fais tu>do you do
faites vous>do you do
est ce que tu fais>do you do
est ce que vous faites>do you do
j'ai fait>i did
tu as fait>you did
il a fait>he did
elle a fait>she did
nous avons fait>we did
vous avez fait>you did
ils ont fait>they did
elles ont fait>they did
i make<je fais
i don't make<je ne fais pas
do i make<je fais
i made<j'ai fait
i didn't make<je n'ai pas fait
did i make<j'ai fait
i'm making<je fais
i am making<je fais
am i making<je fais
i've made<j'ai fait
i have made<j'ai fait
have i made<j'ai fait
you make<tu fais
you don't make<tu ne fais pas
do you make<tu fais
you made<tu as fait
you didn't make<tu n'as pas fait
did you make<tu as fait
you're making<tu fais
you are making<tu fais
are you making<tu fais
you've made<tu as fait
you have made<tu as fait
have you made<tu as fait
we make<nous faisons
we don't make<nous ne faisons pas
do we make<nous faisons
we made<nous avons fait
we didn't make<nous n'avons pas fait
did we make<nous avons fait
we're making<nous faisons
we are making<nous faisons
are we making<nous faisons
we've made<nous avons fait
we have made<nous avons fait
have we made<nous avons fait
they make<ils font
they don't make<ils ne font pas
do they make<ils font
they made<ils ont fait
they didn't make<ils n'ont pas fait
did they make<ils ont fait
they're making<ils font
they are making<ils font
are they making<ils font
they've made<ils ont fait
they have made<ils ont fait
have they made<ils ont fait
he makes<il fait
he doesn't make<il ne fait pas
does he make<il fait
he made<il a fait
he didn't make<il n'a pas fait
did he make<il a fait
he's making<il fait
he is making<il fait
is he making<il fait
he has made<il a fait
has he made<il a fait
she makes<elle fait
she doesn't make<elle ne fait pas
does she make<elle fait
she made<elle a fait
she didn't make<elle n'a pas fait
did she make<elle a fait
she's making<elle fait
she is making<elle fait
is she making<elle fait
she has made<elle a fait
has she made<elle a fait
it makes<il fait
it doesn't make<il ne fait pas
does it make<il fait
it made<il a fait
it didn't make<il n'a pas fait
did it make<il a fait
it's making<il fait
it is making<il fait
is it making<il fait
it has made<il a fait
has it made<il a fait
i know<je sais
i don't know<je ne sais pas
i know that<je sais que
do i know<je sais
i knew<j'ai su
i didn't know<je n'ai pas su
did i know<j'ai su
i'm knowing<je sais
i am knowing<je sais
am i knowing<je sais
i've known<j'ai su
i have known<j'ai su
have i known<j'ai su
you know<tu sais
you don't know<tu ne sais pas
you know that<tu sais que
do you know<tu sais
you knew<tu as su
you didn't know<tu n'as pas su
did you know<tu as su
you're knowing<tu sais
you are knowing<tu sais
are you knowing<tu sais
you've known<tu as su
you have known<tu as su
have you known<tu as su
we know<nous savons
we don't know<nous ne savons pas
we know that<nous savons que
do we know<nous savons
we knew<nous avons su
we didn't know<nous n'avons pas su
did we know<nous avons su
we're knowing<nous savons
we are knowing<nous savons
are we knowing<nous savons
we've known<nous avons su
we have known<nous avons su
have we known<nous avons su
they know<ils savent
they don't know<ils ne savent pas
they know that<ils savent que
do they know<ils savent
they knew<ils ont su
they didn't know<ils n'ont pas su
did they know<ils ont su
they're knowing<ils savent
they are knowing<ils savent
are they knowing<ils savent
they've known<ils ont su
they have known<ils ont su
have they known<ils ont su
he knows<il sait
he doesn't know<il ne sait pas
he knows that<il sait que
does he know<il sait
he knew<il a su
he didn't know<il n'a pas su
did he know<il a su
he's knowing<il sait
he is knowing<il sait
is he knowing<il sait
he has known<il a su
has he known<il a su
she knows<elle sait
she doesn't know<elle ne sait pas
she knows that<elle sait que
does she know<elle sait
she knew<elle a su
she didn't know<elle n'a pas su
did she know<elle a su
she's knowing<elle sait
she is knowing<elle sait
is she knowing<elle sait
she has known<elle a su
has she known<elle a su
it knows<il sait
it doesn't know<il ne sait pas
it knows that<il sait que
does it know<il sait
it knew<il a su
it didn't know<il n'a pas su
did it know<il a su
it's knowing<il sait
it is knowing<il sait
is it knowing<il sait
it has known<il a su
has it known<il a su
je sais>i know
je ne sais pas>i don't know
tu sais>you know
tu ne sais pas>you don't know
il sait>he knows
il ne sait pas>he doesn't know
elle sait>she knows
elle ne sait pas>she doesn't know
nous savons>we know
nous ne savons pas>we don't know
vous savez>you know
vous ne savez pas>you don't know
ils savent>they know
ils ne savent pas>they don't know
elles savent>they know
elles ne savent pas>they don't know
sais tu>do you know
savez vous>do you know
est ce que tu sais>do you know
est ce que vous savez>do you know
j'ai su>i knew
tu as su>you knew
il a su>he knew
elle a su>she knew
nous avons su>we knew
vous avez su>you knew
ils ont su>they knew
elles ont su>they knew
i think<je pense
i don't think<je ne pense pas
i think that<je pense que
do i think<je pense
i thought<j'ai pensé
i didn't think<je n'ai pas pensé
did i think<j'ai pensé
i'm thinking<je pense
i am thinking<je pense
am i thinking<je pense
i've thought<j'ai pensé
i have thought<j'ai pensé
have i thought<j'ai pensé
you think<tu penses
you don't think<tu ne penses pas
you think that<tu penses que
do you think<tu penses
you thought<tu as pensé
you didn't think<tu n'as pas pensé
did you think<tu as pensé
you're thinking<tu penses
you are thinking<tu penses
are you thinking<tu penses
you've thought<tu as pensé
you have thought<tu as pensé
have you thought<tu as pensé
we think<nous pensons
we don't think<nous ne pensons pas
we think that<nous pensons que
do we think<nous pensons
we thought<nous avons pensé
we didn't think<nous n'avons pas pensé
did we think<nous avons pensé
we're thinking<nous pensons
we are thinking<nous pensons
are we thinking<nous pensons
we've thought<nous avons pensé
we have thought<nous avons pensé
have we thought<nous avons pensé
they think<ils pensent
they don't think<ils ne pensent pas
they think that<ils pensent que
do they think<ils pensent
they thought<ils ont pensé
they didn't think<ils n'ont pas pensé
did they think<ils ont pensé
they're thinking<ils pensent
they are thinking<ils pensent
are they thinking<ils pensent
they've thought<ils ont pensé
they have thought<ils ont pensé
have they thought<ils ont pensé
he thinks<il pense
he doesn't think<il ne pense pas
he thinks that<il pense que
does he think<il pense
he thought<il a pensé
he didn't think<il n'a pas pensé
did he think<il a pensé
he's thinking<il pense
he is thinking<il pense
is he thinking<il pense
he has thought<il a pensé
has he thought<il a pensé
she thinks<elle pense
she doesn't think<elle ne pense pas
she thinks that<elle pense que
does she think<elle pense
she thought<elle a pensé
she didn't think<elle n'a pas pensé
did she think<elle a pensé
she's thinking<elle pense
she is thinking<elle pense
is she thinking<elle pense
she has thought<elle a pensé
has she thought<elle a pensé
it thinks<il pense
it doesn't think<il ne pense pas
it thinks that<il pense que
does it think<il pense
it thought<il a pensé
it didn't think<il n'a pas pensé
did it think<il a pensé
it's thinking<il pense
it is thinking<il pense
is it thinking<il pense
it has thought<il a pensé
has it thought<il a pensé
je pense>i think
je ne pense pas>i don't think
tu penses>you think
tu ne penses pas>you don't think
il pense>he thinks
il ne pense pas>he doesn't think
elle pense>she thinks
elle ne pense pas>she doesn't think
nous pensons>we think
nous ne pensons pas>we don't think
vous pensez>you think
vous ne pensez pas>you don't think
ils pensent>they think
ils ne pensent pas>they don't think
elles pensent>they think
elles ne pensent pas>they don't think
penses tu>do you think
pensez vous>do you think
est ce que tu penses>do you think
est ce que vous pensez>do you think
j'ai pensé>i thought
tu as pensé>you thought
il a pensé>he thought
elle a pensé>she thought
nous avons pensé>we thought
vous avez pensé>you thought
ils ont pensé>they thought
elles ont pensé>they thought
i see<je vois
i don't see<je ne vois pas
i see that<je vois que
do i see<je vois
i saw<j'ai vu
i didn't see<je n'ai pas vu
did i see<j'ai vu
i'm seeing<je vois
i am seeing<je vois
am i seeing<je vois
i've seen<j'ai vu
i have seen<j'ai vu
have i seen<j'ai vu
you see<tu vois
you don't see<tu ne vois pas
you see that<tu vois que
do you see<tu vois
you saw<tu as vu
you didn't see<tu n'as pas vu
did you see<tu as vu
you're seeing<tu vois
you are seeing<tu vois
are you seeing<tu vois
you've seen<tu as vu
you have seen<tu as vu
have you seen<tu as vu
we see<nous voyons
we don't see<nous ne voyons pas
we see that<nous voyons que
do we see<nous voyons
we saw<nous avons vu
we didn't see<nous n'avons pas vu
did we see<nous avons vu
we're seeing<nous voyons
we are seeing<nous voyons
are we seeing<nous voyons
we've seen<nous avons vu
we have seen<nous avons vu
have we seen<nous avons vu
they see<ils voient
they don't see<ils ne voient pas
they see that<ils voient que
do they see<ils voient
they saw<ils ont vu
they didn't see<ils n'ont pas vu
did they see<ils ont vu
they're seeing<ils voient
they are seeing<ils voient
are they seeing<ils voient
they've seen<ils ont vu
they have seen<ils ont vu
have they seen<ils ont vu
he sees<il voit
he doesn't see<il ne voit pas
he sees that<il voit que
does he see<il voit
he saw<il a vu
he didn't see<il n'a pas vu
did he see<il a vu
he's seeing<il voit
he is seeing<il voit
is he seeing<il voit
he has seen<il a vu
has he seen<il a vu
she sees<elle voit
she doesn't see<elle ne voit pas
she sees that<elle voit que
does she see<elle voit
she saw<elle a vu
she didn't see<elle n'a pas vu
did she see<elle a vu
she's seeing<elle voit
she is seeing<elle voit
is she seeing<elle voit
she has seen<elle a vu
has she seen<elle a vu
it sees<il voit
it doesn't see<il ne voit pas
it sees that<il voit que
does it see<il voit
it saw<il a vu
it didn't see<il n'a pas vu
did it see<il a vu
it's seeing<il voit
it is seeing<il voit
is it seeing<il voit
it has seen<il a vu
has it seen<il a vu
je vois>i see
je ne vois pas>i don't see
tu vois>you see
tu ne vois pas>you don't see
il voit>he sees
il ne voit pas>he doesn't see
elle voit>she sees
elle ne voit pas>she doesn't see
nous voyons>we see
nous ne voyons pas>we don't see
vous voyez>you see
vous ne voyez pas>you don't see
ils voient>they see
ils ne voient pas>they don't see
elles voient>they see
elles ne voient pas>they don't see
vois tu>do you see
voyez vous>do you see
est ce que tu vois>do you see
est ce que vous voyez>do you see
j'ai vu>i saw
tu as vu>you saw
il a vu>he saw
elle a vu>she saw
nous avons vu>we saw
vous avez vu>you saw
ils ont vu>they saw
elles ont vu>they saw
i want<je veux
i don't want<je ne veux pas
i want to<je veux
i don't want to<je ne veux pas
do i want<je veux
i wanted<j'ai voulu
i didn't want<je n'ai pas voulu
did i want<j'ai voulu
i'm wanting<je veux
i am wanting<je veux
am i wanting<je veux
i've wanted<j'ai voulu
i have wanted<j'ai voulu
have i wanted<j'ai voulu
you want<tu veux
you don't want<tu ne veux pas
you want to<tu veux
you don't want to<tu ne veux pas
do you want<tu veux
you wanted<tu as voulu
you didn't want<tu n'as pas voulu
did you want<tu as voulu
you're wanting<tu veux
you are wanting<tu veux
are you wanting<tu veux
you've wanted<tu as voulu
you have wanted<tu as voulu
have you wanted<tu as voulu
we want<nous voulons
we don't want<nous ne voulons pas
we want to<nous voulons
we don't want to<nous ne voulons pas
do we want<nous voulons
we wanted<nous avons voulu
we didn't want<nous n'avons pas voulu
did we want<nous avons voulu
we're wanting<nous voulons
we are wanting<nous voulons
are we wanting<nous voulons
we've wanted<nous avons voulu
we have wanted<nous avons voulu
have we wanted<nous avons voulu
they want<ils veulent
they don't want<ils ne veulent pas
they want to<ils veulent
they don't want to<ils ne veulent pas
do they want<ils veulent
they wanted<ils ont voulu
they didn't want<ils n'ont pas voulu
did they want<ils ont voulu
they're wanting<ils veulent
they are wanting<ils veulent
are they wanting<ils veulent
they've wanted<ils ont voulu
they have wanted<ils ont voulu
have they wanted<ils ont voulu
he wants<il veut
he doesn't want<il ne veut pas
he wants to<il veut
he doesn't want to<il ne veut pas
does he want<il veut
he wanted<il a voulu
he didn't want<il n'a pas voulu
did he want<il a voulu
he's wanting<il veut
he is wanting<il veut
is he wanting<il veut
he has wanted<il a voulu
has he wanted<il a voulu
she wants<elle veut
she doesn't want<elle ne veut pas
she wants to<elle veut
she doesn't want to<elle ne veut pas
does she want<elle veut
she wanted<elle a voulu
she didn't want<elle n'a pas voulu
did she want<elle a voulu
she's wanting<elle veut
she is wanting<elle veut
is she wanting<elle veut
she has wanted<elle a voulu
has she wanted<elle a voulu
it wants<il veut
it doesn't want<il ne veut pas
it wants to<il veut
it doesn't want to<il ne veut pas
does it want<il veut
it wanted<il a voulu
it didn't want<il n'a pas voulu
did it want<il a voulu
it's wanting<il veut
it is wanting<il veut
is it wanting<il veut
it has wanted<il a voulu
has it wanted<il a voulu
je veux>i want
je ne veux pas>i don't want
tu veux>you want
tu ne veux pas>you don't want
il veut>he wants
il ne veut pas>he doesn't want
elle veut>she wants
elle ne veut pas>she doesn't want
nous voulons>we want
nous ne voulons pas>we don't want
vous voulez>you want
vous ne voulez pas>you don't want
ils veulent>they want
ils ne veulent pas>they don't want
elles veulent>they want
elles ne veulent pas>they don't want
veux tu>do you want
voulez vous>do you want
est ce que tu veux>do you want
est ce que vous voulez>do you want
j'ai voulu>i wanted
tu as voulu>you wanted
il a voulu>he wanted
elle a voulu>she wanted
nous avons voulu>we wanted
vous avez voulu>you wanted
ils ont voulu>they wanted
elles ont voulu>they wanted
i need<j'ai besoin de
i don't need<je n'ai pas besoin de
i need to<j'ai besoin de
i don't need to<je n'ai pas besoin de
do i need<j'ai besoin de
i needed<j'ai eu besoin de
i didn't need<je n'ai pas eu besoin de
did i need<j'ai eu besoin de
i'm needing<j'ai besoin de
i am needing<j'ai besoin de
am i needing<j'ai besoin de
i've needed<j'ai eu besoin de
i have needed<j'ai eu besoin de
have i needed<j'ai eu besoin de
you need<tu as besoin de
you don't need<tu n'as pas besoin de
you need to<tu as besoin de
you don't need to<tu n'as pas besoin de
do you need<tu as besoin de
you needed<tu as eu besoin de
you didn't need<tu n'as pas eu besoin de
did you need<tu as eu besoin de
you're needing<tu as besoin de
you are needing<tu as besoin de
are you needing<tu as besoin de
you've needed<tu as eu besoin de
you have needed<tu as eu besoin de
have you needed<tu as eu besoin de
we need<nous avons besoin de
we don't need<nous n'avons pas besoin de
we need to<nous avons besoin de
we don't need to<nous n'avons pas besoin de
do we need<nous avons besoin de
we needed<nous avons eu besoin de
we didn't need<nous n'avons pas eu besoin de
did we need<nous avons eu besoin de
we're needing<nous avons besoin de
we are needing<nous avons besoin de
are we needing<nous avons besoin de
we've needed<nous avons eu besoin de
we have needed<nous avons eu besoin de
have we needed<nous avons eu besoin de
they need<ils ont besoin de
they don't need<ils n'ont pas besoin de
they need to<ils ont besoin de
they don't need to<ils n'ont pas besoin de
do they need<ils ont besoin de
they needed<ils ont eu besoin de
they didn't need<ils n'ont pas eu besoin de
did they need<ils ont eu besoin de
they're needing<ils ont besoin de
they are needing<ils ont besoin de
are they needing<ils ont besoin de
they've needed<ils ont eu besoin de
they have needed<ils ont eu besoin de
have they needed<ils ont eu besoin de
he needs<il a besoin de
he doesn't need<il n'a pas besoin de
he needs to<il a besoin de
he doesn't need to<il n'a pas besoin de
does he need<il a besoin de
he needed<il a eu besoin de
he didn't need<il n'a pas eu besoin de
did he need<il a eu besoin de
he's needing<il a besoin de
he is needing<il a besoin de
is he needing<il a besoin de
he has needed<il a eu besoin de
has he needed<il a eu besoin de
she needs<elle a besoin de
she doesn't need<elle n'a pas besoin de
she needs to<elle a besoin de
she doesn't need to<elle n'a pas besoin de
does she need<elle a besoin de
she needed<elle a eu besoin de
she didn't need<elle n'a pas eu besoin de
did she need<elle a eu besoin de
she's needing<elle a besoin de
she is needing<elle a besoin de
is she needing<elle a besoin de
she has needed<elle a eu besoin de
has she needed<elle a eu besoin de
it needs<il a besoin de
it doesn't need<il n'a pas besoin de
it needs to<il a besoin de
it doesn't need to<il n'a pas besoin de
does it need<il a besoin de
it needed<il a eu besoin de
it didn't need<il n'a pas eu besoin de
did it need<il a eu besoin de
it's needing<il a besoin de
it is needing<il a besoin de
is it needing<il a besoin de
it has needed<il a eu besoin de
has it needed<il a eu besoin de
j'ai besoin de>i need
je n'ai pas besoin de>i don't need
tu as besoin de>you need
tu n'as pas besoin de>you don't need
il a besoin de>he needs
il n'a pas besoin de>he doesn't need
elle a besoin de>she needs
elle n'a pas besoin de>she doesn't need
nous avons besoin de>we need
nous n'avons pas besoin de>we don't need
vous avez besoin de>you need
vous n'avez pas besoin de>you don't need
ils ont besoin de>they need
ils n'ont pas besoin de>they don't need
elles ont besoin de>they need
elles n'ont pas besoin de>they don't need
as besoin de tu>do you need
avez besoin de vous>do you need
est ce que tu as besoin de>do you need
est ce que vous avez besoin de>do you need
j'ai eu besoin de>i needed
tu as eu besoin de>you needed
il a eu besoin de>he needed
elle a eu besoin de>she needed
nous avons eu besoin de>we needed
vous avez eu besoin de>you needed
ils ont eu besoin de>they needed
elles ont eu besoin de>they needed
i like<j'aime
i don't like<je n'aime pas
i like to<j'aime
i don't like to<je n'aime pas
do i like<j'aime
i liked<j'ai aimé
i didn't like<je n'ai pas aimé
did i like<j'ai aimé
i'm liking<j'aime
i am liking<j'aime
am i liking<j'aime
i've liked<j'ai aimé
i have liked<j'ai aimé
have i liked<j'ai aimé
you like<tu aimes
you don't like<tu n'aimes pas
you like to<tu aimes
you don't like to<tu n'aimes pas
do you like<tu aimes
you liked<tu as aimé
you didn't like<tu n'as pas aimé
did you like<tu as aimé
you're liking<tu aimes
you are liking<tu aimes
are you liking<tu aimes
you've liked<tu as aimé
you have liked<tu as aimé
have you liked<tu as aimé
we like<nous aimons
we don't like<nous n'aimons pas
we like to<nous aimons
we don't like to<nous n'aimons pas
do we like<nous aimons
we liked<nous avons aimé
we didn't like<nous n'avons pas aimé
did we like<nous avons aimé
we're liking<nous aimons
we are liking<nous aimons
are we liking<nous aimons
we've liked<nous avons aimé
we have liked<nous avons aimé
have we liked<nous avons aimé
they like<ils aiment
they don't like<ils n'aiment pas
they like to<ils aiment
they don't like to<ils n'aiment pas
do they like<ils aiment
they liked<ils ont aimé
they didn't like<ils n'ont pas aimé
did they like<ils ont aimé
they're liking<ils aiment
they are liking<ils aiment
are they liking<ils aiment
they've liked<ils ont aimé
they have liked<ils ont aimé
have they liked<ils ont aimé
he likes<il aime
he doesn't like<il n'aime pas
he likes to<il aime
he doesn't like to<il n'aime pas
does he like<il aime
he liked<il a aimé
he didn't like<il n'a pas aimé
did he like<il a aimé
he's liking<il aime
he is liking<il aime
is he liking<il aime
he has liked<il a aimé
has he liked<il a aimé
she likes<elle aime
she doesn't like<elle n'aime pas
she likes to<elle aime
she doesn't like to<elle n'aime pas
does she like<elle aime
she liked<elle a aimé
she didn't like<elle n'a pas aimé
did she like<elle a aimé
she's liking<elle aime
she is liking<elle aime
is she liking<elle aime
she has liked<elle a aimé
has she liked<elle a aimé
it likes<il aime
it doesn't like<il n'aime pas
it likes to<il aime
it doesn't like to<il n'aime pas
does it like<il aime
it liked<il a aimé
it didn't like<il n'a pas aimé
did it like<il a aimé
it's liking<il aime
it is liking<il aime
is it liking<il aime
it has liked<il a aimé
has it liked<il a aimé
j'aime>i like
je n'aime pas>i don't like
tu aimes>you like
tu n'aimes pas>you don't like
il aime>he likes
il n'aime pas>he doesn't like
elle aime>she likes
elle n'aime pas>she doesn't like
nous aimons>we like
nous n'aimons pas>we don't like
vous aimez>you like
vous n'aimez pas>you don't like
ils aiment>they like
ils n'aiment pas>they don't like
elles aiment>they like
elles n'aiment pas>they don't like
aimes tu>do you like
aimez vous>do you like
est ce que tu aimes>do you like
est ce que vous aimez>do you like
j'ai aimé>i liked
tu as aimé>you liked
il a aimé>he liked
elle a aimé>she liked
nous avons aimé>we liked
vous avez aimé>you liked
ils ont aimé>they liked
elles ont aimé>they liked
i love<j'adore
i don't love<je n'adore pas
i love to<j'adore
i don't love to<je n'adore pas
do i love<j'adore
i loved<j'ai adoré
i didn't love<je n'ai pas adoré
did i love<j'ai adoré
i'm loving<j'adore
i am loving<j'adore
am i loving<j'adore
i've loved<j'ai adoré
i have loved<j'ai adoré
have i loved<j'ai adoré
you love<tu adores
you don't love<tu n'adores pas
you love to<tu adores
you don't love to<tu n'adores pas
do you love<tu adores
you loved<tu as adoré
you didn't love<tu n'as pas adoré
did you love<tu as adoré
you're loving<tu adores
you are loving<tu adores
are you loving<tu adores
you've loved<tu as adoré
you have loved<tu as adoré
have you loved<tu as adoré
we love<nous adorons
we don't love<nous n'adorons pas
we love to<nous adorons
we don't love to<nous n'adorons pas
do we love<nous adorons
we loved<nous avons adoré
we didn't love<nous n'avons pas adoré
did we love<nous avons adoré
we're loving<nous adorons
we are loving<nous adorons
are we loving<nous adorons
we've loved<nous avons adoré
we have loved<nous avons adoré
have we loved<nous avons adoré
they love<ils adorent
they don't love<ils n'adorent pas
they love to<ils adorent
they don't love to<ils n'adorent pas
do they love<ils adorent
they loved<ils ont adoré
they didn't love<ils n'ont pas adoré
did they love<ils ont adoré
they're loving<ils adorent
they are loving<ils adorent
are they loving<ils adorent
they've loved<ils ont adoré
they have loved<ils ont adoré
have they loved<ils ont adoré
he loves<il adore
he doesn't love<il n'adore pas
he loves to<il adore
he doesn't love to<il n'adore pas
does he love<il adore
he loved<il a adoré
he didn't love<il n'a pas adoré
did he love<il a adoré
he's loving<il adore
he is loving<il adore
is he loving<il adore
he has loved<il a adoré
has he loved<il a adoré
she loves<elle adore
she doesn't love<elle n'adore pas
she loves to<elle adore
she doesn't love to<elle n'adore pas
does she love<elle adore
she loved<elle a adoré
she didn't love<elle n'a pas adoré
did she love<elle a adoré
she's loving<elle adore
she is loving<elle adore
is she loving<elle adore
she has loved<elle a adoré
has she loved<elle a adoré
it loves<il adore
it doesn't love<il n'adore pas
it loves to<il adore
it doesn't love to<il n'adore pas
does it love<il adore
it loved<il a adoré
it didn't love<il n'a pas adoré
did it love<il a adoré
it's loving<il adore
it is loving<il adore
is it loving<il adore
it has loved<il a adoré
has it loved<il a adoré
j'adore>i love
je n'adore pas>i don't love
tu adores>you love
tu n'adores pas>you don't love
il adore>he loves
il n'adore pas>he doesn't love
elle adore>she loves
elle n'adore pas>she doesn't love
nous adorons>we love
nous n'adorons pas>we don't love
vous adorez>you love
vous n'adorez pas>you don't love
ils adorent>they love
ils n'adorent pas>they don't love
elles adorent>they love
elles n'adorent pas>they don't love
adores tu>do you love
adorez vous>do you love
est ce que tu adores>do you love
est ce que vous adorez>do you love
j'ai adoré>i loved
tu as adoré>you loved
il a adoré>he loved
elle a adoré>she loved
nous avons adoré>we loved
vous avez adoré>you loved
ils ont adoré>they loved
elles ont adoré>they loved
i hate<je déteste
i don't hate<je ne déteste pas
i hate to<je déteste
i don't hate to<je ne déteste pas
do i hate<je déteste
i hated<j'ai détesté
i didn't hate<je n'ai pas détesté
did i hate<j'ai détesté
i'm hating<je déteste
i am hating<je déteste
am i hating<je déteste
i've hated<j'ai détesté
i have hated<j'ai détesté
have i hated<j'ai détesté
you hate<tu détestes
you don't hate<tu ne détestes pas
you hate to<tu détestes
you don't hate to<tu ne détestes pas
do you hate<tu détestes
you hated<tu as détesté
you didn't hate<tu n'as pas détesté
did you hate<tu as détesté
you're hating<tu détestes
you are hating<tu détestes
are you hating<tu détestes
you've hated<tu as détesté
you have hated<tu as détesté
have you hated<tu as détesté
we hate<nous détestons
we don't hate<nous ne détestons pas
we hate to<nous détestons
we don't hate to<nous ne détestons pas
do we hate<nous détestons
we hated<nous avons détesté
we didn't hate<nous n'avons pas détesté
did we hate<nous avons détesté
we're hating<nous détestons
we are hating<nous détestons
are we hating<nous détestons
we've hated<nous avons détesté
we have hated<nous avons détesté
have we hated<nous avons détesté
they hate<ils détestent
they don't hate<ils ne détestent pas
they hate to<ils détestent
they don't hate to<ils ne détestent pas
do they hate<ils détestent
they hated<ils ont détesté
they didn't hate<ils n'ont pas détesté
did they hate<ils ont détesté
they're hating<ils détestent
they are hating<ils détestent
are they hating<ils détestent
they've hated<ils ont détesté
they have hated<ils ont détesté
have they hated<ils ont détesté
he hates<il déteste
he doesn't hate<il ne déteste pas
he hates to<il déteste
he doesn't hate to<il ne déteste pas
does he hate<il déteste
he hated<il a détesté
he didn't hate<il n'a pas détesté
did he hate<il a détesté
he's hating<il déteste
he is hating<il déteste
is he hating<il déteste
he has hated<il a détesté
has he hated<il a détesté
she hates<elle déteste
she doesn't hate<elle ne déteste pas
she hates to<elle déteste
she doesn't hate to<elle ne déteste pas
does she hate<elle déteste
she hated<elle a détesté
she didn't hate<elle n'a pas détesté
did she hate<elle a détesté
she's hating<elle déteste
she is hating<elle déteste
is she hating<elle déteste
she has hated<elle a détesté
has she hated<elle a détesté
it hates<il déteste
it doesn't hate<il ne déteste pas
it hates to<il déteste
it doesn't hate to<il ne déteste pas
does it hate<il déteste
it hated<il a détesté
it didn't hate<il n'a pas détesté
did it hate<il a détesté
it's hating<il déteste
it is hating<il déteste
is it hating<il déteste
it has hated<il a détesté
has it hated<il a détesté
je déteste>i hate
je ne déteste pas>i don't hate
tu détestes>you hate
tu ne détestes pas>you don't hate
il déteste>he hates
il ne déteste pas>he doesn't hate
elle déteste>she hates
elle ne déteste pas>she doesn't hate
nous détestons>we hate
nous ne détestons pas>we don't hate
vous détestez>you hate
vous ne détestez pas>you don't hate
ils détestent>they hate
ils ne détestent pas>they don't hate
elles détestent>they hate
elles ne détestent pas>they don't hate
détestes tu>do you hate
détestez vous>do you hate
est ce que tu détestes>do you hate
est ce que vous détestez>do you hate
j'ai détesté>i hated
tu as détesté>you hated
il a détesté>he hated
elle a détesté>she hated
nous avons détesté>we hated
vous avez détesté>you hated
ils ont détesté>they hated
elles ont détesté>they hated
i take<je prends
i don't take<je ne prends pas
do i take<je prends
i took<j'ai pris
i didn't take<je n'ai pas pris
did i take<j'ai pris
i'm taking<je prends
i am taking<je prends
am i taking<je prends
i've taken<j'ai pris
i have taken<j'ai pris
have i taken<j'ai pris
you take<tu prends
you don't take<tu ne prends pas
do you take<tu prends
you took<tu as pris
you didn't take<tu n'as pas pris
did you take<tu as pris
you're taking<tu prends
you are taking<tu prends
are you taking<tu prends
you've taken<tu as pris
you have taken<tu as pris
have you taken<tu as pris
we take<nous prenons
we don't take<nous ne prenons pas
do we take<nous prenons
we took<nous avons pris
we didn't take<nous n'avons pas pris
did we take<nous avons pris
we're taking<nous prenons
we are taking<nous prenons
are we taking<nous prenons
we've taken<nous avons pris
we have taken<nous avons pris
have we taken<nous avons pris
they take<ils prennent
they don't take<ils ne prennent pas
do they take<ils prennent
they took<ils ont pris
they didn't take<ils n'ont pas pris
did they take<ils ont pris
they're taking<ils prennent
they are taking<ils prennent
are they taking<ils prennent
they've taken<ils ont pris
they have taken<ils ont pris
have they taken<ils ont pris
he takes<il prend
he doesn't take<il ne prend pas
does he take<il prend
he took<il a pris
he didn't take<il n'a pas pris
did he take<il a pris
he's taking<il prend
he is taking<il prend
is he taking<il prend
he has taken<il a pris
has he taken<il a pris
she takes<elle prend
she doesn't take<elle ne prend pas
does she take<elle prend
she took<elle a pris
she didn't take<elle n'a pas pris
did she take<elle a pris
she's taking<elle prend
she is taking<elle prend
is she taking<elle prend
she has taken<elle a pris
has she taken<elle a pris
it takes<il prend
it doesn't take<il ne prend pas
does it take<il prend
it took<il a pris
it didn't take<il n'a pas pris
did it take<il a pris
it's taking<il prend
it is taking<il prend
is it taking<il prend
it has taken<il a pris
has it taken<il a pris
je prends>i take
je ne prends pas>i don't take
tu prends>you take
tu ne prends pas>you don't take
il prend>he takes
il ne prend pas>he doesn't take
elle prend>she takes
elle ne prend pas>she doesn't take
nous prenons>we take
nous ne prenons pas>we don't take
vous prenez>you take
vous ne prenez pas>you don't take
ils prennent>they take
ils ne prennent pas>they don't take
elles prennent>they take
elles ne prennent pas>they don't take
prends tu>do you take
prenez vous>do you take
est ce que tu prends>do you take
est ce que vous prenez>do you take
j'ai pris>i took
tu as pris>you took
il a pris>he took
elle a pris>she took
nous avons pris>we took
vous avez pris>you took
ils ont pris>they took
elles ont pris>they took
i give<je donne
i don't give<je ne donne pas
do i give<je donne
i gave<j'ai donné
i didn't give<je n'ai pas donné
did i give<j'ai donné
i'm giving<je donne
i am giving<je donne
am i giving<je donne
i've given<j'ai donné
i have given<j'ai donné
have i given<j'ai donné
you give<tu donnes
you don't give<tu ne donnes pas
do you give<tu donnes
you gave<tu as donné
you didn't give<tu n'as pas donné
did you give<tu as donné
you're giving<tu donnes
you are giving<tu donnes
are you giving<tu donnes
you've given<tu as donné
you have given<tu as donné
have you given<tu as donné
we give<nous donnons
we don't give<nous ne donnons pas
do we give<nous donnons
we gave<nous avons donné
we didn't give<nous n'avons pas donné
did we give<nous avons donné
we're giving<nous donnons
we are giving<nous donnons
are we giving<nous donnons
we've given<nous avons donné
we have given<nous avons donné
have we given<nous avons donné
they give<ils donnent
they don't give<ils ne donnent pas
do they give<ils donnent
they gave<ils ont donné
they didn't give<ils n'ont pas donné
did they give<ils ont donné
they're giving<ils donnent
they are giving<ils donnent
are they giving<ils donnent
they've given<ils ont donné
they have given<ils ont donné
have they given<ils ont donné
he gives<il donne
he doesn't give<il ne donne pas
does he give<il donne
he gave<il a donné
he didn't give<il n'a pas donné
did he give<il a donné
he's giving<il donne
he is giving<il donne
is he giving<il donne
he has given<il a donné
has he given<il a donné
she gives<elle donne
she doesn't give<elle ne donne pas
does she give<elle donne
she gave<elle a donné
she didn't give<elle n'a pas donné
did she give<elle a donné
she's giving<elle donne
she is giving<elle donne
is she giving<elle donne
she has given<elle a donné
has she given<elle a donné
it gives<il donne
it doesn't give<il ne donne pas
does it give<il donne
it gave<il a donné
it didn't give<il n'a pas donné
did it give<il a donné
it's giving<il donne
it is giving<il donne
is it giving<il donne
it has given<il a donné
has it given<il a donné
je donne>i give
je ne donne pas>i don't give
tu donnes>you give
tu ne donnes pas>you don't give
il donne>he gives
il ne donne pas>he doesn't give
elle donne>she gives
elle ne donne pas>she doesn't give
nous donnons>we give
nous ne donnons pas>we don't give
vous donnez>you give
vous ne donnez pas>you don't give
ils donnent>they give
ils ne donnent pas>they don't give
elles donnent>they give
elles ne donnent pas>they don't give
donnes tu>do you give
donnez vous>do you give
est ce que tu donnes>do you give
est ce que vous donnez>do you give
j'ai donné>i gave
tu as donné>you gave
il a donné>he gave
elle a donné>she gave
nous avons donné>we gave
vous avez donné>you gave
ils ont donné>they gave
elles ont donné>they gave
i tell<je dis
i don't tell<je ne dis pas
i tell that<je dis que
do i tell<je dis
i told<j'ai dit
i didn't tell<je n'ai pas dit
did i tell<j'ai dit
i'm telling<je dis
i am telling<je dis
am i telling<je dis
i've told<j'ai dit
i have told<j'ai dit
have i told<j'ai dit
you tell<tu dis
you don't tell<tu ne dis pas
you tell that<tu dis que
do you tell<tu dis
you told<tu as dit
you didn't tell<tu n'as pas dit
did you tell<tu as dit
you're telling<tu dis
you are telling<tu dis
are you telling<tu dis
you've told<tu as dit
you have told<tu as dit
have you told<tu as dit
we tell<nous disons
we don't tell<nous ne disons pas
we tell that<nous disons que
do we tell<nous disons
we told<nous avons dit
we didn't tell<nous n'avons pas dit
did we tell<nous avons dit
we're telling<nous disons
we are telling<nous disons
are we telling<nous disons
we've told<nous avons dit
we have told<nous avons dit
have we told<nous avons dit
they tell<ils disent
they don't tell<ils ne disent pas
they tell that<ils disent que
do they tell<ils disent
they told<ils ont dit
they didn't tell<ils n'ont pas dit
did they tell<ils ont dit
they're telling<ils disent
they are telling<ils disent
are they telling<ils disent
they've told<ils ont dit
they have told<ils ont dit
have they told<ils ont dit
he tells<il dit
he doesn't tell<il ne dit pas
he tells that<il dit que
does he tell<il dit
he told<il a dit
he didn't tell<il n'a pas dit
did he tell<il a dit
he's telling<il dit
he is telling<il dit
is he telling<il dit
he has told<il a dit
has he told<il a dit
she tells<elle dit
she doesn't tell<elle ne dit pas
she tells that<elle dit que
does she tell<elle dit
she told<elle a dit
she didn't tell<elle n'a pas dit
did she tell<elle a dit
she's telling<elle dit
she is telling<elle dit
is she telling<elle dit
she has told<elle a dit
has she told<elle a dit
it tells<il dit
it doesn't tell<il ne dit pas
it tells that<il dit que
does it tell<il dit
it told<il a dit
it didn't tell<il n'a pas dit
did it tell<il a dit
it's telling<il dit
it is telling<il dit
is it telling<il dit
it has told<il a dit
has it told<il a dit
je dis>i tell
je ne dis pas>i don't tell
tu dis>you tell
tu ne dis pas>you don't tell
il dit>he tells
il ne dit pas>he doesn't tell
elle dit>she tells
elle ne dit pas>she doesn't tell
nous disons>we tell
nous ne disons pas>we don't tell
vous dites>you tell
vous ne dites pas>you don't tell
ils disent>they tell
ils ne disent pas>they don't tell
elles disent>they tell
elles ne disent pas>they don't tell
dis tu>do you tell
dites vous>do you tell
est ce que tu dis>do you tell
est ce que vous dites>do you tell
j'ai dit>i told
tu as dit>you told
il a dit>he told
elle a dit>she told
nous avons dit>we told
vous avez dit>you told
ils ont dit>they told
elles ont dit>they told
i say<je dis
i don't say<je ne dis pas
i say that<je dis que
do i say<je dis
i said<j'ai dit
i didn't say<je n'ai pas dit
did i say<j'ai dit
i'm saying<je dis
i am saying<je dis
am i saying<je dis
i've said<j'ai dit
i have said<j'ai dit
have i said<j'ai dit
you say<tu dis
you don't say<tu ne dis pas
you say that<tu dis que
do you say<tu dis
you said<tu as dit
you didn't say<tu n'as pas dit
did you say<tu as dit
you're saying<tu dis
you are saying<tu dis
are you saying<tu dis
you've said<tu as dit
you have said<tu as dit
have you said<tu as dit
we say<nous disons
we don't say<nous ne disons pas
we say that<nous disons que
do we say<nous disons
we said<nous avons dit
we didn't say<nous n'avons pas dit
did we say<nous avons dit
we're saying<nous disons
we are saying<nous disons
are we saying<nous disons
we've said<nous avons dit
we have said<nous avons dit
have we said<nous avons dit
they say<ils disent
they don't say<ils ne disent pas
they say that<ils disent que
do they say<ils disent
they said<ils ont dit
they didn't say<ils n'ont pas dit
did they say<ils ont dit
they're saying<ils disent
they are saying<ils disent
are they saying<ils disent
they've said<ils ont dit
they have said<ils ont dit
have they said<ils ont dit
he says<il dit
he doesn't say<il ne dit pas
he says that<il dit que
does he say<il dit
he said<il a dit
he didn't say<il n'a pas dit
did he say<il a dit
he's saying<il dit
he is saying<il dit
is he saying<il dit
he has said<il a dit
has he said<il a dit
she says<elle dit
she doesn't say<elle ne dit pas
she says that<elle dit que
does she say<elle dit
she said<elle a dit
she didn't say<elle n'a pas dit
did she say<elle a dit
she's saying<elle dit
she is saying<elle dit
is she saying<elle dit
she has said<elle a dit
has she said<elle a dit
it says<il dit
it doesn't say<il ne dit pas
it says that<il dit que
does it say<il dit
it said<il a dit
it didn't say<il n'a pas dit
did it say<il a dit
it's saying<il dit
it is saying<il dit
is it saying<il dit
it has said<il a dit
has it said<il a dit
i ask<je demande
i don't ask<je ne demande pas
do i ask<je demande
i asked<j'ai demandé
i didn't ask<je n'ai pas demandé
did i ask<j'ai demandé
i'm asking<je demande
i am asking<je demande
am i asking<je demande
i've asked<j'ai demandé
i have asked<j'ai demandé
have i asked<j'ai demandé
you ask<tu demandes
you don't ask<tu ne demandes pas
do you ask<tu demandes
you asked<tu as demandé
you didn't ask<tu n'as pas demandé
did you ask<tu as demandé
you're asking<tu demandes
you are asking<tu demandes
are you asking<tu demandes
you've asked<tu as demandé
you have asked<tu as demandé
have you asked<tu as demandé
we ask<nous demandons
we don't ask<nous ne demandons pas
do we ask<nous demandons
we asked<nous avons demandé
we didn't ask<nous n'avons pas demandé
did we ask<nous avons demandé
we're asking<nous demandons
we are asking<nous demandons
are we asking<nous demandons
we've asked<nous avons demandé
we have asked<nous avons demandé
have we asked<nous avons demandé
they ask<ils demandent
they don't ask<ils ne demandent pas
do they ask<ils demandent
they asked<ils ont demandé
they didn't ask<ils n'ont pas demandé
did they ask<ils ont demandé
they're asking<ils demandent
they are asking<ils demandent
are they asking<ils demandent
they've asked<ils ont demandé
they have asked<ils ont demandé
have they asked<ils ont demandé
he asks<il demande
he doesn't ask<il ne demande pas
does he ask<il demande
he asked<il a demandé
he didn't ask<il n'a pas demandé
did he ask<il a demandé
he's asking<il demande
he is asking<il demande
is he asking<il demande
he has asked<il a demandé
has he asked<il a demandé
she asks<elle demande
she doesn't ask<elle ne demande pas
does she ask<elle demande
she asked<elle a demandé
she didn't ask<elle n'a pas demandé
did she ask<elle a demandé
she's asking<elle demande
she is asking<elle demande
is she asking<elle demande
she has asked<elle a demandé
has she asked<elle a demandé
it asks<il demande
it doesn't ask<il ne demande pas
does it ask<il demande
it asked<il a demandé
it didn't ask<il n'a pas demandé
did it ask<il a demandé
it's asking<il demande
it is asking<il demande
is it asking<il demande
it has asked<il a demandé
has it asked<il a demandé
je demande>i ask
je ne demande pas>i don't ask
tu demandes>you ask
tu ne demandes pas>you don't ask
il demande>he asks
il ne demande pas>he doesn't ask
elle demande>she asks
elle ne demande pas>she doesn't ask
nous demandons>we ask
nous ne demandons pas>we don't ask
vous demandez>you ask
vous ne demandez pas>you don't ask
ils demandent>they ask
ils ne demandent pas>they don't ask
elles demandent>they ask
elles ne demandent pas>they don't ask
demandes tu>do you ask
demandez vous>do you ask
est ce que tu demandes>do you ask
est ce que vous demandez>do you ask
j'ai demandé>i asked
tu as demandé>you asked
il a demandé>he asked
elle a demandé>she asked
nous avons demandé>we asked
vous avez demandé>you asked
ils ont demandé>they asked
elles ont demandé>they asked
i find<je trouve
i don't find<je ne trouve pas
do i find<je trouve
i found<j'ai trouvé
i didn't find<je n'ai pas trouvé
did i find<j'ai trouvé
i'm finding<je trouve
i am finding<je trouve
am i finding<je trouve
i've found<j'ai trouvé
i have found<j'ai trouvé
have i found<j'ai trouvé
you find<tu trouves
you don't find<tu ne trouves pas
do you find<tu trouves
you found<tu as trouvé
you didn't find<tu n'as pas trouvé
did you find<tu as trouvé
you're finding<tu trouves
you are finding<tu trouves
are you finding<tu trouves
you've found<tu as trouvé
you have found<tu as trouvé
have you found<tu as trouvé
we find<nous trouvons
we don't find<nous ne trouvons pas
do we find<nous trouvons
we found<nous avons trouvé
we didn't find<nous n'avons pas trouvé
did we find<nous avons trouvé
we're finding<nous trouvons
we are finding<nous trouvons
are we finding<nous trouvons
we've found<nous avons trouvé
we have found<nous avons trouvé
have we found<nous avons trouvé
they find<ils trouvent
they don't find<ils ne trouvent pas
do they find<ils trouvent
they found<ils ont trouvé
they didn't find<ils n'ont pas trouvé
did they find<ils ont trouvé
they're finding<ils trouvent
they are finding<ils trouvent
are they finding<ils trouvent
they've found<ils ont trouvé
they have found<ils ont trouvé
have they found<ils ont trouvé
he finds<il trouve
he doesn't find<il ne trouve pas
does he find<il trouve
he found<il a trouvé
he didn't find<il n'a pas trouvé
did he find<il a trouvé
he's finding<il trouve
he is finding<il trouve
is he finding<il trouve
he has found<il a trouvé
has he found<il a trouvé
she finds<elle trouve
she doesn't find<elle ne trouve pas
does she find<elle trouve
she found<elle a trouvé
she didn't find<elle n'a pas trouvé
did she find<elle a trouvé
she's finding<elle trouve
she is finding<elle trouve
is she finding<elle trouve
she has found<elle a trouvé
has she found<elle a trouvé
it finds<il trouve
it doesn't find<il ne trouve pas
does it find<il trouve
it found<il a trouvé
it didn't find<il n'a pas trouvé
did it find<il a trouvé
it's finding<il trouve
it is finding<il trouve
is it finding<il trouve
it has found<il a trouvé
has it found<il a trouvé
je trouve>i find
je ne trouve pas>i don't find
tu trouves>you find
tu ne trouves pas>you don't find
il trouve>he finds
il ne trouve pas>he doesn't find
elle trouve>she finds
elle ne trouve pas>she doesn't find
nous trouvons>we find
nous ne trouvons pas>we don't find
vous trouvez>you find
vous ne trouvez pas>you don't find
ils trouvent>they find
ils ne trouvent pas>they don't find
elles trouvent>they find
elles ne trouvent pas>they don't find
trouves tu>do you find
trouvez vous>do you find
est ce que tu trouves>do you find
est ce que vous trouvez>do you find
j'ai trouvé>i found
tu as trouvé>you found
il a trouvé>he found
elle a trouvé>she found
nous avons trouvé>we found
vous avez trouvé>you found
ils ont trouvé>they found
elles ont trouvé>they found
i look<je regarde
i don't look<je ne regarde pas
do i look<je regarde
i looked<j'ai regardé
i didn't look<je n'ai pas regardé
did i look<j'ai regardé
i'm looking<je regarde
i am looking<je regarde
am i looking<je regarde
i've looked<j'ai regardé
i have looked<j'ai regardé
have i looked<j'ai regardé
you look<tu regardes
you don't look<tu ne regardes pas
do you look<tu regardes
you looked<tu as regardé
you didn't look<tu n'as pas regardé
did you look<tu as regardé
you're looking<tu regardes
you are looking<tu regardes
are you looking<tu regardes
you've looked<tu as regardé
you have looked<tu as regardé
have you looked<tu as regardé
we look<nous regardons
we don't look<nous ne regardons pas
do we look<nous regardons
we looked<nous avons regardé
we didn't look<nous n'avons pas regardé
did we look<nous avons regardé
we're looking<nous regardons
we are looking<nous regardons
are we looking<nous regardons
we've looked<nous avons regardé
we have looked<nous avons regardé
have we looked<nous avons regardé
they look<ils regardent
they don't look<ils ne regardent pas
do they look<ils regardent
they looked<ils ont regardé
they didn't look<ils n'ont pas regardé
did they look<ils ont regardé
they're looking<ils regardent
they are looking<ils regardent
are they looking<ils regardent
they've looked<ils ont regardé
they have looked<ils ont regardé
have they looked<ils ont regardé
he looks<il regarde
he doesn't look<il ne regarde pas
does he look<il regarde
he looked<il a regardé
he didn't look<il n'a pas regardé
did he look<il a regardé
he's looking<il regarde
he is looking<il regarde
is he looking<il regarde
he has looked<il a regardé
has he looked<il a regardé
she looks<elle regarde
she doesn't look<elle ne regarde pas
does she look<elle regarde
she looked<elle a regardé
she didn't look<elle n'a pas regardé
did she look<elle a regardé
she's looking<elle regarde
she is looking<elle regarde
is she looking<elle regarde
she has looked<elle a regardé
has she looked<elle a regardé
it looks<il regarde
it doesn't look<il ne regarde pas
does it look<il regarde
it looked<il a regardé
it didn't look<il n'a pas regardé
did it look<il a regardé
it's looking<il regarde
it is looking<il regarde
is it looking<il regarde
it has looked<il a regardé
has it looked<il a regardé
je regarde>i look
je ne regarde pas>i don't look
tu regardes>you look
tu ne regardes pas>you don't look
il regarde>he looks
il ne regarde pas>he doesn't look
elle regarde>she looks
elle ne regarde pas>she doesn't look
nous regardons>we look
nous ne regardons pas>we don't look
vous regardez>you look
vous ne regardez pas>you don't look
ils regardent>they look
ils ne regardent pas>they don't look
elles regardent>they look
elles ne regardent pas>they don't look
regardes tu>do you look
regardez vous>do you look
est ce que tu regardes>do you look
est ce que vous regardez>do you look
j'ai regardé>i looked
tu as regardé>you looked
il a regardé>he looked
elle a regardé>she looked
nous avons regardé>we looked
vous avez regardé>you looked
ils ont regardé>they looked
elles ont regardé>they looked
i watch<je regarde
i don't watch<je ne regarde pas
do i watch<je regarde
i watched<j'ai regardé
i didn't watch<je n'ai pas regardé
did i watch<j'ai regardé
i'm watching<je regarde
i am watching<je regarde
am i watching<je regarde
i've watched<j'ai regardé
i have watched<j'ai regardé
have i watched<j'ai regardé
you watch<tu regardes
you don't watch<tu ne regardes pas
do you watch<tu regardes
you watched<tu as regardé
you didn't watch<tu n'as pas regardé
did you watch<tu as regardé
you're watching<tu regardes
you are watching<tu regardes
are you watching<tu regardes
you've watched<tu as regardé
you have watched<tu as regardé
have you watched<tu as regardé
we watch<nous regardons
we don't watch<nous ne regardons pas
do we watch<nous regardons
we watched<nous avons regardé
we didn't watch<nous n'avons pas regardé
did we watch<nous avons regardé
we're watching<nous regardons
we are watching<nous regardons
are we watching<nous regardons
we've watched<nous avons regardé
we have watched<nous avons regardé
have we watched<nous avons regardé
they watch<ils regardent
they don't watch<ils ne regardent pas
do they watch<ils regardent
they watched<ils ont regardé
they didn't watch<ils n'ont pas regardé
did they watch<ils ont regardé
they're watching<ils regardent
they are watching<ils regardent
are they watching<ils regardent
they've watched<ils ont regardé
they have watched<ils ont regardé
have they watched<ils ont regardé
he watches<il regarde
he doesn't watch<il ne regarde pas
does he watch<il regarde
he watched<il a regardé
he didn't watch<il n'a pas regardé
did he watch<il a regardé
he's watching<il regarde
he is watching<il regarde
is he watching<il regarde
he has watched<il a regardé
has he watched<il a regardé
she watches<elle regarde
she doesn't watch<elle ne regarde pas
does she watch<elle regarde
she watched<elle a regardé
she didn't watch<elle n'a pas regardé
did she watch<elle a regardé
she's watching<elle regarde
she is watching<elle regarde
is she watching<elle regarde
she has watched<elle a regardé
has she watched<elle a regardé
it watches<il regarde
it doesn't watch<il ne regarde pas
does it watch<il regarde
it watched<il a regardé
it didn't watch<il n'a pas regardé
did it watch<il a regardé
it's watching<il regarde
it is watching<il regarde
is it watching<il regarde
it has watched<il a regardé
has it watched<il a regardé
i use<j'utilise
i don't use<je n'utilise pas
do i use<j'utilise
i used<j'ai utilisé
i didn't use<je n'ai pas utilisé
did i use<j'ai utilisé
i'm using<j'utilise
i am using<j'utilise
am i using<j'utilise
i've used<j'ai utilisé
i have used<j'ai utilisé
have i used<j'ai utilisé
you use<tu utilises
you don't use<tu n'utilises pas
do you use<tu utilises
you used<tu as utilisé
you didn't use<tu n'as pas utilisé
did you use<tu as utilisé
you're using<tu utilises
you are using<tu utilises
are you using<tu utilises
you've used<tu as utilisé
you have used<tu as utilisé
have you used<tu as utilisé
we use<nous utilisons
we don't use<nous n'utilisons pas
do we use<nous utilisons
we used<nous avons utilisé
we didn't use<nous n'avons pas utilisé
did we use<nous avons utilisé
we're using<nous utilisons
we are using<nous utilisons
are we using<nous utilisons
we've used<nous avons utilisé
we have used<nous avons utilisé
have we used<nous avons utilisé
they use<ils utilisent
they don't use<ils n'utilisent pas
do they use<ils utilisent
they used<ils ont utilisé
they didn't use<ils n'ont pas utilisé
did they use<ils ont utilisé
they're using<ils utilisent
they are using<ils utilisent
are they using<ils utilisent
they've used<ils ont utilisé
they have used<ils ont utilisé
have they used<ils ont utilisé
he uses<il utilise
he doesn't use<il n'utilise pas
does he use<il utilise
he used<il a utilisé
he didn't use<il n'a pas utilisé
did he use<il a utilisé
he's using<il utilise
he is using<il utilise
is he using<il utilise
he has used<il a utilisé
has he used<il a utilisé
she uses<elle utilise
she doesn't use<elle n'utilise pas
does she use<elle utilise
she used<elle a utilisé
she didn't use<elle n'a pas utilisé
did she use<elle a utilisé
she's using<elle utilise
she is using<elle utilise
is she using<elle utilise
she has used<elle a utilisé
has she used<elle a utilisé
it uses<il utilise
it doesn't use<il n'utilise pas
does it use<il utilise
it used<il a utilisé
it didn't use<il n'a pas utilisé
did it use<il a utilisé
it's using<il utilise
it is using<il utilise
is it using<il utilise
it has used<il a utilisé
has it used<il a utilisé
j'utilise>i use
je n'utilise pas>i don't use
tu utilises>you use
tu n'utilises pas>you don't use
il utilise>he uses
il n'utilise pas>he doesn't use
elle utilise>she uses
elle n'utilise pas>she doesn't use
nous utilisons>we use
nous n'utilisons pas>we don't use
vous utilisez>you use
vous n'utilisez pas>you don't use
ils utilisent>they use
ils n'utilisent pas>they don't use
elles utilisent>they use
elles n'utilisent pas>they don't use
utilises tu>do you use
utilisez vous>do you use
est ce que tu utilises>do you use
est ce que vous utilisez>do you use
j'ai utilisé>i used
tu as utilisé>you used
il a utilisé>he used
elle a utilisé>she used
nous avons utilisé>we used
vous avez utilisé>you used
ils ont utilisé>they used
elles ont utilisé>they used
i try<j'essaie
i don't try<je n'essaie pas
i try to<j'essaie de
i don't try to<je n'essaie pas de
do i try<j'essaie
i tried<j'ai essayé
i didn't try<je n'ai pas essayé
did i try<j'ai essayé
i'm trying<j'essaie
i am trying<j'essaie
am i trying<j'essaie
i've tried<j'ai essayé
i have tried<j'ai essayé
have i tried<j'ai essayé
you try<tu essaies
you don't try<tu n'essaies pas
you try to<tu essaies de
you don't try to<tu n'essaies pas de
do you try<tu essaies
you tried<tu as essayé
you didn't try<tu n'as pas essayé
did you try<tu as essayé
you're trying<tu essaies
you are trying<tu essaies
are you trying<tu essaies
you've tried<tu as essayé
you have tried<tu as essayé
have you tried<tu as essayé
we try<nous essayons
we don't try<nous n'essayons pas
we try to<nous essayons de
we don't try to<nous n'essayons pas de
do we try<nous essayons
we tried<nous avons essayé
we didn't try<nous n'avons pas essayé
did we try<nous avons essayé
we're trying<nous essayons
we are trying<nous essayons
are we trying<nous essayons
we've tried<nous avons essayé
we have tried<nous avons essayé
have we tried<nous avons essayé
they try<ils essaient
they don't try<ils n'essaient pas
they try to<ils essaient de
they don't try to<ils n'essaient pas de
do they try<ils essaient
they tried<ils ont essayé
they didn't try<ils n'ont pas essayé
did they try<ils ont essayé
they're trying<ils essaient
they are trying<ils essaient
are they trying<ils essaient
they've tried<ils ont essayé
they have tried<ils ont essayé
have they tried<ils ont essayé
he tries<il essaie
he doesn't try<il n'essaie pas
he tries to<il essaie de
he doesn't try to<il n'essaie pas de
does he try<il essaie
he tried<il a essayé
he didn't try<il n'a pas essayé
did he try<il a essayé
he's trying<il essaie
he is trying<il essaie
is he trying<il essaie
he has tried<il a essayé
has he tried<il a essayé
she tries<elle essaie
she doesn't try<elle n'essaie pas
she tries to<elle essaie de
she doesn't try to<elle n'essaie pas de
does she try<elle essaie
she tried<elle a essayé
she didn't try<elle n'a pas essayé
did she try<elle a essayé
she's trying<elle essaie
she is trying<elle essaie
is she trying<elle essaie
she has tried<elle a essayé
has she tried<elle a essayé
it tries<il essaie
it doesn't try<il n'essaie pas
it tries to<il essaie de
it doesn't try to<il n'essaie pas de
does it try<il essaie
it tried<il a essayé
it didn't try<il n'a pas essayé
did it try<il a essayé
it's trying<il essaie
it is trying<il essaie
is it trying<il essaie
it has tried<il a essayé
has it tried<il a essayé
j'essaie>i try
je n'essaie pas>i don't try
tu essaies>you try
tu n'essaies pas>you don't try
il essaie>he tries
il n'essaie pas>he doesn't try
elle essaie>she tries
elle n'essaie pas>she doesn't try
nous essayons>we try
nous n'essayons pas>we don't try
vous essayez>you try
vous n'essayez pas>you don't try
ils essaient>they try
ils n'essaient pas>they don't try
elles essaient>they try
elles n'essaient pas>they don't try
essaies tu>do you try
essayez vous>do you try
est ce que tu essaies>do you try
est ce que vous essayez>do you try
j'ai essayé>i tried
tu as essayé>you tried
il a essayé>he tried
elle a essayé>she tried
nous avons essayé>we tried
vous avez essayé>you tried
ils ont essayé>they tried
elles ont essayé>they tried
i play<je joue
i don't play<je ne joue pas
do i play<je joue
i played<j'ai joué
i didn't play<je n'ai pas joué
did i play<j'ai joué
i'm playing<je joue
i am playing<je joue
am i playing<je joue
i've played<j'ai joué
i have played<j'ai joué
have i played<j'ai joué
you play<tu joues
you don't play<tu ne joues pas
do you play<tu joues
you played<tu as joué
you didn't play<tu n'as pas joué
did you play<tu as joué
you're playing<tu joues
you are playing<tu joues
are you playing<tu joues
you've played<tu as joué
you have played<tu as joué
have you played<tu as joué
we play<nous jouons
we don't play<nous ne jouons pas
do we play<nous jouons
we played<nous avons joué
we didn't play<nous n'avons pas joué
did we play<nous avons joué
we're playing<nous jouons
we are playing<nous jouons
are we playing<nous jouons
we've played<nous avons joué
we have played<nous avons joué
have we played<nous avons joué
they play<ils jouent
they don't play<ils ne jouent pas
do they play<ils jouent
they played<ils ont joué
they didn't play<ils n'ont pas joué
did they play<ils ont joué
they're playing<ils jouent
they are playing<ils jouent
are they playing<ils jouent
they've played<ils ont joué
they have played<ils ont joué
have they played<ils ont joué
he plays<il joue
he doesn't play<il ne joue pas
does he play<il joue
he played<il a joué
he didn't play<il n'a pas joué
did he play<il a joué
he's playing<il joue
he is playing<il joue
is he playing<il joue
he has played<il a joué
has he played<il a joué
she plays<elle joue
she doesn't play<elle ne joue pas
does she play<elle joue
she played<elle a joué
she didn't play<elle n'a pas joué
did she play<elle a joué
she's playing<elle joue
she is playing<elle joue
is she playing<elle joue
she has played<elle a joué
has she played<elle a joué
it plays<il joue
it doesn't play<il ne joue pas
does it play<il joue
it played<il a joué
it didn't play<il n'a pas joué
did it play<il a joué
it's playing<il joue
it is playing<il joue
is it playing<il joue
it has played<il a joué
has it played<il a joué
je joue>i play
je ne joue pas>i don't play
tu joues>you play
tu ne joues pas>you don't play
il joue>he plays
il ne joue pas>he doesn't play
elle joue>she plays
elle ne joue pas>she doesn't play
nous jouons>we play
nous ne jouons pas>we don't play
vous jouez>you play
vous ne jouez pas>you don't play
ils jouent>they play
ils ne jouent pas>they don't play
elles jouent>they play
elles ne jouent pas>they don't play
joues tu>do you play
jouez vous>do you play
est ce que tu joues>do you play
est ce que vous jouez>do you play
j'ai joué>i played
tu as joué>you played
il a joué>he played
elle a joué>she played
nous avons joué>we played
vous avez joué>you played
ils ont joué>they played
elles ont joué>they played
i help<j'aide
i don't help<je n'aide pas
do i help<j'aide
i helped<j'ai aidé
i didn't help<je n'ai pas aidé
did i help<j'ai aidé
i'm helping<j'aide
i am helping<j'aide
am i helping<j'aide
i've helped<j'ai aidé
i have helped<j'ai aidé
have i helped<j'ai aidé
you help<tu aides
you don't help<tu n'aides pas
do you help<tu aides
you helped<tu as aidé
you didn't help<tu n'as pas aidé
did you help<tu as aidé
you're helping<tu aides
you are helping<tu aides
are you helping<tu aides
you've helped<tu as aidé
you have helped<tu as aidé
have you helped<tu as aidé
we help<nous aidons
we don't help<nous n'aidons pas
do we help<nous aidons
we helped<nous avons aidé
we didn't help<nous n'avons pas aidé
did we help<nous avons aidé
we're helping<nous aidons
we are helping<nous aidons
are we helping<nous aidons
we've helped<nous avons aidé
we have helped<nous avons aidé
have we helped<nous avons aidé
they help<ils aident
they don't help<ils n'aident pas
do they help<ils aident
they helped<ils ont aidé
they didn't help<ils n'ont pas aidé
did they help<ils ont aidé
they're helping<ils aident
they are helping<ils aident
are they helping<ils aident
they've helped<ils ont aidé
they have helped<ils ont aidé
have they helped<ils ont aidé
he helps<il aide
he doesn't help<il n'aide pas
does he help<il aide
he helped<il a aidé
he didn't help<il n'a pas aidé
did he help<il a aidé
he's helping<il aide
he is helping<il aide
is he helping<il aide
he has helped<il a aidé
has he helped<il a aidé
she helps<elle aide
she doesn't help<elle n'aide pas
does she help<elle aide
she helped<elle a aidé
she didn't help<elle n'a pas aidé
did she help<elle a aidé
she's helping<elle aide
she is helping<elle aide
is she helping<elle aide
she has helped<elle a aidé
has she helped<elle a aidé
it helps<il aide
it doesn't help<il n'aide pas
does it help<il aide
it helped<il a aidé
it didn't help<il n'a pas aidé
did it help<il a aidé
it's helping<il aide
it is helping<il aide
is it helping<il aide
it has helped<il a aidé
has it helped<il a aidé
j'aide>i help
je n'aide pas>i don't help
tu aides>you help
tu n'aides pas>you don't help
il aide>he helps
il n'aide pas>he doesn't help
elle aide>she helps
elle n'aide pas>she doesn't help
nous aidons>we help
nous n'aidons pas>we don't help
vous aidez>you help
vous n'aidez pas>you don't help
ils aident>they help
ils n'aident pas>they don't help
elles aident>they help
elles n'aident pas>they don't help
aides tu>do you help
aidez vous>do you help
est ce que tu aides>do you help
est ce que vous aidez>do you help
j'ai aidé>i helped
tu as aidé>you helped
il a aidé>he helped
elle a aidé>she helped
nous avons aidé>we helped
vous avez aidé>you helped
ils ont aidé>they helped
elles ont aidé>they helped
i wait<j'attends
i don't wait<je n'attends pas
do i wait<j'attends
i waited<j'ai attendu
i didn't wait<je n'ai pas attendu
did i wait<j'ai attendu
i'm waiting<j'attends
i am waiting<j'attends
am i waiting<j'attends
i've waited<j'ai attendu
i have waited<j'ai attendu
have i waited<j'ai attendu
you wait<tu attends
you don't wait<tu n'attends pas
do you wait<tu attends
you waited<tu as attendu
you didn't wait<tu n'as pas attendu
did you wait<tu as attendu
you're waiting<tu attends
you are waiting<tu attends
are you waiting<tu attends
you've waited<tu as attendu
you have waited<tu as attendu
have you waited<tu as attendu
we wait<nous attendons
we don't wait<nous n'attendons pas
do we wait<nous attendons
we waited<nous avons attendu
we didn't wait<nous n'avons pas attendu
did we wait<nous avons attendu
we're waiting<nous attendons
we are waiting<nous attendons
are we waiting<nous attendons
we've waited<nous avons attendu
we have waited<nous avons attendu
have we waited<nous avons attendu
they wait<ils attendent
they don't wait<ils n'attendent pas
do they wait<ils attendent
they waited<ils ont attendu
they didn't wait<ils n'ont pas attendu
did they wait<ils ont attendu
they're waiting<ils attendent
they are waiting<ils attendent
are they waiting<ils attendent
they've waited<ils ont attendu
they have waited<ils ont attendu
have they waited<ils ont attendu
he waits<il attend
he doesn't wait<il n'attend pas
does he wait<il attend
he waited<il a attendu
he didn't wait<il n'a pas attendu
did he wait<il a attendu
he's waiting<il attend
he is waiting<il attend
is he waiting<il attend
he has waited<il a attendu
has he waited<il a attendu
she waits<elle attend
she doesn't wait<elle n'attend pas
does she wait<elle attend
she waited<elle a attendu
she didn't wait<elle n'a pas attendu
did she wait<elle a attendu
she's waiting<elle attend
she is waiting<elle attend
is she waiting<elle attend
she has waited<elle a attendu
has she waited<elle a attendu
it waits<il attend
it doesn't wait<il n'attend pas
does it wait<il attend
it waited<il a attendu
it didn't wait<il n'a pas attendu
did it wait<il a attendu
it's waiting<il attend
it is waiting<il attend
is it waiting<il attend
it has waited<il a attendu
has it waited<il a attendu
j'attends>i wait
je n'attends pas>i don't wait
tu attends>you wait
tu n'attends pas>you don't wait
il attend>he waits
il n'attend pas>he doesn't wait
elle attend>she waits
elle n'attend pas>she doesn't wait
nous attendons>we wait
nous n'attendons pas>we don't wait
vous attendez>you wait
vous n'attendez pas>you don't wait
ils attendent>they wait
ils n'attendent pas>they don't wait
elles attendent>they wait
elles n'attendent pas>they don't wait
attends tu>do you wait
attendez vous>do you wait
est ce que tu attends>do you wait
est ce que vous attendez>do you wait
j'ai attendu>i waited
tu as attendu>you waited
il a attendu>he waited
elle a attendu>she waited
nous avons attendu>we waited
vous avez attendu>you waited
ils ont attendu>they waited
elles ont attendu>they waited
i work<je travaille
i don't work<je ne travaille pas
do i work<je travaille
i worked<j'ai travaillé
i didn't work<je n'ai pas travaillé
did i work<j'ai travaillé
i'm working<je travaille
i am working<je travaille
am i working<je travaille
i've worked<j'ai travaillé
i have worked<j'ai travaillé
have i worked<j'ai travaillé
you work<tu travailles
you don't work<tu ne travailles pas
do you work<tu travailles
you worked<tu as travaillé
you didn't work<tu n'as pas travaillé
did you work<tu as travaillé
you're working<tu travailles
you are working<tu travailles
are you working<tu travailles
you've worked<tu as travaillé
you have worked<tu as travaillé
have you worked<tu as travaillé
we work<nous travaillons
we don't work<nous ne travaillons pas
do we work<nous travaillons
we worked<nous avons travaillé
we didn't work<nous n'avons pas travaillé
did we work<nous avons travaillé
we're working<nous travaillons
we are working<nous travaillons
are we working<nous travaillons
we've worked<nous avons travaillé
we have worked<nous avons travaillé
have we worked<nous avons travaillé
they work<ils travaillent
they don't work<ils ne travaillent pas
do they work<ils travaillent
they worked<ils ont travaillé
they didn't work<ils n'ont pas travaillé
did they work<ils ont travaillé
they're working<ils travaillent
they are working<ils travaillent
are they working<ils travaillent
they've worked<ils ont travaillé
they have worked<ils ont travaillé
have they worked<ils ont travaillé
he works<il travaille
he doesn't work<il ne travaille pas
does he work<il travaille
he worked<il a travaillé
he didn't work<il n'a pas travaillé
did he work<il a travaillé
he's working<il travaille
he is working<il travaille
is he working<il travaille
he has worked<il a travaillé
has he worked<il a travaillé
she works<elle travaille
she doesn't work<elle ne travaille pas
does she work<elle travaille
she worked<elle a travaillé
she didn't work<elle n'a pas travaillé
did she work<elle a travaillé
she's working<elle travaille
she is working<elle travaille
is she working<elle travaille
she has worked<elle a travaillé
has she worked<elle a travaillé
it works<il travaille
it doesn't work<il ne travaille pas
does it work<il travaille
it worked<il a travaillé
it didn't work<il n'a pas travaillé
did it work<il a travaillé
it's working<il travaille
it is working<il travaille
is it working<il travaille
it has worked<il a travaillé
has it worked<il a travaillé
je travaille>i work
je ne travaille pas>i don't work
tu travailles>you work
tu ne travailles pas>you don't work
il travaille>he works
il ne travaille pas>he doesn't work
elle travaille>she works
elle ne travaille pas>she doesn't work
nous travaillons>we work
nous ne travaillons pas>we don't work
vous travaillez>you work
vous ne travaillez pas>you don't work
ils travaillent>they work
ils ne travaillent pas>they don't work
elles travaillent>they work
elles ne travaillent pas>they don't work
travailles tu>do you work
travaillez vous>do you work
est ce que tu travailles>do you work
est ce que vous travaillez>do you work
j'ai travaillé>i worked
tu as travaillé>you worked
il a travaillé>he worked
elle a travaillé>she worked
nous avons travaillé>we worked
vous avez travaillé>you worked
ils ont travaillé>they worked
elles ont travaillé>they worked
i buy<j'achète
i don't buy<je n'achète pas
do i buy<j'achète
i bought<j'ai acheté
i didn't buy<je n'ai pas acheté
did i buy<j'ai acheté
i'm buying<j'achète
i am buying<j'achète
am i buying<j'achète
i've bought<j'ai acheté
i have bought<j'ai acheté
have i bought<j'ai acheté
you buy<tu achètes
you don't buy<tu n'achètes pas
do you buy<tu achètes
you bought<tu as acheté
you didn't buy<tu n'as pas acheté
did you buy<tu as acheté
you're buying<tu achètes
you are buying<tu achètes
are you buying<tu achètes
you've bought<tu as acheté
you have bought<tu as acheté
have you bought<tu as acheté
we buy<nous achetons
we don't buy<nous n'achetons pas
do we buy<nous achetons
we bought<nous avons acheté
we didn't buy<nous n'avons pas acheté
did we buy<nous avons acheté
we're buying<nous achetons
we are buying<nous achetons
are we buying<nous achetons
we've bought<nous avons acheté
we have bought<nous avons acheté
have we bought<nous avons acheté
they buy<ils achètent
they don't buy<ils n'achètent pas
do they buy<ils achètent
they bought<ils ont acheté
they didn't buy<ils n'ont pas acheté
did they buy<ils ont acheté
they're buying<ils achètent
they are buying<ils achètent
are they buying<ils achètent
they've bought<ils ont acheté
they have bought<ils ont acheté
have they bought<ils ont acheté
he buys<il achète
he doesn't buy<il n'achète pas
does he buy<il achète
he bought<il a acheté
he didn't buy<il n'a pas acheté
did he buy<il a acheté
he's buying<il achète
he is buying<il achète
is he buying<il achète
he has bought<il a acheté
has he bought<il a acheté
she buys<elle achète
she doesn't buy<elle n'achète pas
does she buy<elle achète
she bought<elle a acheté
she didn't buy<elle n'a pas acheté
did she buy<elle a acheté
she's buying<elle achète
she is buying<elle achète
is she buying<elle achète
she has bought<elle a acheté
has she bought<elle a acheté
it buys<il achète
it doesn't buy<il n'achète pas
does it buy<il achète
it bought<il a acheté
it didn't buy<il n'a pas acheté
did it buy<il a acheté
it's buying<il achète
it is buying<il achète
is it buying<il achète
it has bought<il a acheté
has it bought<il a acheté
j'achète>i buy
je n'achète pas>i don't buy
tu achètes>you buy
tu n'achètes pas>you don't buy
il achète>he buys
il n'achète pas>he doesn't buy
elle achète>she buys
elle n'achète pas>she doesn't buy
nous achetons>we buy
nous n'achetons pas>we don't buy
vous achetez>you buy
vous n'achetez pas>you don't buy
ils achètent>they buy
ils n'achètent pas>they don't buy
elles achètent>they buy
elles n'achètent pas>they don't buy
achètes tu>do you buy
achetez vous>do you buy
est ce que tu achètes>do you buy
est ce que vous achetez>do you buy
j'ai acheté>i bought
tu as acheté>you bought
il a acheté>he bought
elle a acheté>she bought
nous avons acheté>we bought
vous avez acheté>you bought
ils ont acheté>they bought
elles ont acheté>they bought
i sell<je vends
i don't sell<je ne vends pas
do i sell<je vends
i sold<j'ai vendu
i didn't sell<je n'ai pas vendu
did i sell<j'ai vendu
i'm selling<je vends
i am selling<je vends
am i selling<je vends
i've sold<j'ai vendu
i have sold<j'ai vendu
have i sold<j'ai vendu
you sell<tu vends
you don't sell<tu ne vends pas
do you sell<tu vends
you sold<tu as vendu
you didn't sell<tu n'as pas vendu
did you sell<tu as vendu
you're selling<tu vends
you are selling<tu vends
are you selling<tu vends
you've sold<tu as vendu
you have sold<tu as vendu
have you sold<tu as vendu
we sell<nous vendons
we don't sell<nous ne vendons pas
do we sell<nous vendons
we sold<nous avons vendu
we didn't sell<nous n'avons pas vendu
did we sell<nous avons vendu
we're selling<nous vendons
we are selling<nous vendons
are we selling<nous vendons
we've sold<nous avons vendu
we have sold<nous avons vendu
have we sold<nous avons vendu
they sell<ils vendent
they don't sell<ils ne vendent pas
do they sell<ils vendent
they sold<ils ont vendu
they didn't sell<ils n'ont pas vendu
did they sell<ils ont vendu
they're selling<ils vendent
they are selling<ils vendent
are they selling<ils vendent
they've sold<ils ont vendu
they have sold<ils ont vendu
have they sold<ils ont vendu
he sells<il vend
he doesn't sell<il ne vend pas
does he sell<il vend
he sold<il a vendu
he didn't sell<il n'a pas vendu
did he sell<il a vendu
he's selling<il vend
he is selling<il vend
is he selling<il vend
he has sold<il a vendu
has he sold<il a vendu
she sells<elle vend
she doesn't sell<elle ne vend pas
does she sell<elle vend
she sold<elle a vendu
she didn't sell<elle n'a pas vendu
did she sell<elle a vendu
she's selling<elle vend
she is selling<elle vend
is she selling<elle vend
she has sold<elle a vendu
has she sold<elle a vendu
it sells<il vend
it doesn't sell<il ne vend pas
does it sell<il vend
it sold<il a vendu
it didn't sell<il n'a pas vendu
did it sell<il a vendu
it's selling<il vend
it is selling<il vend
is it selling<il vend
it has sold<il a vendu
has it sold<il a vendu
je vends>i sell
je ne vends pas>i don't sell
tu vends>you sell
tu ne vends pas>you don't sell
il vend>he sells
il ne vend pas>he doesn't sell
elle vend>she sells
elle ne vend pas>she doesn't sell
nous vendons>we sell
nous ne vendons pas>we don't sell
vous vendez>you sell
vous ne vendez pas>you don't sell
ils vendent>they sell
ils ne vendent pas>they don't sell
elles vendent>they sell
elles ne vendent pas>they don't sell
vends tu>do you sell
vendez vous>do you sell
est ce que tu vends>do you sell
est ce que vous vendez>do you sell
j'ai vendu>i sold
tu as vendu>you sold
il a vendu>he sold
elle a vendu>she sold
nous avons vendu>we sold
vous avez vendu>you sold
ils ont vendu>they sold
elles ont vendu>they sold
i join<je rejoins
i don't join<je ne rejoins pas
do i join<je rejoins
i joined<j'ai rejoint
i didn't join<je n'ai pas rejoint
did i join<j'ai rejoint
i'm joining<je rejoins
i am joining<je rejoins
am i joining<je rejoins
i've joined<j'ai rejoint
i have joined<j'ai rejoint
have i joined<j'ai rejoint
you join<tu rejoins
you don't join<tu ne rejoins pas
do you join<tu rejoins
you joined<tu as rejoint
you didn't join<tu n'as pas rejoint
did you join<tu as rejoint
you're joining<tu rejoins
you are joining<tu rejoins
are you joining<tu rejoins
you've joined<tu as rejoint
you have joined<tu as rejoint
have you joined<tu as rejoint
we join<nous rejoignons
we don't join<nous ne rejoignons pas
do we join<nous rejoignons
we joined<nous avons rejoint
we didn't join<nous n'avons pas rejoint
did we join<nous avons rejoint
we're joining<nous rejoignons
we are joining<nous rejoignons
are we joining<nous rejoignons
we've joined<nous avons rejoint
we have joined<nous avons rejoint
have we joined<nous avons rejoint
they join<ils rejoignent
they don't join<ils ne rejoignent pas
do they join<ils rejoignent
they joined<ils ont rejoint
they didn't join<ils n'ont pas rejoint
did they join<ils ont rejoint
they're joining<ils rejoignent
they are joining<ils rejoignent
are they joining<ils rejoignent
they've joined<ils ont rejoint
they have joined<ils ont rejoint
have they joined<ils ont rejoint
he joins<il rejoint
he doesn't join<il ne rejoint pas
does he join<il rejoint
he joined<il a rejoint
he didn't join<il n'a pas rejoint
did he join<il a rejoint
he's joining<il rejoint
he is joining<il rejoint
is he joining<il rejoint
he has joined<il a rejoint
has he joined<il a rejoint
she joins<elle rejoint
she doesn't join<elle ne rejoint pas
does she join<elle rejoint
she joined<elle a rejoint
she didn't join<elle n'a pas rejoint
did she join<elle a rejoint
she's joining<elle rejoint
she is joining<elle rejoint
is she joining<elle rejoint
she has joined<elle a rejoint
has she joined<elle a rejoint
it joins<il rejoint
it doesn't join<il ne rejoint pas
does it join<il rejoint
it joined<il a rejoint
it didn't join<il n'a pas rejoint
did it join<il a rejoint
it's joining<il rejoint
it is joining<il rejoint
is it joining<il rejoint
it has joined<il a rejoint
has it joined<il a rejoint
je rejoins>i join
je ne rejoins pas>i don't join
tu rejoins>you join
tu ne rejoins pas>you don't join
il rejoint>he joins
il ne rejoint pas>he doesn't join
elle rejoint>she joins
elle ne rejoint pas>she doesn't join
nous rejoignons>we join
nous ne rejoignons pas>we don't join
vous rejoignez>you join
vous ne rejoignez pas>you don't join
ils rejoignent>they join
ils ne rejoignent pas>they don't join
elles rejoignent>they join
elles ne rejoignent pas>they don't join
rejoins tu>do you join
rejoignez vous>do you join
est ce que tu rejoins>do you join
est ce que vous rejoignez>do you join
j'ai rejoint>i joined
tu as rejoint>you joined
il a rejoint>he joined
elle a rejoint>she joined
nous avons rejoint>we joined
vous avez rejoint>you joined
ils ont rejoint>they joined
elles ont rejoint>they joined
i invite<j'invite
i don't invite<je n'invite pas
do i invite<j'invite
i invited<j'ai invité
i didn't invite<je n'ai pas invité
did i invite<j'ai invité
i'm inviting<j'invite
i am inviting<j'invite
am i inviting<j'invite
i've invited<j'ai invité
i have invited<j'ai invité
have i invited<j'ai invité
you invite<tu invites
you don't invite<tu n'invites pas
do you invite<tu invites
you invited<tu as invité
you didn't invite<tu n'as pas invité
did you invite<tu as invité
you're inviting<tu invites
you are inviting<tu invites
are you inviting<tu invites
you've invited<tu as invité
you have invited<tu as invité
have you invited<tu as invité
we invite<nous invitons
we don't invite<nous n'invitons pas
do we invite<nous invitons
we invited<nous avons invité
we didn't invite<nous n'avons pas invité
did we invite<nous avons invité
we're inviting<nous invitons
we are inviting<nous invitons
are we inviting<nous invitons
we've invited<nous avons invité
we have invited<nous avons invité
have we invited<nous avons invité
they invite<ils invitent
they don't invite<ils n'invitent pas
do they invite<ils invitent
they invited<ils ont invité
they didn't invite<ils n'ont pas invité
did they invite<ils ont invité
they're inviting<ils invitent
they are inviting<ils invitent
are they inviting<ils invitent
they've invited<ils ont invité
they have invited<ils ont invité
have they invited<ils ont invité
he invites<il invite
he doesn't invite<il n'invite pas
does he invite<il invite
he invited<il a invité
he didn't invite<il n'a pas invité
did he invite<il a invité
he's inviting<il invite
he is inviting<il invite
is he inviting<il invite
he has invited<il a invité
has he invited<il a invité
she invites<elle invite
she doesn't invite<elle n'invite pas
does she invite<elle invite
she invited<elle a invité
she didn't invite<elle n'a pas invité
did she invite<elle a invité
she's inviting<elle invite
she is inviting<elle invite
is she inviting<elle invite
she has invited<elle a invité
has she invited<elle a invité
it invites<il invite
it doesn't invite<il n'invite pas
does it invite<il invite
it invited<il a invité
it didn't invite<il n'a pas invité
did it invite<il a invité
it's inviting<il invite
it is inviting<il invite
is it inviting<il invite
it has invited<il a invité
has it invited<il a invité
j'invite>i invite
je n'invite pas>i don't invite
tu invites>you invite
tu n'invites pas>you don't invite
il invite>he invites
il n'invite pas>he doesn't invite
elle invite>she invites
elle n'invite pas>she doesn't invite
nous invitons>we invite
nous n'invitons pas>we don't invite
vous invitez>you invite
vous n'invitez pas>you don't invite
ils invitent>they invite
ils n'invitent pas>they don't invite
elles invitent>they invite
elles n'invitent pas>they don't invite
invites tu>do you invite
invitez vous>do you invite
est ce que tu invites>do you invite
est ce que vous invitez>do you invite
j'ai invité>i invited
tu as invité>you invited
il a invité>he invited
elle a invité>she invited
nous avons invité>we invited
vous avez invité>you invited
ils ont invité>they invited
elles ont invité>they invited
i kill<je tue
i don't kill<je ne tue pas
do i kill<je tue
i killed<j'ai tué
i didn't kill<je n'ai pas tué
did i kill<j'ai tué
i'm killing<je tue
i am killing<je tue
am i killing<je tue
i've killed<j'ai tué
i have killed<j'ai tué
have i killed<j'ai tué
you kill<tu tues
you don't kill<tu ne tues pas
do you kill<tu tues
you killed<tu as tué
you didn't kill<tu n'as pas tué
did you kill<tu as tué
you're killing<tu tues
you are killing<tu tues
are you killing<tu tues
you've killed<tu as tué
you have killed<tu as tué
have you killed<tu as tué
we kill<nous tuons
we don't kill<nous ne tuons pas
do we kill<nous tuons
we killed<nous avons tué
we didn't kill<nous n'avons pas tué
did we kill<nous avons tué
we're killing<nous tuons
we are killing<nous tuons
are we killing<nous tuons
we've killed<nous avons tué
we have killed<nous avons tué
have we killed<nous avons tué
they kill<ils tuent
they don't kill<ils ne tuent pas
do they kill<ils tuent
they killed<ils ont tué
they didn't kill<ils n'ont pas tué
did they kill<ils ont tué
they're killing<ils tuent
they are killing<ils tuent
are they killing<ils tuent
they've killed<ils ont tué
they have killed<ils ont tué
have they killed<ils ont tué
he kills<il tue
he doesn't kill<il ne tue pas
does he kill<il tue
he killed<il a tué
he didn't kill<il n'a pas tué
did he kill<il a tué
he's killing<il tue
he is killing<il tue
is he killing<il tue
he has killed<il a tué
has he killed<il a tué
she kills<elle tue
she doesn't kill<elle ne tue pas
does she kill<elle tue
she killed<elle a tué
she didn't kill<elle n'a pas tué
did she kill<elle a tué
she's killing<elle tue
she is killing<elle tue
is she killing<elle tue
she has killed<elle a tué
has she killed<elle a tué
it kills<il tue
it doesn't kill<il ne tue pas
does it kill<il tue
it killed<il a tué
it didn't kill<il n'a pas tué
did it kill<il a tué
it's killing<il tue
it is killing<il tue
is it killing<il tue
it has killed<il a tué
has it killed<il a tué
je tue>i kill
je ne tue pas>i don't kill
tu tues>you kill
tu ne tues pas>you don't kill
il tue>he kills
il ne tue pas>he doesn't kill
elle tue>she kills
elle ne tue pas>she doesn't kill
nous tuons>we kill
nous ne tuons pas>we don't kill
vous tuez>you kill
vous ne tuez pas>you don't kill
ils tuent>they kill
ils ne tuent pas>they don't kill
elles tuent>they kill
elles ne tuent pas>they don't kill
tues tu>do you kill
tuez vous>do you kill
est ce que tu tues>do you kill
est ce que vous tuez>do you kill
j'ai tué>i killed
tu as tué>you killed
il a tué>he killed
elle a tué>she killed
nous avons tué>we killed
vous avez tué>you killed
ils ont tué>they killed
elles ont tué>they killed
i die<je meurs
i don't die<je ne meurs pas
do i die<je meurs
i died<je suis mort
i didn't die<je ne suis pas mort
did i die<je suis mort
i'm dying<je meurs
i am dying<je meurs
am i dying<je meurs
i've died<je suis mort
i have died<je suis mort
have i died<je suis mort
you die<tu meurs
you don't die<tu ne meurs pas
do you die<tu meurs
you died<tu es mort
you didn't die<tu n'es pas mort
did you die<tu es mort
you're dying<tu meurs
you are dying<tu meurs
are you dying<tu meurs
you've died<tu es mort
you have died<tu es mort
have you died<tu es mort
we die<nous mourons
we don't die<nous ne mourons pas
do we die<nous mourons
we died<nous sommes mort
we didn't die<nous ne sommes pas mort
did we die<nous sommes mort
we're dying<nous mourons
we are dying<nous mourons
are we dying<nous mourons
we've died<nous sommes mort
we have died<nous sommes mort
have we died<nous sommes mort
they die<ils meurent
they don't die<ils ne meurent pas
do they die<ils meurent
they died<ils sont mort
they didn't die<ils ne sont pas mort
did they die<ils sont mort
they're dying<ils meurent
they are dying<ils meurent
are they dying<ils meurent
they've died<ils sont mort
they have died<ils sont mort
have they died<ils sont mort
he dies<il meurt
he doesn't die<il ne meurt pas
does he die<il meurt
he died<il est mort
he didn't die<il n'est pas mort
did he die<il est mort
he's dying<il meurt
he is dying<il meurt
is he dying<il meurt
he has died<il est mort
has he died<il est mort
she dies<elle meurt
she doesn't die<elle ne meurt pas
does she die<elle meurt
she died<elle est mort
she didn't die<elle n'est pas mort
did she die<elle est mort
she's dying<elle meurt
she is dying<elle meurt
is she dying<elle meurt
she has died<elle est mort
has she died<elle est mort
it dies<il meurt
it doesn't die<il ne meurt pas
does it die<il meurt
it died<il est mort
it didn't die<il n'est pas mort
did it die<il est mort
it's dying<il meurt
it is dying<il meurt
is it dying<il meurt
it has died<il est mort
has it died<il est mort
je meurs>i die
je ne meurs pas>i don't die
tu meurs>you die
tu ne meurs pas>you don't die
il meurt>he dies
il ne meurt pas>he doesn't die
elle meurt>she dies
elle ne meurt pas>she doesn't die
nous mourons>we die
nous ne mourons pas>we don't die
vous mourez>you die
vous ne mourez pas>you don't die
ils meurent>they die
ils ne meurent pas>they don't die
elles meurent>they die
elles ne meurent pas>they don't die
meurs tu>do you die
mourez vous>do you die
est ce que tu meurs>do you die
est ce que vous mourez>do you die
je suis mort>i died
tu es mort>you died
il est mort>he died
elle est mort>she died
nous sommes mort>we died
vous êtes mort>you died
ils sont mort>they died
elles sont mort>they died
i win<je gagne
i don't win<je ne gagne pas
do i win<je gagne
i won<j'ai gagné
i didn't win<je n'ai pas gagné
did i win<j'ai gagné
i'm winning<je gagne
i am winning<je gagne
am i winning<je gagne
i've won<j'ai gagné
i have won<j'ai gagné
have i won<j'ai gagné
you win<tu gagnes
you don't win<tu ne gagnes pas
do you win<tu gagnes
you won<tu as gagné
you didn't win<tu n'as pas gagné
did you win<tu as gagné
you're winning<tu gagnes
you are winning<tu gagnes
are you winning<tu gagnes
you've won<tu as gagné
you have won<tu as gagné
have you won<tu as gagné
we win<nous gagnons
we don't win<nous ne gagnons pas
do we win<nous gagnons
we won<nous avons gagné
we didn't win<nous n'avons pas gagné
did we win<nous avons gagné
we're winning<nous gagnons
we are winning<nous gagnons
are we winning<nous gagnons
we've won<nous avons gagné
we have won<nous avons gagné
have we won<nous avons gagné
they win<ils gagnent
they don't win<ils ne gagnent pas
do they win<ils gagnent
they won<ils ont gagné
they didn't win<ils n'ont pas gagné
did they win<ils ont gagné
they're winning<ils gagnent
they are winning<ils gagnent
are they winning<ils gagnent
they've won<ils ont gagné
they have won<ils ont gagné
have they won<ils ont gagné
he wins<il gagne
he doesn't win<il ne gagne pas
does he win<il gagne
he won<il a gagné
he didn't win<il n'a pas gagné
did he win<il a gagné
he's winning<il gagne
he is winning<il gagne
is he winning<il gagne
he has won<il a gagné
has he won<il a gagné
she wins<elle gagne
she doesn't win<elle ne gagne pas
does she win<elle gagne
she won<elle a gagné
she didn't win<elle n'a pas gagné
did she win<elle a gagné
she's winning<elle gagne
she is winning<elle gagne
is she winning<elle gagne
she has won<elle a gagné
has she won<elle a gagné
it wins<il gagne
it doesn't win<il ne gagne pas
does it win<il gagne
it won<il a gagné
it didn't win<il n'a pas gagné
did it win<il a gagné
it's winning<il gagne
it is winning<il gagne
is it winning<il gagne
it has won<il a gagné
has it won<il a gagné
je gagne>i win
je ne gagne pas>i don't win
tu gagnes>you win
tu ne gagnes pas>you don't win
il gagne>he wins
il ne gagne pas>he doesn't win
elle gagne>she wins
elle ne gagne pas>she doesn't win
nous gagnons>we win
nous ne gagnons pas>we don't win
vous gagnez>you win
vous ne gagnez pas>you don't win
ils gagnent>they win
ils ne gagnent pas>they don't win
elles gagnent>they win
elles ne gagnent pas>they don't win
gagnes tu>do you win
gagnez vous>do you win
est ce que tu gagnes>do you win
est ce que vous gagnez>do you win
j'ai gagné>i won
tu as gagné>you won
il a gagné>he won
elle a gagné>she won
nous avons gagné>we won
vous avez gagné>you won
ils ont gagné>they won
elles ont gagné>they won
i lose<je perds
i don't lose<je ne perds pas
do i lose<je perds
i lost<j'ai perdu
i didn't lose<je n'ai pas perdu
did i lose<j'ai perdu
i'm losing<je perds
i am losing<je perds
am i losing<je perds
i've lost<j'ai perdu
i have lost<j'ai perdu
have i lost<j'ai perdu
you lose<tu perds
you don't lose<tu ne perds pas
do you lose<tu perds
you lost<tu as perdu
you didn't lose<tu n'as pas perdu
did you lose<tu as perdu
you're losing<tu perds
you are losing<tu perds
are you losing<tu perds
you've lost<tu as perdu
you have lost<tu as perdu
have you lost<tu as perdu
we lose<nous perdons
we don't lose<nous ne perdons pas
do we lose<nous perdons
we lost<nous avons perdu
we didn't lose<nous n'avons pas perdu
did we lose<nous avons perdu
we're losing<nous perdons
we are losing<nous perdons
are we losing<nous perdons
we've lost<nous avons perdu
we have lost<nous avons perdu
have we lost<nous avons perdu
they lose<ils perdent
they don't lose<ils ne perdent pas
do they lose<ils perdent
they lost<ils ont perdu
they didn't lose<ils n'ont pas perdu
did they lose<ils ont perdu
they're losing<ils perdent
they are losing<ils perdent
are they losing<ils perdent
they've lost<ils ont perdu
they have lost<ils ont perdu
have they lost<ils ont perdu
he loses<il perd
he doesn't lose<il ne perd pas
does he lose<il perd
he lost<il a perdu
he didn't lose<il n'a pas perdu
did he lose<il a perdu
he's losing<il perd
he is losing<il perd
is he losing<il perd
he has lost<il a perdu
has he lost<il a perdu
she loses<elle perd
she doesn't lose<elle ne perd pas
does she lose<elle perd
she lost<elle a perdu
she didn't lose<elle n'a pas perdu
did she lose<elle a perdu
she's losing<elle perd
she is losing<elle perd
is she losing<elle perd
she has lost<elle a perdu
has she lost<elle a perdu
it loses<il perd
it doesn't lose<il ne perd pas
does it lose<il perd
it lost<il a perdu
it didn't lose<il n'a pas perdu
did it lose<il a perdu
it's losing<il perd
it is losing<il perd
is it losing<il perd
it has lost<il a perdu
has it lost<il a perdu
je perds>i lose
je ne perds pas>i don't lose
tu perds>you lose
tu ne perds pas>you don't lose
il perd>he loses
il ne perd pas>he doesn't lose
elle perd>she loses
elle ne perd pas>she doesn't lose
nous perdons>we lose
nous ne perdons pas>we don't lose
vous perdez>you lose
vous ne perdez pas>you don't lose
ils perdent>they lose
ils ne perdent pas>they don't lose
elles perdent>they lose
elles ne perdent pas>they don't lose
perds tu>do you lose
perdez vous>do you lose
est ce que tu perds>do you lose
est ce que vous perdez>do you lose
j'ai perdu>i lost
tu as perdu>you lost
il a perdu>he lost
elle a perdu>she lost
nous avons perdu>we lost
vous avez perdu>you lost
ils ont perdu>they lost
elles ont perdu>they lost
i run<je cours
i don't run<je ne cours pas
do i run<je cours
i ran<j'ai couru
i didn't run<je n'ai pas couru
did i run<j'ai couru
i'm running<je cours
i am running<je cours
am i running<je cours
i've run<j'ai couru
i have run<j'ai couru
have i run<j'ai couru
you run<tu cours
you don't run<tu ne cours pas
do you run<tu cours
you ran<tu as couru
you didn't run<tu n'as pas couru
did you run<tu as couru
you're running<tu cours
you are running<tu cours
are you running<tu cours
you've run<tu as couru
you have run<tu as couru
have you run<tu as couru
we run<nous courons
we don't run<nous ne courons pas
do we run<nous courons
we ran<nous avons couru
we didn't run<nous n'avons pas couru
did we run<nous avons couru
we're running<nous courons
we are running<nous courons
are we running<nous courons
we've run<nous avons couru
we have run<nous avons couru
have we run<nous avons couru
they run<ils courent
they don't run<ils ne courent pas
do they run<ils courent
they ran<ils ont couru
they didn't run<ils n'ont pas couru
did they run<ils ont couru
they're running<ils courent
they are running<ils courent
are they running<ils courent
they've run<ils ont couru
they have run<ils ont couru
have they run<ils ont couru
he runs<il court
he doesn't run<il ne court pas
does he run<il court
he ran<il a couru
he didn't run<il n'a pas couru
did he run<il a couru
he's running<il court
he is running<il court
is he running<il court
he has run<il a couru
has he run<il a couru
she runs<elle court
she doesn't run<elle ne court pas
does she run<elle court
she ran<elle a couru
she didn't run<elle n'a pas couru
did she run<elle a couru
she's running<elle court
she is running<elle court
is she running<elle court
she has run<elle a couru
has she run<elle a couru
it runs<il court
it doesn't run<il ne court pas
does it run<il court
it ran<il a couru
it didn't run<il n'a pas couru
did it run<il a couru
it's running<il court
it is running<il court
is it running<il court
it has run<il a couru
has it run<il a couru
je cours>i run
je ne cours pas>i don't run
tu cours>you run
tu ne cours pas>you don't run
il court>he runs
il ne court pas>he doesn't run
elle court>she runs
elle ne court pas>she doesn't run
nous courons>we run
nous ne courons pas>we don't run
vous courez>you run
vous ne courez pas>you don't run
ils courent>they run
ils ne courent pas>they don't run
elles courent>they run
elles ne courent pas>they don't run
cours tu>do you run
courez vous>do you run
est ce que tu cours>do you run
est ce que vous courez>do you run
j'ai couru>i ran
tu as couru>you ran
il a couru>he ran
elle a couru>she ran
nous avons couru>we ran
vous avez couru>you ran
ils ont couru>they ran
elles ont couru>they ran
i leave<je pars
i don't leave<je ne pars pas
do i leave<je pars
i left<je suis parti
i didn't leave<je ne suis pas parti
did i leave<je suis parti
i'm leaving<je pars
i am leaving<je pars
am i leaving<je pars
i've left<je suis parti
i have left<je suis parti
have i left<je suis parti
you leave<tu pars
you don't leave<tu ne pars pas
do you leave<tu pars
you left<tu es parti
you didn't leave<tu n'es pas parti
did you leave<tu es parti
you're leaving<tu pars
you are leaving<tu pars
are you leaving<tu pars
you've left<tu es parti
you have left<tu es parti
have you left<tu es parti
we leave<nous partons
we don't leave<nous ne partons pas
do we leave<nous partons
we left<nous sommes parti
we didn't leave<nous ne sommes pas parti
did we leave<nous sommes parti
we're leaving<nous partons
we are leaving<nous partons
are we leaving<nous partons
we've left<nous sommes parti
we have left<nous sommes parti
have we left<nous sommes parti
they leave<ils partent
they don't leave<ils ne partent pas
do they leave<ils partent
they left<ils sont parti
they didn't leave<ils ne sont pas parti
did they leave<ils sont parti
they're leaving<ils partent
they are leaving<ils partent
are they leaving<ils partent
they've left<ils sont parti
they have left<ils sont parti
have they left<ils sont parti
he leaves<il part
he doesn't leave<il ne part pas
does he leave<il part
he left<il est parti
he didn't leave<il n'est pas parti
did he leave<il est parti
he's leaving<il part
he is leaving<il part
is he leaving<il part
he has left<il est parti
has he left<il est parti
she leaves<elle part
she doesn't leave<elle ne part pas
does she leave<elle part
she left<elle est parti
she didn't leave<elle n'est pas parti
did she leave<elle est parti
she's leaving<elle part
she is leaving<elle part
is she leaving<elle part
she has left<elle est parti
has she left<elle est parti
it leaves<il part
it doesn't leave<il ne part pas
does it leave<il part
it left<il est parti
it didn't leave<il n'est pas parti
did it leave<il est parti
it's leaving<il part
it is leaving<il part
is it leaving<il part
it has left<il est parti
has it left<il est parti
je pars>i leave
je ne pars pas>i don't leave
tu pars>you leave
tu ne pars pas>you don't leave
il part>he leaves
il ne part pas>he doesn't leave
elle part>she leaves
elle ne part pas>she doesn't leave
nous partons>we leave
nous ne partons pas>we don't leave
vous partez>you leave
vous ne partez pas>you don't leave
ils partent>they leave
ils ne partent pas>they don't leave
elles partent>they leave
elles ne partent pas>they don't leave
pars tu>do you leave
partez vous>do you leave
est ce que tu pars>do you leave
est ce que vous partez>do you leave
je suis parti>i left
tu es parti>you left
il est parti>he left
elle est parti>she left
nous sommes parti>we left
vous êtes parti>you left
ils sont parti>they left
elles sont parti>they left
i stay<je reste
i don't stay<je ne reste pas
do i stay<je reste
i stayed<je suis resté
i didn't stay<je ne suis pas resté
did i stay<je suis resté
i'm staying<je reste
i am staying<je reste
am i staying<je reste
i've stayed<je suis resté
i have stayed<je suis resté
have i stayed<je suis resté
you stay<tu restes
you don't stay<tu ne restes pas
do you stay<tu restes
you stayed<tu es resté
you didn't stay<tu n'es pas resté
did you stay<tu es resté
you're staying<tu restes
you are staying<tu restes
are you staying<tu restes
you've stayed<tu es resté
you have stayed<tu es resté
have you stayed<tu es resté
we stay<nous restons
we don't stay<nous ne restons pas
do we stay<nous restons
we stayed<nous sommes resté
we didn't stay<nous ne sommes pas resté
did we stay<nous sommes resté
we're staying<nous restons
we are staying<nous restons
are we staying<nous restons
we've stayed<nous sommes resté
we have stayed<nous sommes resté
have we stayed<nous sommes resté
they stay<ils restent
they don't stay<ils ne restent pas
do they stay<ils restent
they stayed<ils sont resté
they didn't stay<ils ne sont pas resté
did they stay<ils sont resté
they're staying<ils restent
they are staying<ils restent
are they staying<ils restent
they've stayed<ils sont resté
they have stayed<ils sont resté
have they stayed<ils sont resté
he stays<il reste
he doesn't stay<il ne reste pas
does he stay<il reste
he stayed<il est resté
he didn't stay<il n'est pas resté
did he stay<il est resté
he's staying<il reste
he is staying<il reste
is he staying<il reste
he has stayed<il est resté
has he stayed<il est resté
she stays<elle reste
she doesn't stay<elle ne reste pas
does she stay<elle reste
she stayed<elle est resté
she didn't stay<elle n'est pas resté
did she stay<elle est resté
she's staying<elle reste
she is staying<elle reste
is she staying<elle reste
she has stayed<elle est resté
has she stayed<elle est resté
it stays<il reste
it doesn't stay<il ne reste pas
does it stay<il reste
it stayed<il est resté
it didn't stay<il n'est pas resté
did it stay<il est resté
it's staying<il reste
it is staying<il reste
is it staying<il reste
it has stayed<il est resté
has it stayed<il est resté
je reste>i stay
je ne reste pas>i don't stay
tu restes>you stay
tu ne restes pas>you don't stay
il reste>he stays
il ne reste pas>he doesn't stay
elle reste>she stays
elle ne reste pas>she doesn't stay
nous restons>we stay
nous ne restons pas>we don't stay
vous restez>you stay
vous ne restez pas>you don't stay
ils restent>they stay
ils ne restent pas>they don't stay
elles restent>they stay
elles ne restent pas>they don't stay
restes tu>do you stay
restez vous>do you stay
est ce que tu restes>do you stay
est ce que vous restez>do you stay
je suis resté>i stayed
tu es resté>you stayed
il est resté>he stayed
elle est resté>she stayed
nous sommes resté>we stayed
vous êtes resté>you stayed
ils sont resté>they stayed
elles sont resté>they stayed
i meet<je rencontre
i don't meet<je ne rencontre pas
do i meet<je rencontre
i met<j'ai rencontré
i didn't meet<je n'ai pas rencontré
did i meet<j'ai rencontré
i'm meeting<je rencontre
i am meeting<je rencontre
am i meeting<je rencontre
i've met<j'ai rencontré
i have met<j'ai rencontré
have i met<j'ai rencontré
you meet<tu rencontres
you don't meet<tu ne rencontres pas
do you meet<tu rencontres
you met<tu as rencontré
you didn't meet<tu n'as pas rencontré
did you meet<tu as rencontré
you're meeting<tu rencontres
you are meeting<tu rencontres
are you meeting<tu rencontres
you've met<tu as rencontré
you have met<tu as rencontré
have you met<tu as rencontré
we meet<nous rencontrons
we don't meet<nous ne rencontrons pas
do we meet<nous rencontrons
we met<nous avons rencontré
we didn't meet<nous n'avons pas rencontré
did we meet<nous avons rencontré
we're meeting<nous rencontrons
we are meeting<nous rencontrons
are we meeting<nous rencontrons
we've met<nous avons rencontré
we have met<nous avons rencontré
have we met<nous avons rencontré
they meet<ils rencontrent
they don't meet<ils ne rencontrent pas
do they meet<ils rencontrent
they met<ils ont rencontré
they didn't meet<ils n'ont pas rencontré
did they meet<ils ont rencontré
they're meeting<ils rencontrent
they are meeting<ils rencontrent
are they meeting<ils rencontrent
they've met<ils ont rencontré
they have met<ils ont rencontré
have they met<ils ont rencontré
he meets<il rencontre
he doesn't meet<il ne rencontre pas
does he meet<il rencontre
he met<il a rencontré
he didn't meet<il n'a pas rencontré
did he meet<il a rencontré
he's meeting<il rencontre
he is meeting<il rencontre
is he meeting<il rencontre
he has met<il a rencontré
has he met<il a rencontré
she meets<elle rencontre
she doesn't meet<elle ne rencontre pas
does she meet<elle rencontre
she met<elle a rencontré
she didn't meet<elle n'a pas rencontré
did she meet<elle a rencontré
she's meeting<elle rencontre
she is meeting<elle rencontre
is she meeting<elle rencontre
she has met<elle a rencontré
has she met<elle a rencontré
it meets<il rencontre
it doesn't meet<il ne rencontre pas
does it meet<il rencontre
it met<il a rencontré
it didn't meet<il n'a pas rencontré
did it meet<il a rencontré
it's meeting<il rencontre
it is meeting<il rencontre
is it meeting<il rencontre
it has met<il a rencontré
has it met<il a rencontré
je rencontre>i meet
je ne rencontre pas>i don't meet
tu rencontres>you meet
tu ne rencontres pas>you don't meet
il rencontre>he meets
il ne rencontre pas>he doesn't meet
elle rencontre>she meets
elle ne rencontre pas>she doesn't meet
nous rencontrons>we meet
nous ne rencontrons pas>we don't meet
vous rencontrez>you meet
vous ne rencontrez pas>you don't meet
ils rencontrent>they meet
ils ne rencontrent pas>they don't meet
elles rencontrent>they meet
elles ne rencontrent pas>they don't meet
rencontres tu>do you meet
rencontrez vous>do you meet
est ce que tu rencontres>do you meet
est ce que vous rencontrez>do you meet
j'ai rencontré>i met
tu as rencontré>you met
il a rencontré>he met
elle a rencontré>she met
nous avons rencontré>we met
vous avez rencontré>you met
ils ont rencontré>they met
elles ont rencontré>they met
i follow<je suis
i don't follow<je ne suis pas
do i follow<je suis
i followed<j'ai suivi
i didn't follow<je n'ai pas suivi
did i follow<j'ai suivi
i'm following<je suis
i am following<je suis
am i following<je suis
i've followed<j'ai suivi
i have followed<j'ai suivi
have i followed<j'ai suivi
you follow<tu suis
you don't follow<tu ne suis pas
do you follow<tu suis
you followed<tu as suivi
you didn't follow<tu n'as pas suivi
did you follow<tu as suivi
you're following<tu suis
you are following<tu suis
are you following<tu suis
you've followed<tu as suivi
you have followed<tu as suivi
have you followed<tu as suivi
we follow<nous suivons
we don't follow<nous ne suivons pas
do we follow<nous suivons
we followed<nous avons suivi
we didn't follow<nous n'avons pas suivi
did we follow<nous avons suivi
we're following<nous suivons
we are following<nous suivons
are we following<nous suivons
we've followed<nous avons suivi
we have followed<nous avons suivi
have we followed<nous avons suivi
they follow<ils suivent
they don't follow<ils ne suivent pas
do they follow<ils suivent
they followed<ils ont suivi
they didn't follow<ils n'ont pas suivi
did they follow<ils ont suivi
they're following<ils suivent
they are following<ils suivent
are they following<ils suivent
they've followed<ils ont suivi
they have followed<ils ont suivi
have they followed<ils ont suivi
he follows<il suit
he doesn't follow<il ne suit pas
does he follow<il suit
he followed<il a suivi
he didn't follow<il n'a pas suivi
did he follow<il a suivi
he's following<il suit
he is following<il suit
is he following<il suit
he has followed<il a suivi
has he followed<il a suivi
she follows<elle suit
she doesn't follow<elle ne suit pas
does she follow<elle suit
she followed<elle a suivi
she didn't follow<elle n'a pas suivi
did she follow<elle a suivi
she's following<elle suit
she is following<elle suit
is she following<elle suit
she has followed<elle a suivi
has she followed<elle a suivi
it follows<il suit
it doesn't follow<il ne suit pas
does it follow<il suit
it followed<il a suivi
it didn't follow<il n'a pas suivi
did it follow<il a suivi
it's following<il suit
it is following<il suit
is it following<il suit
it has followed<il a suivi
has it followed<il a suivi
je suis>i follow
je ne suis pas>i don't follow
tu suis>you follow
tu ne suis pas>you don't follow
il suit>he follows
il ne suit pas>he doesn't follow
elle suit>she follows
elle ne suit pas>she doesn't follow
nous suivons>we follow
nous ne suivons pas>we don't follow
vous suivez>you follow
vous ne suivez pas>you don't follow
ils suivent>they follow
ils ne suivent pas>they don't follow
elles suivent>they follow
elles ne suivent pas>they don't follow
suis tu>do you follow
suivez vous>do you follow
est ce que tu suis>do you follow
est ce que vous suivez>do you follow
j'ai suivi>i followed
tu as suivi>you followed
il a suivi>he followed
elle a suivi>she followed
nous avons suivi>we followed
vous avez suivi>you followed
ils ont suivi>they followed
elles ont suivi>they followed
i stop<j'arrête
i don't stop<je n'arrête pas
do i stop<j'arrête
i stopped<j'ai arrêté
i didn't stop<je n'ai pas arrêté
did i stop<j'ai arrêté
i'm stopping<j'arrête
i am stopping<j'arrête
am i stopping<j'arrête
i've stopped<j'ai arrêté
i have stopped<j'ai arrêté
have i stopped<j'ai arrêté
you stop<tu arrêtes
you don't stop<tu n'arrêtes pas
do you stop<tu arrêtes
you stopped<tu as arrêté
you didn't stop<tu n'as pas arrêté
did you stop<tu as arrêté
you're stopping<tu arrêtes
you are stopping<tu arrêtes
are you stopping<tu arrêtes
you've stopped<tu as arrêté
you have stopped<tu as arrêté
have you stopped<tu as arrêté
we stop<nous arrêtons
we don't stop<nous n'arrêtons pas
do we stop<nous arrêtons
we stopped<nous avons arrêté
we didn't stop<nous n'avons pas arrêté
did we stop<nous avons arrêté
we're stopping<nous arrêtons
we are stopping<nous arrêtons
are we stopping<nous arrêtons
we've stopped<nous avons arrêté
we have stopped<nous avons arrêté
have we stopped<nous avons arrêté
they stop<ils arrêtent
they don't stop<ils n'arrêtent pas
do they stop<ils arrêtent
they stopped<ils ont arrêté
they didn't stop<ils n'ont pas arrêté
did they stop<ils ont arrêté
they're stopping<ils arrêtent
they are stopping<ils arrêtent
are they stopping<ils arrêtent
they've stopped<ils ont arrêté
they have stopped<ils ont arrêté
have they stopped<ils ont arrêté
he stops<il arrête
he doesn't stop<il n'arrête pas
does he stop<il arrête
he stopped<il a arrêté
he didn't stop<il n'a pas arrêté
did he stop<il a arrêté
he's stopping<il arrête
he is stopping<il arrête
is he stopping<il arrête
he has stopped<il a arrêté
has he stopped<il a arrêté
she stops<elle arrête
she doesn't stop<elle n'arrête pas
does she stop<elle arrête
she stopped<elle a arrêté
she didn't stop<elle n'a pas arrêté
did she stop<elle a arrêté
she's stopping<elle arrête
she is stopping<elle arrête
is she stopping<elle arrête
she has stopped<elle a arrêté
has she stopped<elle a arrêté
it stops<il arrête
it doesn't stop<il n'arrête pas
does it stop<il arrête
it stopped<il a arrêté
it didn't stop<il n'a pas arrêté
did it stop<il a arrêté
it's stopping<il arrête
it is stopping<il arrête
is it stopping<il arrête
it has stopped<il a arrêté
has it stopped<il a arrêté
j'arrête>i stop
je n'arrête pas>i don't stop
tu arrêtes>you stop
tu n'arrêtes pas>you don't stop
il arrête>he stops
il n'arrête pas>he doesn't stop
elle arrête>she stops
elle n'arrête pas>she doesn't stop
nous arrêtons>we stop
nous n'arrêtons pas>we don't stop
vous arrêtez>you stop
vous n'arrêtez pas>you don't stop
ils arrêtent>they stop
ils n'arrêtent pas>they don't stop
elles arrêtent>they stop
elles n'arrêtent pas>they don't stop
arrêtes tu>do you stop
arrêtez vous>do you stop
est ce que tu arrêtes>do you stop
est ce que vous arrêtez>do you stop
j'ai arrêté>i stopped
tu as arrêté>you stopped
il a arrêté>he stopped
elle a arrêté>she stopped
nous avons arrêté>we stopped
vous avez arrêté>you stopped
ils ont arrêté>they stopped
elles ont arrêté>they stopped
i start<je commence
i don't start<je ne commence pas
i start to<je commence à
i don't start to<je ne commence pas à
do i start<je commence
i started<j'ai commencé
i didn't start<je n'ai pas commencé
did i start<j'ai commencé
i'm starting<je commence
i am starting<je commence
am i starting<je commence
i've started<j'ai commencé
i have started<j'ai commencé
have i started<j'ai commencé
you start<tu commences
you don't start<tu ne commences pas
you start to<tu commences à
you don't start to<tu ne commences pas à
do you start<tu commences
you started<tu as commencé
you didn't start<tu n'as pas commencé
did you start<tu as commencé
you're starting<tu commences
you are starting<tu commences
are you starting<tu commences
you've started<tu as commencé
you have started<tu as commencé
have you started<tu as commencé
we start<nous commençons
we don't start<nous ne commençons pas
we start to<nous commençons à
we don't start to<nous ne commençons pas à
do we start<nous commençons
we started<nous avons commencé
we didn't start<nous n'avons pas commencé
did we start<nous avons commencé
we're starting<nous commençons
we are starting<nous commençons
are we starting<nous commençons
we've started<nous avons commencé
we have started<nous avons commencé
have we started<nous avons commencé
they start<ils commencent
they don't start<ils ne commencent pas
they start to<ils commencent à
they don't start to<ils ne commencent pas à
do they start<ils commencent
they started<ils ont commencé
they didn't start<ils n'ont pas commencé
did they start<ils ont commencé
they're starting<ils commencent
they are starting<ils commencent
are they starting<ils commencent
they've started<ils ont commencé
they have started<ils ont commencé
have they started<ils ont commencé
he starts<il commence
he doesn't start<il ne commence pas
he starts to<il commence à
he doesn't start to<il ne commence pas à
does he start<il commence
he started<il a commencé
he didn't start<il n'a pas commencé
did he start<il a commencé
he's starting<il commence
he is starting<il commence
is he starting<il commence
he has started<il a commencé
has he started<il a commencé
she starts<elle commence
she doesn't start<elle ne commence pas
she starts to<elle commence à
she doesn't start to<elle ne commence pas à
does she start<elle commence
she started<elle a commencé
she didn't start<elle n'a pas commencé
did she start<elle a commencé
she's starting<elle commence
she is starting<elle commence
is she starting<elle commence
she has started<elle a commencé
has she started<elle a commencé
it starts<il commence
it doesn't start<il ne commence pas
it starts to<il commence à
it doesn't start to<il ne commence pas à
does it start<il commence
it started<il a commencé
it didn't start<il n'a pas commencé
did it start<il a commencé
it's starting<il commence
it is starting<il commence
is it starting<il commence
it has started<il a commencé
has it started<il a commencé
je commence>i start
je ne commence pas>i don't start
tu commences>you start
tu ne commences pas>you don't start
il commence>he starts
il ne commence pas>he doesn't start
elle commence>she starts
elle ne commence pas>she doesn't start
nous commençons>we start
nous ne commençons pas>we don't start
vous commencez>you start
vous ne commencez pas>you don't start
ils commencent>they start
ils ne commencent pas>they don't start
elles commencent>they start
elles ne commencent pas>they don't start
commences tu>do you start
commencez vous>do you start
est ce que tu commences>do you start
est ce que vous commencez>do you start
j'ai commencé>i started
tu as commencé>you started
il a commencé>he started
elle a commencé>she started
nous avons commencé>we started
vous avez commencé>you started
ils ont commencé>they started
elles ont commencé>they started
i finish<je finis
i don't finish<je ne finis pas
do i finish<je finis
i finished<j'ai fini
i didn't finish<je n'ai pas fini
did i finish<j'ai fini
i'm finishing<je finis
i am finishing<je finis
am i finishing<je finis
i've finished<j'ai fini
i have finished<j'ai fini
have i finished<j'ai fini
you finish<tu finis
you don't finish<tu ne finis pas
do you finish<tu finis
you finished<tu as fini
you didn't finish<tu n'as pas fini
did you finish<tu as fini
you're finishing<tu finis
you are finishing<tu finis
are you finishing<tu finis
you've finished<tu as fini
you have finished<tu as fini
have you finished<tu as fini
we finish<nous finissons
we don't finish<nous ne finissons pas
do we finish<nous finissons
we finished<nous avons fini
we didn't finish<nous n'avons pas fini
did we finish<nous avons fini
we're finishing<nous finissons
we are finishing<nous finissons
are we finishing<nous finissons
we've finished<nous avons fini
we have finished<nous avons fini
have we finished<nous avons fini
they finish<ils finissent
they don't finish<ils ne finissent pas
do they finish<ils finissent
they finished<ils ont fini
they didn't finish<ils n'ont pas fini
did they finish<ils ont fini
they're finishing<ils finissent
they are finishing<ils finissent
are they finishing<ils finissent
they've finished<ils ont fini
they have finished<ils ont fini
have they finished<ils ont fini
he finishes<il finit
he doesn't finish<il ne finit pas
does he finish<il finit
he finished<il a fini
he didn't finish<il n'a pas fini
did he finish<il a fini
he's finishing<il finit
he is finishing<il finit
is he finishing<il finit
he has finished<il a fini
has he finished<il a fini
she finishes<elle finit
she doesn't finish<elle ne finit pas
does she finish<elle finit
she finished<elle a fini
she didn't finish<elle n'a pas fini
did she finish<elle a fini
she's finishing<elle finit
she is finishing<elle finit
is she finishing<elle finit
she has finished<elle a fini
has she finished<elle a fini
it finishes<il finit
it doesn't finish<il ne finit pas
does it finish<il finit
it finished<il a fini
it didn't finish<il n'a pas fini
did it finish<il a fini
it's finishing<il finit
it is finishing<il finit
is it finishing<il finit
it has finished<il a fini
has it finished<il a fini
je finis>i finish
je ne finis pas>i don't finish
tu finis>you finish
tu ne finis pas>you don't finish
il finit>he finishes
il ne finit pas>he doesn't finish
elle finit>she finishes
elle ne finit pas>she doesn't finish
nous finissons>we finish
nous ne finissons pas>we don't finish
vous finissez>you finish
vous ne finissez pas>you don't finish
ils finissent>they finish
ils ne finissent pas>they don't finish
elles finissent>they finish
elles ne finissent pas>they don't finish
finis tu>do you finish
finissez vous>do you finish
est ce que tu finis>do you finish
est ce que vous finissez>do you finish
j'ai fini>i finished
tu as fini>you finished
il a fini>he finished
elle a fini>she finished
nous avons fini>we finished
vous avez fini>you finished
ils ont fini>they finished
elles ont fini>they finished
i fix<je répare
i don't fix<je ne répare pas
do i fix<je répare
i fixed<j'ai réparé
i didn't fix<je n'ai pas réparé
did i fix<j'ai réparé
i'm fixing<je répare
i am fixing<je répare
am i fixing<je répare
i've fixed<j'ai réparé
i have fixed<j'ai réparé
have i fixed<j'ai réparé
you fix<tu répares
you don't fix<tu ne répares pas
do you fix<tu répares
you fixed<tu as réparé
you didn't fix<tu n'as pas réparé
did you fix<tu as réparé
you're fixing<tu répares
you are fixing<tu répares
are you fixing<tu répares
you've fixed<tu as réparé
you have fixed<tu as réparé
have you fixed<tu as réparé
we fix<nous réparons
we don't fix<nous ne réparons pas
do we fix<nous réparons
we fixed<nous avons réparé
we didn't fix<nous n'avons pas réparé
did we fix<nous avons réparé
we're fixing<nous réparons
we are fixing<nous réparons
are we fixing<nous réparons
we've fixed<nous avons réparé
we have fixed<nous avons réparé
have we fixed<nous avons réparé
they fix<ils réparent
they don't fix<ils ne réparent pas
do they fix<ils réparent
they fixed<ils ont réparé
they didn't fix<ils n'ont pas réparé
did they fix<ils ont réparé
they're fixing<ils réparent
they are fixing<ils réparent
are they fixing<ils réparent
they've fixed<ils ont réparé
they have fixed<ils ont réparé
have they fixed<ils ont réparé
he fixes<il répare
he doesn't fix<il ne répare pas
does he fix<il répare
he fixed<il a réparé
he didn't fix<il n'a pas réparé
did he fix<il a réparé
he's fixing<il répare
he is fixing<il répare
is he fixing<il répare
he has fixed<il a réparé
has he fixed<il a réparé
she fixes<elle répare
she doesn't fix<elle ne répare pas
does she fix<elle répare
she fixed<elle a réparé
she didn't fix<elle n'a pas réparé
did she fix<elle a réparé
she's fixing<elle répare
she is fixing<elle répare
is she fixing<elle répare
she has fixed<elle a réparé
has she fixed<elle a réparé
it fixes<il répare
it doesn't fix<il ne répare pas
does it fix<il répare
it fixed<il a réparé
it didn't fix<il n'a pas réparé
did it fix<il a réparé
it's fixing<il répare
it is fixing<il répare
is it fixing<il répare
it has fixed<il a réparé
has it fixed<il a réparé
je répare>i fix
je ne répare pas>i don't fix
tu répares>you fix
tu ne répares pas>you don't fix
il répare>he fixes
il ne répare pas>he doesn't fix
elle répare>she fixes
elle ne répare pas>she doesn't fix
nous réparons>we fix
nous ne réparons pas>we don't fix
vous réparez>you fix
vous ne réparez pas>you don't fix
ils réparent>they fix
ils ne réparent pas>they don't fix
elles réparent>they fix
elles ne réparent pas>they don't fix
répares tu>do you fix
réparez vous>do you fix
est ce que tu répares>do you fix
est ce que vous réparez>do you fix
j'ai réparé>i fixed
tu as réparé>you fixed
il a réparé>he fixed
elle a réparé>she fixed
nous avons réparé>we fixed
vous avez réparé>you fixed
ils ont réparé>they fixed
elles ont réparé>they fixed
i bring<j'apporte
i don't bring<je n'apporte pas
do i bring<j'apporte
i brought<j'ai apporté
i didn't bring<je n'ai pas apporté
did i bring<j'ai apporté
i'm bringing<j'apporte
i am bringing<j'apporte
am i bringing<j'apporte
i've brought<j'ai apporté
i have brought<j'ai apporté
have i brought<j'ai apporté
you bring<tu apportes
you don't bring<tu n'apportes pas
do you bring<tu apportes
you brought<tu as apporté
you didn't bring<tu n'as pas apporté
did you bring<tu as apporté
you're bringing<tu apportes
you are bringing<tu apportes
are you bringing<tu apportes
you've brought<tu as apporté
you have brought<tu as apporté
have you brought<tu as apporté
we bring<nous apportons
we don't bring<nous n'apportons pas
do we bring<nous apportons
we brought<nous avons apporté
we didn't bring<nous n'avons pas apporté
did we bring<nous avons apporté
we're bringing<nous apportons
we are bringing<nous apportons
are we bringing<nous apportons
we've brought<nous avons apporté
we have brought<nous avons apporté
have we brought<nous avons apporté
they bring<ils apportent
they don't bring<ils n'apportent pas
do they bring<ils apportent
they brought<ils ont apporté
they didn't bring<ils n'ont pas apporté
did they bring<ils ont apporté
they're bringing<ils apportent
they are bringing<ils apportent
are they bringing<ils apportent
they've brought<ils ont apporté
they have brought<ils ont apporté
have they brought<ils ont apporté
he brings<il apporte
he doesn't bring<il n'apporte pas
does he bring<il apporte
he brought<il a apporté
he didn't bring<il n'a pas apporté
did he bring<il a apporté
he's bringing<il apporte
he is bringing<il apporte
is he bringing<il apporte
he has brought<il a apporté
has he brought<il a apporté
she brings<elle apporte
she doesn't bring<elle n'apporte pas
does she bring<elle apporte
she brought<elle a apporté
she didn't bring<elle n'a pas apporté
did she bring<elle a apporté
she's bringing<elle apporte
she is bringing<elle apporte
is she bringing<elle apporte
she has brought<elle a apporté
has she brought<elle a apporté
it brings<il apporte
it doesn't bring<il n'apporte pas
does it bring<il apporte
it brought<il a apporté
it didn't bring<il n'a pas apporté
did it bring<il a apporté
it's bringing<il apporte
it is bringing<il apporte
is it bringing<il apporte
it has brought<il a apporté
has it brought<il a apporté
j'apporte>i bring
je n'apporte pas>i don't bring
tu apportes>you bring
tu n'apportes pas>you don't bring
il apporte>he brings
il n'apporte pas>he doesn't bring
elle apporte>she brings
elle n'apporte pas>she doesn't bring
nous apportons>we bring
nous n'apportons pas>we don't bring
vous apportez>you bring
vous n'apportez pas>you don't bring
ils apportent>they bring
ils n'apportent pas>they don't bring
elles apportent>they bring
elles n'apportent pas>they don't bring
apportes tu>do you bring
apportez vous>do you bring
est ce que tu apportes>do you bring
est ce que vous apportez>do you bring
j'ai apporté>i brought
tu as apporté>you brought
il a apporté>he brought
elle a apporté>she brought
nous avons apporté>we brought
vous avez apporté>you brought
ils ont apporté>they brought
elles ont apporté>they brought
i send<j'envoie
i don't send<je n'envoie pas
do i send<j'envoie
i sent<j'ai envoyé
i didn't send<je n'ai pas envoyé
did i send<j'ai envoyé
i'm sending<j'envoie
i am sending<j'envoie
am i sending<j'envoie
i've sent<j'ai envoyé
i have sent<j'ai envoyé
have i sent<j'ai envoyé
you send<tu envoies
you don't send<tu n'envoies pas
do you send<tu envoies
you sent<tu as envoyé
you didn't send<tu n'as pas envoyé
did you send<tu as envoyé
you're sending<tu envoies
you are sending<tu envoies
are you sending<tu envoies
you've sent<tu as envoyé
you have sent<tu as envoyé
have you sent<tu as envoyé
we send<nous envoyons
we don't send<nous n'envoyons pas
do we send<nous envoyons
we sent<nous avons envoyé
we didn't send<nous n'avons pas envoyé
did we send<nous avons envoyé
we're sending<nous envoyons
we are sending<nous envoyons
are we sending<nous envoyons
we've sent<nous avons envoyé
we have sent<nous avons envoyé
have we sent<nous avons envoyé
they send<ils envoient
they don't send<ils n'envoient pas
do they send<ils envoient
they sent<ils ont envoyé
they didn't send<ils n'ont pas envoyé
did they send<ils ont envoyé
they're sending<ils envoient
they are sending<ils envoient
are they sending<ils envoient
they've sent<ils ont envoyé
they have sent<ils ont envoyé
have they sent<ils ont envoyé
he sends<il envoie
he doesn't send<il n'envoie pas
does he send<il envoie
he sent<il a envoyé
he didn't send<il n'a pas envoyé
did he send<il a envoyé
he's sending<il envoie
he is sending<il envoie
is he sending<il envoie
he has sent<il a envoyé
has he sent<il a envoyé
she sends<elle envoie
she doesn't send<elle n'envoie pas
does she send<elle envoie
she sent<elle a envoyé
she didn't send<elle n'a pas envoyé
did she send<elle a envoyé
she's sending<elle envoie
she is sending<elle envoie
is she sending<elle envoie
she has sent<elle a envoyé
has she sent<elle a envoyé
it sends<il envoie
it doesn't send<il n'envoie pas
does it send<il envoie
it sent<il a envoyé
it didn't send<il n'a pas envoyé
did it send<il a envoyé
it's sending<il envoie
it is sending<il envoie
is it sending<il envoie
it has sent<il a envoyé
has it sent<il a envoyé
j'envoie>i send
je n'envoie pas>i don't send
tu envoies>you send
tu n'envoies pas>you don't send
il envoie>he sends
il n'envoie pas>he doesn't send
elle envoie>she sends
elle n'envoie pas>she doesn't send
nous envoyons>we send
nous n'envoyons pas>we don't send
vous envoyez>you send
vous n'envoyez pas>you don't send
ils envoient>they send
ils n'envoient pas>they don't send
elles envoient>they send
elles n'envoient pas>they don't send
envoies tu>do you send
envoyez vous>do you send
est ce que tu envoies>do you send
est ce que vous envoyez>do you send
j'ai envoyé>i sent
tu as envoyé>you sent
il a envoyé>he sent
elle a envoyé>she sent
nous avons envoyé>we sent
vous avez envoyé>you sent
ils ont envoyé>they sent
elles ont envoyé>they sent
i call<j'appelle
i don't call<je n'appelle pas
do i call<j'appelle
i called<j'ai appelé
i didn't call<je n'ai pas appelé
did i call<j'ai appelé
i'm calling<j'appelle
i am calling<j'appelle
am i calling<j'appelle
i've called<j'ai appelé
i have called<j'ai appelé
have i called<j'ai appelé
you call<tu appelles
you don't call<tu n'appelles pas
do you call<tu appelles
you called<tu as appelé
you didn't call<tu n'as pas appelé
did you call<tu as appelé
you're calling<tu appelles
you are calling<tu appelles
are you calling<tu appelles
you've called<tu as appelé
you have called<tu as appelé
have you called<tu as appelé
we call<nous appelons
we don't call<nous n'appelons pas
do we call<nous appelons
we called<nous avons appelé
we didn't call<nous n'avons pas appelé
did we call<nous avons appelé
we're calling<nous appelons
we are calling<nous appelons
are we calling<nous appelons
we've called<nous avons appelé
we have called<nous avons appelé
have we called<nous avons appelé
they call<ils appellent
they don't call<ils n'appellent pas
do they call<ils appellent
they called<ils ont appelé
they didn't call<ils n'ont pas appelé
did they call<ils ont appelé
they're calling<ils appellent
they are calling<ils appellent
are they calling<ils appellent
they've called<ils ont appelé
they have called<ils ont appelé
have they called<ils ont appelé
he calls<il appelle
he doesn't call<il n'appelle pas
does he call<il appelle
he called<il a appelé
he didn't call<il n'a pas appelé
did he call<il a appelé
he's calling<il appelle
he is calling<il appelle
is he calling<il appelle
he has called<il a appelé
has he called<il a appelé
she calls<elle appelle
she doesn't call<elle n'appelle pas
does she call<elle appelle
she called<elle a appelé
she didn't call<elle n'a pas appelé
did she call<elle a appelé
she's calling<elle appelle
she is calling<elle appelle
is she calling<elle appelle
she has called<elle a appelé
has she called<elle a appelé
it calls<il appelle
it doesn't call<il n'appelle pas
does it call<il appelle
it called<il a appelé
it didn't call<il n'a pas appelé
did it call<il a appelé
it's calling<il appelle
it is calling<il appelle
is it calling<il appelle
it has called<il a appelé
has it called<il a appelé
j'appelle>i call
je n'appelle pas>i don't call
tu appelles>you call
tu n'appelles pas>you don't call
il appelle>he calls
il n'appelle pas>he doesn't call
elle appelle>she calls
elle n'appelle pas>she doesn't call
nous appelons>we call
nous n'appelons pas>we don't call
vous appelez>you call
vous n'appelez pas>you don't call
ils appellent>they call
ils n'appellent pas>they don't call
elles appellent>they call
elles n'appellent pas>they don't call
appelles tu>do you call
appelez vous>do you call
est ce que tu appelles>do you call
est ce que vous appelez>do you call
j'ai appelé>i called
tu as appelé>you called
il a appelé>he called
elle a appelé>she called
nous avons appelé>we called
vous avez appelé>you called
ils ont appelé>they called
elles ont appelé>they called
i pay<je paie
i don't pay<je ne paie pas
do i pay<je paie
i paid<j'ai payé
i didn't pay<je n'ai pas payé
did i pay<j'ai payé
i'm paying<je paie
i am paying<je paie
am i paying<je paie
i've paid<j'ai payé
i have paid<j'ai payé
have i paid<j'ai payé
you pay<tu paies
you don't pay<tu ne paies pas
do you pay<tu paies
you paid<tu as payé
you didn't pay<tu n'as pas payé
did you pay<tu as payé
you're paying<tu paies
you are paying<tu paies
are you paying<tu paies
you've paid<tu as payé
you have paid<tu as payé
have you paid<tu as payé
we pay<nous payons
we don't pay<nous ne payons pas
do we pay<nous payons
we paid<nous avons payé
we didn't pay<nous n'avons pas payé
did we pay<nous avons payé
we're paying<nous payons
we are paying<nous payons
are we paying<nous payons
we've paid<nous avons payé
we have paid<nous avons payé
have we paid<nous avons payé
they pay<ils paient
they don't pay<ils ne paient pas
do they pay<ils paient
they paid<ils ont payé
they didn't pay<ils n'ont pas payé
did they pay<ils ont payé
they're paying<ils paient
they are paying<ils paient
are they paying<ils paient
they've paid<ils ont payé
they have paid<ils ont payé
have they paid<ils ont payé
he pays<il paie
he doesn't pay<il ne paie pas
does he pay<il paie
he paid<il a payé
he didn't pay<il n'a pas payé
did he pay<il a payé
he's paying<il paie
he is paying<il paie
is he paying<il paie
he has paid<il a payé
has he paid<il a payé
she pays<elle paie
she doesn't pay<elle ne paie pas
does she pay<elle paie
she paid<elle a payé
she didn't pay<elle n'a pas payé
did she pay<elle a payé
she's paying<elle paie
she is paying<elle paie
is she paying<elle paie
she has paid<elle a payé
has she paid<elle a payé
it pays<il paie
it doesn't pay<il ne paie pas
does it pay<il paie
it paid<il a payé
it didn't pay<il n'a pas payé
did it pay<il a payé
it's paying<il paie
it is paying<il paie
is it paying<il paie
it has paid<il a payé
has it paid<il a payé
je paie>i pay
je ne paie pas>i don't pay
tu paies>you pay
tu ne paies pas>you don't pay
il paie>he pays
il ne paie pas>he doesn't pay
elle paie>she pays
elle ne paie pas>she doesn't pay
nous payons>we pay
nous ne payons pas>we don't pay
vous payez>you pay
vous ne payez pas>you don't pay
ils paient>they pay
ils ne paient pas>they don't pay
elles paient>they pay
elles ne paient pas>they don't pay
paies tu>do you pay
payez vous>do you pay
est ce que tu paies>do you pay
est ce que vous payez>do you pay
j'ai payé>i paid
tu as payé>you paid
il a payé>he paid
elle a payé>she paid
nous avons payé>we paid
vous avez payé>you paid
ils ont payé>they paid
elles ont payé>they paid
i talk<je parle
i don't talk<je ne parle pas
do i talk<je parle
i talked<j'ai parlé
i didn't talk<je n'ai pas parlé
did i talk<j'ai parlé
i'm talking<je parle
i am talking<je parle
am i talking<je parle
i've talked<j'ai parlé
i have talked<j'ai parlé
have i talked<j'ai parlé
you talk<tu parles
you don't talk<tu ne parles pas
do you talk<tu parles
you talked<tu as parlé
you didn't talk<tu n'as pas parlé
did you talk<tu as parlé
you're talking<tu parles
you are talking<tu parles
are you talking<tu parles
you've talked<tu as parlé
you have talked<tu as parlé
have you talked<tu as parlé
we talk<nous parlons
we don't talk<nous ne parlons pas
do we talk<nous parlons
we talked<nous avons parlé
we didn't talk<nous n'avons pas parlé
did we talk<nous avons parlé
we're talking<nous parlons
we are talking<nous parlons
are we talking<nous parlons
we've talked<nous avons parlé
we have talked<nous avons parlé
have we talked<nous avons parlé
they talk<ils parlent
they don't talk<ils ne parlent pas
do they talk<ils parlent
they talked<ils ont parlé
they didn't talk<ils n'ont pas parlé
did they talk<ils ont parlé
they're talking<ils parlent
they are talking<ils parlent
are they talking<ils parlent
they've talked<ils ont parlé
they have talked<ils ont parlé
have they talked<ils ont parlé
he talks<il parle
he doesn't talk<il ne parle pas
does he talk<il parle
he talked<il a parlé
he didn't talk<il n'a pas parlé
did he talk<il a parlé
he's talking<il parle
he is talking<il parle
is he talking<il parle
he has talked<il a parlé
has he talked<il a parlé
she talks<elle parle
she doesn't talk<elle ne parle pas
does she talk<elle parle
she talked<elle a parlé
she didn't talk<elle n'a pas parlé
did she talk<elle a parlé
she's talking<elle parle
she is talking<elle parle
is she talking<elle parle
she has talked<elle a parlé
has she talked<elle a parlé
it talks<il parle
it doesn't talk<il ne parle pas
does it talk<il parle
it talked<il a parlé
it didn't talk<il n'a pas parlé
did it talk<il a parlé
it's talking<il parle
it is talking<il parle
is it talking<il parle
it has talked<il a parlé
has it talked<il a parlé
je parle>i talk
je ne parle pas>i don't talk
tu parles>you talk
tu ne parles pas>you don't talk
il parle>he talks
il ne parle pas>he doesn't talk
elle parle>she talks
elle ne parle pas>she doesn't talk
nous parlons>we talk
nous ne parlons pas>we don't talk
vous parlez>you talk
vous ne parlez pas>you don't talk
ils parlent>they talk
ils ne parlent pas>they don't talk
elles parlent>they talk
elles ne parlent pas>they don't talk
parles tu>do you talk
parlez vous>do you talk
est ce que tu parles>do you talk
est ce que vous parlez>do you talk
j'ai parlé>i talked
tu as parlé>you talked
il a parlé>he talked
elle a parlé>she talked
nous avons parlé>we talked
vous avez parlé>you talked
ils ont parlé>they talked
elles ont parlé>they talked
i speak<je parle
i don't speak<je ne parle pas
do i speak<je parle
i spoke<j'ai parlé
i didn't speak<je n'ai pas parlé
did i speak<j'ai parlé
i'm speaking<je parle
i am speaking<je parle
am i speaking<je parle
i've spoken<j'ai parlé
i have spoken<j'ai parlé
have i spoken<j'ai parlé
you speak<tu parles
you don't speak<tu ne parles pas
do you speak<tu parles
you spoke<tu as parlé
you didn't speak<tu n'as pas parlé
did you speak<tu as parlé
you're speaking<tu parles
you are speaking<tu parles
are you speaking<tu parles
you've spoken<tu as parlé
you have spoken<tu as parlé
have you spoken<tu as parlé
we speak<nous parlons
we don't speak<nous ne parlons pas
do we speak<nous parlons
we spoke<nous avons parlé
we didn't speak<nous n'avons pas parlé
did we speak<nous avons parlé
we're speaking<nous parlons
we are speaking<nous parlons
are we speaking<nous parlons
we've spoken<nous avons parlé
we have spoken<nous avons parlé
have we spoken<nous avons parlé
they speak<ils parlent
they don't speak<ils ne parlent pas
do they speak<ils parlent
they spoke<ils ont parlé
they didn't speak<ils n'ont pas parlé
did they speak<ils ont parlé
they're speaking<ils parlent
they are speaking<ils parlent
are they speaking<ils parlent
they've spoken<ils ont parlé
they have spoken<ils ont parlé
have they spoken<ils ont parlé
he speaks<il parle
he doesn't speak<il ne parle pas
does he speak<il parle
he spoke<il a parlé
he didn't speak<il n'a pas parlé
did he speak<il a parlé
he's speaking<il parle
he is speaking<il parle
is he speaking<il parle
he has spoken<il a parlé
has he spoken<il a parlé
she speaks<elle parle
she doesn't speak<elle ne parle pas
does she speak<elle parle
she spoke<elle a parlé
she didn't speak<elle n'a pas parlé
did she speak<elle a parlé
she's speaking<elle parle
she is speaking<elle parle
is she speaking<elle parle
she has spoken<elle a parlé
has she spoken<elle a parlé
it speaks<il parle
it doesn't speak<il ne parle pas
does it speak<il parle
it spoke<il a parlé
it didn't speak<il n'a pas parlé
did it speak<il a parlé
it's speaking<il parle
it is speaking<il parle
is it speaking<il parle
it has spoken<il a parlé
has it spoken<il a parlé
i understand<je comprends
i don't understand<je ne comprends pas
i understand that<je comprends que
do i understand<je comprends
i understood<j'ai compris
i didn't understand<je n'ai pas compris
did i understand<j'ai compris
i'm understanding<je comprends
i am understanding<je comprends
am i understanding<je comprends
i've understood<j'ai compris
i have understood<j'ai compris
have i understood<j'ai compris
you understand<tu comprends
you don't understand<tu ne comprends pas
you understand that<tu comprends que
do you understand<tu comprends
you understood<tu as compris
you didn't understand<tu n'as pas compris
did you understand<tu as compris
you're understanding<tu comprends
you are understanding<tu comprends
are you understanding<tu comprends
you've understood<tu as compris
you have understood<tu as compris
have you understood<tu as compris
we understand<nous comprenons
we don't understand<nous ne comprenons pas
we understand that<nous comprenons que
do we understand<nous comprenons
we understood<nous avons compris
we didn't understand<nous n'avons pas compris
did we understand<nous avons compris
we're understanding<nous comprenons
we are understanding<nous comprenons
are we understanding<nous comprenons
we've understood<nous avons compris
we have understood<nous avons compris
have we understood<nous avons compris
they understand<ils comprennent
they don't understand<ils ne comprennent pas
they understand that<ils comprennent que
do they understand<ils comprennent
they understood<ils ont compris
they didn't understand<ils n'ont pas compris
did they understand<ils ont compris
they're understanding<ils comprennent
they are understanding<ils comprennent
are they understanding<ils comprennent
they've understood<ils ont compris
they have understood<ils ont compris
have they understood<ils ont compris
he understands<il comprend
he doesn't understand<il ne comprend pas
he understands that<il comprend que
does he understand<il comprend
he understood<il a compris
he didn't understand<il n'a pas compris
did he understand<il a compris
he's understanding<il comprend
he is understanding<il comprend
is he understanding<il comprend
he has understood<il a compris
has he understood<il a compris
she understands<elle comprend
she doesn't understand<elle ne comprend pas
she understands that<elle comprend que
does she understand<elle comprend
she understood<elle a compris
she didn't understand<elle n'a pas compris
did she understand<elle a compris
she's understanding<elle comprend
she is understanding<elle comprend
is she understanding<elle comprend
she has understood<elle a compris
has she understood<elle a compris
it understands<il comprend
it doesn't understand<il ne comprend pas
it understands that<il comprend que
does it understand<il comprend
it understood<il a compris
it didn't understand<il n'a pas compris
did it understand<il a compris
it's understanding<il comprend
it is understanding<il comprend
is it understanding<il comprend
it has understood<il a compris
has it understood<il a compris
je comprends>i understand
je ne comprends pas>i don't understand
tu comprends>you understand
tu ne comprends pas>you don't understand
il comprend>he understands
il ne comprend pas>he doesn't understand
elle comprend>she understands
elle ne comprend pas>she doesn't understand
nous comprenons>we understand
nous ne comprenons pas>we don't understand
vous comprenez>you understand
vous ne comprenez pas>you don't understand
ils comprennent>they understand
ils ne comprennent pas>they don't understand
elles comprennent>they understand
elles ne comprennent pas>they don't understand
comprends tu>do you understand
comprenez vous>do you understand
est ce que tu comprends>do you understand
est ce que vous comprenez>do you understand
j'ai compris>i understood
tu as compris>you understood
il a compris>he understood
elle a compris>she understood
nous avons compris>we understood
vous avez compris>you understood
ils ont compris>they understood
elles ont compris>they understood
i forget<j'oublie
i don't forget<je n'oublie pas
i forget to<j'oublie de
i don't forget to<je n'oublie pas de
do i forget<j'oublie
i forgot<j'ai oublié
i didn't forget<je n'ai pas oublié
did i forget<j'ai oublié
i'm forgetting<j'oublie
i am forgetting<j'oublie
am i forgetting<j'oublie
i've forgotten<j'ai oublié
i have forgotten<j'ai oublié
have i forgotten<j'ai oublié
you forget<tu oublies
you don't forget<tu n'oublies pas
you forget to<tu oublies de
you don't forget to<tu n'oublies pas de
do you forget<tu oublies
you forgot<tu as oublié
you didn't forget<tu n'as pas oublié
did you forget<tu as oublié
you're forgetting<tu oublies
you are forgetting<tu oublies
are you forgetting<tu oublies
you've forgotten<tu as oublié
you have forgotten<tu as oublié
have you forgotten<tu as oublié
we forget<nous oublions
we don't forget<nous n'oublions pas
we forget to<nous oublions de
we don't forget to<nous n'oublions pas de
do we forget<nous oublions
we forgot<nous avons oublié
we didn't forget<nous n'avons pas oublié
did we forget<nous avons oublié
we're forgetting<nous oublions
we are forgetting<nous oublions
are we forgetting<nous oublions
we've forgotten<nous avons oublié
we have forgotten<nous avons oublié
have we forgotten<nous avons oublié
they forget<ils oublient
they don't forget<ils n'oublient pas
they forget to<ils oublient de
they don't forget to<ils n'oublient pas de
do they forget<ils oublient
they forgot<ils ont oublié
they didn't forget<ils n'ont pas oublié
did they forget<ils ont oublié
they're forgetting<ils oublient
they are forgetting<ils oublient
are they forgetting<ils oublient
they've forgotten<ils ont oublié
they have forgotten<ils ont oublié
have they forgotten<ils ont oublié
he forgets<il oublie
he doesn't forget<il n'oublie pas
he forgets to<il oublie de
he doesn't forget to<il n'oublie pas de
does he forget<il oublie
he forgot<il a oublié
he didn't forget<il n'a pas oublié
did he forget<il a oublié
he's forgetting<il oublie
he is forgetting<il oublie
is he forgetting<il oublie
he has forgotten<il a oublié
has he forgotten<il a oublié
she forgets<elle oublie
she doesn't forget<elle n'oublie pas
she forgets to<elle oublie de
she doesn't forget to<elle n'oublie pas de
does she forget<elle oublie
she forgot<elle a oublié
she didn't forget<elle n'a pas oublié
did she forget<elle a oublié
she's forgetting<elle oublie
she is forgetting<elle oublie
is she forgetting<elle oublie
she has forgotten<elle a oublié
has she forgotten<elle a oublié
it forgets<il oublie
it doesn't forget<il n'oublie pas
it forgets to<il oublie de
it doesn't forget to<il n'oublie pas de
does it forget<il oublie
it forgot<il a oublié
it didn't forget<il n'a pas oublié
did it forget<il a oublié
it's forgetting<il oublie
it is forgetting<il oublie
is it forgetting<il oublie
it has forgotten<il a oublié
has it forgotten<il a oublié
j'oublie>i forget
je n'oublie pas>i don't forget
tu oublies>you forget
tu n'oublies pas>you don't forget
il oublie>he forgets
il n'oublie pas>he doesn't forget
elle oublie>she forgets
elle n'oublie pas>she doesn't forget
nous oublions>we forget
nous n'oublions pas>we don't forget
vous oubliez>you forget
vous n'oubliez pas>you don't forget
ils oublient>they forget
ils n'oublient pas>they don't forget
elles oublient>they forget
elles n'oublient pas>they don't forget
oublies tu>do you forget
oubliez vous>do you forget
est ce que tu oublies>do you forget
est ce que vous oubliez>do you forget
j'ai oublié>i forgot
tu as oublié>you forgot
il a oublié>he forgot
elle a oublié>she forgot
nous avons oublié>we forgot
vous avez oublié>you forgot
ils ont oublié>they forgot
elles ont oublié>they forgot
i believe<je crois
i don't believe<je ne crois pas
i believe that<je crois que
do i believe<je crois
i believed<j'ai cru
i didn't believe<je n'ai pas cru
did i believe<j'ai cru
i'm believing<je crois
i am believing<je crois
am i believing<je crois
i've believed<j'ai cru
i have believed<j'ai cru
have i believed<j'ai cru
you believe<tu crois
you don't believe<tu ne crois pas
you believe that<tu crois que
do you believe<tu crois
you believed<tu as cru
you didn't believe<tu n'as pas cru
did you believe<tu as cru
you're believing<tu crois
you are believing<tu crois
are you believing<tu crois
you've believed<tu as cru
you have believed<tu as cru
have you believed<tu as cru
we believe<nous croyons
we don't believe<nous ne croyons pas
we believe that<nous croyons que
do we believe<nous croyons
we believed<nous avons cru
we didn't believe<nous n'avons pas cru
did we believe<nous avons cru
we're believing<nous croyons
we are believing<nous croyons
are we believing<nous croyons
we've believed<nous avons cru
we have believed<nous avons cru
have we believed<nous avons cru
they believe<ils croient
they don't believe<ils ne croient pas
they believe that<ils croient que
do they believe<ils croient
they believed<ils ont cru
they didn't believe<ils n'ont pas cru
did they believe<ils ont cru
they're believing<ils croient
they are believing<ils croient
are they believing<ils croient
they've believed<ils ont cru
they have believed<ils ont cru
have they believed<ils ont cru
he believes<il croit
he doesn't believe<il ne croit pas
he believes that<il croit que
does he believe<il croit
he believed<il a cru
he didn't believe<il n'a pas cru
did he believe<il a cru
he's believing<il croit
he is believing<il croit
is he believing<il croit
he has believed<il a cru
has he believed<il a cru
she believes<elle croit
she doesn't believe<elle ne croit pas
she believes that<elle croit que
does she believe<elle croit
she believed<elle a cru
she didn't believe<elle n'a pas cru
did she believe<elle a cru
she's believing<elle croit
she is believing<elle croit
is she believing<elle croit
she has believed<elle a cru
has she believed<elle a cru
it believes<il croit
it doesn't believe<il ne croit pas
it believes that<il croit que
does it believe<il croit
it believed<il a cru
it didn't believe<il n'a pas cru
did it believe<il a cru
it's believing<il croit
it is believing<il croit
is it believing<il croit
it has believed<il a cru
has it believed<il a cru
je crois>i believe
je ne crois pas>i don't believe
tu crois>you believe
tu ne crois pas>you don't believe
il croit>he believes
il ne croit pas>he doesn't believe
elle croit>she believes
elle ne croit pas>she doesn't believe
nous croyons>we believe
nous ne croyons pas>we don't believe
vous croyez>you believe
vous ne croyez pas>you don't believe
ils croient>they believe
ils ne croient pas>they don't believe
elles croient>they believe
elles ne croient pas>they don't believe
crois tu>do you believe
croyez vous>do you believe
est ce que tu crois>do you believe
est ce que vous croyez>do you believe
j'ai cru>i believed
tu as cru>you believed
il a cru>he believed
elle a cru>she believed
nous avons cru>we believed
vous avez cru>you believed
ils ont cru>they believed
elles ont cru>they believed
i hope<j'espère
i don't hope<je n'espère pas
i hope to<j'espère
i don't hope to<je n'espère pas
i hope that<j'espère que
do i hope<j'espère
i hoped<j'ai espéré
i didn't hope<je n'ai pas espéré
did i hope<j'ai espéré
i'm hoping<j'espère
i am hoping<j'espère
am i hoping<j'espère
i've hoped<j'ai espéré
i have hoped<j'ai espéré
have i hoped<j'ai espéré
you hope<tu espères
you don't hope<tu n'espères pas
you hope to<tu espères
you don't hope to<tu n'espères pas
you hope that<tu espères que
do you hope<tu espères
you hoped<tu as espéré
you didn't hope<tu n'as pas espéré
did you hope<tu as espéré
you're hoping<tu espères
you are hoping<tu espères
are you hoping<tu espères
you've hoped<tu as espéré
you have hoped<tu as espéré
have you hoped<tu as espéré
we hope<nous espérons
we don't hope<nous n'espérons pas
we hope to<nous espérons
we don't hope to<nous n'espérons pas
we hope that<nous espérons que
do we hope<nous espérons
we hoped<nous avons espéré
we didn't hope<nous n'avons pas espéré
did we hope<nous avons espéré
we're hoping<nous espérons
we are hoping<nous espérons
are we hoping<nous espérons
we've hoped<nous avons espéré
we have hoped<nous avons espéré
have we hoped<nous avons espéré
they hope<ils espèrent
they don't hope<ils n'espèrent pas
they hope to<ils espèrent
they don't hope to<ils n'espèrent pas
they hope that<ils espèrent que
do they hope<ils espèrent
they hoped<ils ont espéré
they didn't hope<ils n'ont pas espéré
did they hope<ils ont espéré
they're hoping<ils espèrent
they are hoping<ils espèrent
are they hoping<ils espèrent
they've hoped<ils ont espéré
they have hoped<ils ont espéré
have they hoped<ils ont espéré
he hopes<il espère
he doesn't hope<il n'espère pas
he hopes to<il espère
he doesn't hope to<il n'espère pas
he hopes that<il espère que
does he hope<il espère
he hoped<il a espéré
he didn't hope<il n'a pas espéré
did he hope<il a espéré
he's hoping<il espère
he is hoping<il espère
is he hoping<il espère
he has hoped<il a espéré
has he hoped<il a espéré
she hopes<elle espère
she doesn't hope<elle n'espère pas
she hopes to<elle espère
she doesn't hope to<elle n'espère pas
she hopes that<elle espère que
does she hope<elle espère
she hoped<elle a espéré
she didn't hope<elle n'a pas espéré
did she hope<elle a espéré
she's hoping<elle espère
she is hoping<elle espère
is she hoping<elle espère
she has hoped<elle a espéré
has she hoped<elle a espéré
it hopes<il espère
it doesn't hope<il n'espère pas
it hopes to<il espère
it doesn't hope to<il n'espère pas
it hopes that<il espère que
does it hope<il espère
it hoped<il a espéré
it didn't hope<il n'a pas espéré
did it hope<il a espéré
it's hoping<il espère
it is hoping<il espère
is it hoping<il espère
it has hoped<il a espéré
has it hoped<il a espéré
j'espère>i hope
je n'espère pas>i don't hope
tu espères>you hope
tu n'espères pas>you don't hope
il espère>he hopes
il n'espère pas>he doesn't hope
elle espère>she hopes
elle n'espère pas>she doesn't hope
nous espérons>we hope
nous n'espérons pas>we don't hope
vous espérez>you hope
vous n'espérez pas>you don't hope
ils espèrent>they hope
ils n'espèrent pas>they don't hope
elles espèrent>they hope
elles n'espèrent pas>they don't hope
espères tu>do you hope
espérez vous>do you hope
est ce que tu espères>do you hope
est ce que vous espérez>do you hope
j'ai espéré>i hoped
tu as espéré>you hoped
il a espéré>he hoped
elle a espéré>she hoped
nous avons espéré>we hoped
vous avez espéré>you hoped
ils ont espéré>they hoped
elles ont espéré>they hoped
i wish<je souhaite
i don't wish<je ne souhaite pas
i wish to<je souhaite
i don't wish to<je ne souhaite pas
do i wish<je souhaite
i wished<j'ai souhaité
i didn't wish<je n'ai pas souhaité
did i wish<j'ai souhaité
i'm wishing<je souhaite
i am wishing<je souhaite
am i wishing<je souhaite
i've wished<j'ai souhaité
i have wished<j'ai souhaité
have i wished<j'ai souhaité
you wish<tu souhaites
you don't wish<tu ne souhaites pas
you wish to<tu souhaites
you don't wish to<tu ne souhaites pas
do you wish<tu souhaites
you wished<tu as souhaité
you didn't wish<tu n'as pas souhaité
did you wish<tu as souhaité
you're wishing<tu souhaites
you are wishing<tu souhaites
are you wishing<tu souhaites
you've wished<tu as souhaité
you have wished<tu as souhaité
have you wished<tu as souhaité
we wish<nous souhaitons
we don't wish<nous ne souhaitons pas
we wish to<nous souhaitons
we don't wish to<nous ne souhaitons pas
do we wish<nous souhaitons
we wished<nous avons souhaité
we didn't wish<nous n'avons pas souhaité
did we wish<nous avons souhaité
we're wishing<nous souhaitons
we are wishing<nous souhaitons
are we wishing<nous souhaitons
we've wished<nous avons souhaité
we have wished<nous avons souhaité
have we wished<nous avons souhaité
they wish<ils souhaitent
they don't wish<ils ne souhaitent pas
they wish to<ils souhaitent
they don't wish to<ils ne souhaitent pas
do they wish<ils souhaitent
they wished<ils ont souhaité
they didn't wish<ils n'ont pas souhaité
did they wish<ils ont souhaité
they're wishing<ils souhaitent
they are wishing<ils souhaitent
are they wishing<ils souhaitent
they've wished<ils ont souhaité
they have wished<ils ont souhaité
have they wished<ils ont souhaité
he wishes<il souhaite
he doesn't wish<il ne souhaite pas
he wishes to<il souhaite
he doesn't wish to<il ne souhaite pas
does he wish<il souhaite
he wished<il a souhaité
he didn't wish<il n'a pas souhaité
did he wish<il a souhaité
he's wishing<il souhaite
he is wishing<il souhaite
is he wishing<il souhaite
he has wished<il a souhaité
has he wished<il a souhaité
she wishes<elle souhaite
she doesn't wish<elle ne souhaite pas
she wishes to<elle souhaite
she doesn't wish to<elle ne souhaite pas
does she wish<elle souhaite
she wished<elle a souhaité
she didn't wish<elle n'a pas souhaité
did she wish<elle a souhaité
she's wishing<elle souhaite
she is wishing<elle souhaite
is she wishing<elle souhaite
she has wished<elle a souhaité
has she wished<elle a souhaité
it wishes<il souhaite
it doesn't wish<il ne souhaite pas
it wishes to<il souhaite
it doesn't wish to<il ne souhaite pas
does it wish<il souhaite
it wished<il a souhaité
it didn't wish<il n'a pas souhaité
did it wish<il a souhaité
it's wishing<il souhaite
it is wishing<il souhaite
is it wishing<il souhaite
it has wished<il a souhaité
has it wished<il a souhaité
je souhaite>i wish
je ne souhaite pas>i don't wish
tu souhaites>you wish
tu ne souhaites pas>you don't wish
il souhaite>he wishes
il ne souhaite pas>he doesn't wish
elle souhaite>she wishes
elle ne souhaite pas>she doesn't wish
nous souhaitons>we wish
nous ne souhaitons pas>we don't wish
vous souhaitez>you wish
vous ne souhaitez pas>you don't wish
ils souhaitent>they wish
ils ne souhaitent pas>they don't wish
elles souhaitent>they wish
elles ne souhaitent pas>they don't wish
souhaites tu>do you wish
souhaitez vous>do you wish
est ce que tu souhaites>do you wish
est ce que vous souhaitez>do you wish
j'ai souhaité>i wished
tu as souhaité>you wished
il a souhaité>he wished
elle a souhaité>she wished
nous avons souhaité>we wished
vous avez souhaité>you wished
ils ont souhaité>they wished
elles ont souhaité>they wished
i mean<je veux dire
i don't mean<je ne veux pas dire
do i mean<je veux dire
i meant<j'ai voulu dire
i didn't mean<je n'ai pas voulu dire
did i mean<j'ai voulu dire
i'm meaning<je veux dire
i am meaning<je veux dire
am i meaning<je veux dire
i've meant<j'ai voulu dire
i have meant<j'ai voulu dire
have i meant<j'ai voulu dire
you mean<tu veux dire
you don't mean<tu ne veux pas dire
do you mean<tu veux dire
you meant<tu as voulu dire
you didn't mean<tu n'as pas voulu dire
did you mean<tu as voulu dire
you're meaning<tu veux dire
you are meaning<tu veux dire
are you meaning<tu veux dire
you've meant<tu as voulu dire
you have meant<tu as voulu dire
have you meant<tu as voulu dire
we mean<nous voulons dire
we don't mean<nous ne voulons pas dire
do we mean<nous voulons dire
we meant<nous avons voulu dire
we didn't mean<nous n'avons pas voulu dire
did we mean<nous avons voulu dire
we're meaning<nous voulons dire
we are meaning<nous voulons dire
are we meaning<nous voulons dire
we've meant<nous avons voulu dire
we have meant<nous avons voulu dire
have we meant<nous avons voulu dire
they mean<ils veulent dire
they don't mean<ils ne veulent pas dire
do they mean<ils veulent dire
they meant<ils ont voulu dire
they didn't mean<ils n'ont pas voulu dire
did they mean<ils ont voulu dire
they're meaning<ils veulent dire
they are meaning<ils veulent dire
are they meaning<ils veulent dire
they've meant<ils ont voulu dire
they have meant<ils ont voulu dire
have they meant<ils ont voulu dire
he means<il veut dire
he doesn't mean<il ne veut pas dire
does he mean<il veut dire
he meant<il a voulu dire
he didn't mean<il n'a pas voulu dire
did he mean<il a voulu dire
he's meaning<il veut dire
he is meaning<il veut dire
is he meaning<il veut dire
he has meant<il a voulu dire
has he meant<il a voulu dire
she means<elle veut dire
she doesn't mean<elle ne veut pas dire
does she mean<elle veut dire
she meant<elle a voulu dire
she didn't mean<elle n'a pas voulu dire
did she mean<elle a voulu dire
she's meaning<elle veut dire
she is meaning<elle veut dire
is she meaning<elle veut dire
she has meant<elle a voulu dire
has she meant<elle a voulu dire
it means<il veut dire
it doesn't mean<il ne veut pas dire
does it mean<il veut dire
it meant<il a voulu dire
it didn't mean<il n'a pas voulu dire
did it mean<il a voulu dire
it's meaning<il veut dire
it is meaning<il veut dire
is it meaning<il veut dire
it has meant<il a voulu dire
has it meant<il a voulu dire
je veux dire>i mean
je ne veux pas dire>i don't mean
tu veux dire>you mean
tu ne veux pas dire>you don't mean
il veut dire>he means
il ne veut pas dire>he doesn't mean
elle veut dire>she means
elle ne veut pas dire>she doesn't mean
nous voulons dire>we mean
nous ne voulons pas dire>we don't mean
vous voulez dire>you mean
vous ne voulez pas dire>you don't mean
ils veulent dire>they mean
ils ne veulent pas dire>they don't mean
elles veulent dire>they mean
elles ne veulent pas dire>they don't mean
veux dire tu>do you mean
voulez dire vous>do you mean
est ce que tu veux dire>do you mean
est ce que vous voulez dire>do you mean
j'ai voulu dire>i meant
tu as voulu dire>you meant
il a voulu dire>he meant
elle a voulu dire>she meant
nous avons voulu dire>we meant
vous avez voulu dire>you meant
ils ont voulu dire>they meant
elles ont voulu dire>they meant
i feel<je sens
i don't feel<je ne sens pas
i feel that<je sens que
do i feel<je sens
i felt<j'ai senti
i didn't feel<je n'ai pas senti
did i feel<j'ai senti
i'm feeling<je sens
i am feeling<je sens
am i feeling<je sens
i've felt<j'ai senti
i have felt<j'ai senti
have i felt<j'ai senti
you feel<tu sens
you don't feel<tu ne sens pas
you feel that<tu sens que
do you feel<tu sens
you felt<tu as senti
you didn't feel<tu n'as pas senti
did you feel<tu as senti
you're feeling<tu sens
you are feeling<tu sens
are you feeling<tu sens
you've felt<tu as senti
you have felt<tu as senti
have you felt<tu as senti
we feel<nous sentons
we don't feel<nous ne sentons pas
we feel that<nous sentons que
do we feel<nous sentons
we felt<nous avons senti
we didn't feel<nous n'avons pas senti
did we feel<nous avons senti
we're feeling<nous sentons
we are feeling<nous sentons
are we feeling<nous sentons
we've felt<nous avons senti
we have felt<nous avons senti
have we felt<nous avons senti
they feel<ils sentent
they don't feel<ils ne sentent pas
they feel that<ils sentent que
do they feel<ils sentent
they felt<ils ont senti
they didn't feel<ils n'ont pas senti
did they feel<ils ont senti
they're feeling<ils sentent
they are feeling<ils sentent
are they feeling<ils sentent
they've felt<ils ont senti
they have felt<ils ont senti
have they felt<ils ont senti
he feels<il sent
he doesn't feel<il ne sent pas
he feels that<il sent que
does he feel<il sent
he felt<il a senti
he didn't feel<il n'a pas senti
did he feel<il a senti
he's feeling<il sent
he is feeling<il sent
is he feeling<il sent
he has felt<il a senti
has he felt<il a senti
she feels<elle sent
she doesn't feel<elle ne sent pas
she feels that<elle sent que
does she feel<elle sent
she felt<elle a senti
she didn't feel<elle n'a pas senti
did she feel<elle a senti
she's feeling<elle sent
she is feeling<elle sent
is she feeling<elle sent
she has felt<elle a senti
has she felt<elle a senti
it feels<il sent
it doesn't feel<il ne sent pas
it feels that<il sent que
does it feel<il sent
it felt<il a senti
it didn't feel<il n'a pas senti
did it feel<il a senti
it's feeling<il sent
it is feeling<il sent
is it feeling<il sent
it has felt<il a senti
has it felt<il a senti
je sens>i feel
je ne sens pas>i don't feel
tu sens>you feel
tu ne sens pas>you don't feel
il sent>he feels
il ne sent pas>he doesn't feel
elle sent>she feels
elle ne sent pas>she doesn't feel
nous sentons>we feel
nous ne sentons pas>we don't feel
vous sentez>you feel
vous ne sentez pas>you don't feel
ils sentent>they feel
ils ne sentent pas>they don't feel
elles sentent>they feel
elles ne sentent pas>they don't feel
sens tu>do you feel
sentez vous>do you feel
est ce que tu sens>do you feel
est ce que vous sentez>do you feel
j'ai senti>i felt
tu as senti>you felt
il a senti>he felt
elle a senti>she felt
nous avons senti>we felt
vous avez senti>you felt
ils ont senti>they felt
elles ont senti>they felt
i hear<j'entends
i don't hear<je n'entends pas
do i hear<j'entends
i heard<j'ai entendu
i didn't hear<je n'ai pas entendu
did i hear<j'ai entendu
i'm hearing<j'entends
i am hearing<j'entends
am i hearing<j'entends
i've heard<j'ai entendu
i have heard<j'ai entendu
have i heard<j'ai entendu
you hear<tu entends
you don't hear<tu n'entends pas
do you hear<tu entends
you heard<tu as entendu
you didn't hear<tu n'as pas entendu
did you hear<tu as entendu
you're hearing<tu entends
you are hearing<tu entends
are you hearing<tu entends
you've heard<tu as entendu
you have heard<tu as entendu
have you heard<tu as entendu
we hear<nous entendons
we don't hear<nous n'entendons pas
do we hear<nous entendons
we heard<nous avons entendu
we didn't hear<nous n'avons pas entendu
did we hear<nous avons entendu
we're hearing<nous entendons
we are hearing<nous entendons
are we hearing<nous entendons
we've heard<nous avons entendu
we have heard<nous avons entendu
have we heard<nous avons entendu
they hear<ils entendent
they don't hear<ils n'entendent pas
do they hear<ils entendent
they heard<ils ont entendu
they didn't hear<ils n'ont pas entendu
did they hear<ils ont entendu
they're hearing<ils entendent
they are hearing<ils entendent
are they hearing<ils entendent
they've heard<ils ont entendu
they have heard<ils ont entendu
have they heard<ils ont entendu
he hears<il entend
he doesn't hear<il n'entend pas
does he hear<il entend
he heard<il a entendu
he didn't hear<il n'a pas entendu
did he hear<il a entendu
he's hearing<il entend
he is hearing<il entend
is he hearing<il entend
he has heard<il a entendu
has he heard<il a entendu
she hears<elle entend
she doesn't hear<elle n'entend pas
does she hear<elle entend
she heard<elle a entendu
she didn't hear<elle n'a pas entendu
did she hear<elle a entendu
she's hearing<elle entend
she is hearing<elle entend
is she hearing<elle entend
she has heard<elle a entendu
has she heard<elle a entendu
it hears<il entend
it doesn't hear<il n'entend pas
does it hear<il entend
it heard<il a entendu
it didn't hear<il n'a pas entendu
did it hear<il a entendu
it's hearing<il entend
it is hearing<il entend
is it hearing<il entend
it has heard<il a entendu
has it heard<il a entendu
j'entends>i hear
je n'entends pas>i don't hear
tu entends>you hear
tu n'entends pas>you don't hear
il entend>he hears
il n'entend pas>he doesn't hear
elle entend>she hears
elle n'entend pas>she doesn't hear
nous entendons>we hear
nous n'entendons pas>we don't hear
vous entendez>you hear
vous n'entendez pas>you don't hear
ils entendent>they hear
ils n'entendent pas>they don't hear
elles entendent>they hear
elles n'entendent pas>they don't hear
entends tu>do you hear
entendez vous>do you hear
est ce que tu entends>do you hear
est ce que vous entendez>do you hear
j'ai entendu>i heard
tu as entendu>you heard
il a entendu>he heard
elle a entendu>she heard
nous avons entendu>we heard
vous avez entendu>you heard
ils ont entendu>they heard
elles ont entendu>they heard
i learn<j'apprends
i don't learn<je n'apprends pas
do i learn<j'apprends
i learned<j'ai appris
i didn't learn<je n'ai pas appris
did i learn<j'ai appris
i'm learning<j'apprends
i am learning<j'apprends
am i learning<j'apprends
i've learned<j'ai appris
i have learned<j'ai appris
have i learned<j'ai appris
you learn<tu apprends
you don't learn<tu n'apprends pas
do you learn<tu apprends
you learned<tu as appris
you didn't learn<tu n'as pas appris
did you learn<tu as appris
you're learning<tu apprends
you are learning<tu apprends
are you learning<tu apprends
you've learned<tu as appris
you have learned<tu as appris
have you learned<tu as appris
we learn<nous apprenons
we don't learn<nous n'apprenons pas
do we learn<nous apprenons
we learned<nous avons appris
we didn't learn<nous n'avons pas appris
did we learn<nous avons appris
we're learning<nous apprenons
we are learning<nous apprenons
are we learning<nous apprenons
we've learned<nous avons appris
we have learned<nous avons appris
have we learned<nous avons appris
they learn<ils apprennent
they don't learn<ils n'apprennent pas
do they learn<ils apprennent
they learned<ils ont appris
they didn't learn<ils n'ont pas appris
did they learn<ils ont appris
they're learning<ils apprennent
they are learning<ils apprennent
are they learning<ils apprennent
they've learned<ils ont appris
they have learned<ils ont appris
have they learned<ils ont appris
he learns<il apprend
he doesn't learn<il n'apprend pas
does he learn<il apprend
he learned<il a appris
he didn't learn<il n'a pas appris
did he learn<il a appris
he's learning<il apprend
he is learning<il apprend
is he learning<il apprend
he has learned<il a appris
has he learned<il a appris
she learns<elle apprend
she doesn't learn<elle n'apprend pas
does she learn<elle apprend
she learned<elle a appris
she didn't learn<elle n'a pas appris
did she learn<elle a appris
she's learning<elle apprend
she is learning<elle apprend
is she learning<elle apprend
she has learned<elle a appris
has she learned<elle a appris
it learns<il apprend
it doesn't learn<il n'apprend pas
does it learn<il apprend
it learned<il a appris
it didn't learn<il n'a pas appris
did it learn<il a appris
it's learning<il apprend
it is learning<il apprend
is it learning<il apprend
it has learned<il a appris
has it learned<il a appris
j'apprends>i learn
je n'apprends pas>i don't learn
tu apprends>you learn
tu n'apprends pas>you don't learn
il apprend>he learns
il n'apprend pas>he doesn't learn
elle apprend>she learns
elle n'apprend pas>she doesn't learn
nous apprenons>we learn
nous n'apprenons pas>we don't learn
vous apprenez>you learn
vous n'apprenez pas>you don't learn
ils apprennent>they learn
ils n'apprennent pas>they don't learn
elles apprennent>they learn
elles n'apprennent pas>they don't learn
apprends tu>do you learn
apprenez vous>do you learn
est ce que tu apprends>do you learn
est ce que vous apprenez>do you learn
j'ai appris>i learned
tu as appris>you learned
il a appris>he learned
elle a appris>she learned
nous avons appris>we learned
vous avez appris>you learned
ils ont appris>they learned
elles ont appris>they learned
i change<je change
i don't change<je ne change pas
do i change<je change
i changed<j'ai changé
i didn't change<je n'ai pas changé
did i change<j'ai changé
i'm changing<je change
i am changing<je change
am i changing<je change
i've changed<j'ai changé
i have changed<j'ai changé
have i changed<j'ai changé
you change<tu changes
you don't change<tu ne changes pas
do you change<tu changes
you changed<tu as changé
you didn't change<tu n'as pas changé
did you change<tu as changé
you're changing<tu changes
you are changing<tu changes
are you changing<tu changes
you've changed<tu as changé
you have changed<tu as changé
have you changed<tu as changé
we change<nous changeons
we don't change<nous ne changeons pas
do we change<nous changeons
we changed<nous avons changé
we didn't change<nous n'avons pas changé
did we change<nous avons changé
we're changing<nous changeons
we are changing<nous changeons
are we changing<nous changeons
we've changed<nous avons changé
we have changed<nous avons changé
have we changed<nous avons changé
they change<ils changent
they don't change<ils ne changent pas
do they change<ils changent
they changed<ils ont changé
they didn't change<ils n'ont pas changé
did they change<ils ont changé
they're changing<ils changent
they are changing<ils changent
are they changing<ils changent
they've changed<ils ont changé
they have changed<ils ont changé
have they changed<ils ont changé
he changes<il change
he doesn't change<il ne change pas
does he change<il change
he changed<il a changé
he didn't change<il n'a pas changé
did he change<il a changé
he's changing<il change
he is changing<il change
is he changing<il change
he has changed<il a changé
has he changed<il a changé
she changes<elle change
she doesn't change<elle ne change pas
does she change<elle change
she changed<elle a changé
she didn't change<elle n'a pas changé
did she change<elle a changé
she's changing<elle change
she is changing<elle change
is she changing<elle change
she has changed<elle a changé
has she changed<elle a changé
it changes<il change
it doesn't change<il ne change pas
does it change<il change
it changed<il a changé
it didn't change<il n'a pas changé
did it change<il a changé
it's changing<il change
it is changing<il change
is it changing<il change
it has changed<il a changé
has it changed<il a changé
je change>i change
je ne change pas>i don't change
tu changes>you change
tu ne changes pas>you don't change
il change>he changes
il ne change pas>he doesn't change
elle change>she changes
elle ne change pas>she doesn't change
nous changeons>we change
nous ne changeons pas>we don't change
vous changez>you change
vous ne changez pas>you don't change
ils changent>they change
ils ne changent pas>they don't change
elles changent>they change
elles ne changent pas>they don't change
changes tu>do you change
changez vous>do you change
est ce que tu changes>do you change
est ce que vous changez>do you change
j'ai changé>i changed
tu as changé>you changed
il a changé>he changed
elle a changé>she changed
nous avons changé>we changed
vous avez changé>you changed
ils ont changé>they changed
elles ont changé>they changed
i open<j'ouvre
i don't open<je n'ouvre pas
do i open<j'ouvre
i opened<j'ai ouvert
i didn't open<je n'ai pas ouvert
did i open<j'ai ouvert
i'm opening<j'ouvre
i am opening<j'ouvre
am i opening<j'ouvre
i've opened<j'ai ouvert
i have opened<j'ai ouvert
have i opened<j'ai ouvert
you open<tu ouvres
you don't open<tu n'ouvres pas
do you open<tu ouvres
you opened<tu as ouvert
you didn't open<tu n'as pas ouvert
did you open<tu as ouvert
you're opening<tu ouvres
you are opening<tu ouvres
are you opening<tu ouvres
you've opened<tu as ouvert
you have opened<tu as ouvert
have you opened<tu as ouvert
we open<nous ouvrons
we don't open<nous n'ouvrons pas
do we open<nous ouvrons
we opened<nous avons ouvert
we didn't open<nous n'avons pas ouvert
did we open<nous avons ouvert
we're opening<nous ouvrons
we are opening<nous ouvrons
are we opening<nous ouvrons
we've opened<nous avons ouvert
we have opened<nous avons ouvert
have we opened<nous avons ouvert
they open<ils ouvrent
they don't open<ils n'ouvrent pas
do they open<ils ouvrent
they opened<ils ont ouvert
they didn't open<ils n'ont pas ouvert
did they open<ils ont ouvert
they're opening<ils ouvrent
they are opening<ils ouvrent
are they opening<ils ouvrent
they've opened<ils ont ouvert
they have opened<ils ont ouvert
have they opened<ils ont ouvert
he opens<il ouvre
he doesn't open<il n'ouvre pas
does he open<il ouvre
he opened<il a ouvert
he didn't open<il n'a pas ouvert
did he open<il a ouvert
he's opening<il ouvre
he is opening<il ouvre
is he opening<il ouvre
he has opened<il a ouvert
has he opened<il a ouvert
she opens<elle ouvre
she doesn't open<elle n'ouvre pas
does she open<elle ouvre
she opened<elle a ouvert
she didn't open<elle n'a pas ouvert
did she open<elle a ouvert
she's opening<elle ouvre
she is opening<elle ouvre
is she opening<elle ouvre
she has opened<elle a ouvert
has she opened<elle a ouvert
it opens<il ouvre
it doesn't open<il n'ouvre pas
does it open<il ouvre
it opened<il a ouvert
it didn't open<il n'a pas ouvert
did it open<il a ouvert
it's opening<il ouvre
it is opening<il ouvre
is it opening<il ouvre
it has opened<il a ouvert
has it opened<il a ouvert
j'ouvre>i open
je n'ouvre pas>i don't open
tu ouvres>you open
tu n'ouvres pas>you don't open
il ouvre>he opens
il n'ouvre pas>he doesn't open
elle ouvre>she opens
elle n'ouvre pas>she doesn't open
nous ouvrons>we open
nous n'ouvrons pas>we don't open
vous ouvrez>you open
vous n'ouvrez pas>you don't open
ils ouvrent>they open
ils n'ouvrent pas>they don't open
elles ouvrent>they open
elles n'ouvrent pas>they don't open
ouvres tu>do you open
ouvrez vous>do you open
est ce que tu ouvres>do you open
est ce que vous ouvrez>do you open
j'ai ouvert>i opened
tu as ouvert>you opened
il a ouvert>he opened
elle a ouvert>she opened
nous avons ouvert>we opened
vous avez ouvert>you opened
ils ont ouvert>they opened
elles ont ouvert>they opened
i close<je ferme
i don't close<je ne ferme pas
do i close<je ferme
i closed<j'ai fermé
i didn't close<je n'ai pas fermé
did i close<j'ai fermé
i'm closing<je ferme
i am closing<je ferme
am i closing<je ferme
i've closed<j'ai fermé
i have closed<j'ai fermé
have i closed<j'ai fermé
you close<tu fermes
you don't close<tu ne fermes pas
do you close<tu fermes
you closed<tu as fermé
you didn't close<tu n'as pas fermé
did you close<tu as fermé
you're closing<tu fermes
you are closing<tu fermes
are you closing<tu fermes
you've closed<tu as fermé
you have closed<tu as fermé
have you closed<tu as fermé
we close<nous fermons
we don't close<nous ne fermons pas
do we close<nous fermons
we closed<nous avons fermé
we didn't close<nous n'avons pas fermé
did we close<nous avons fermé
we're closing<nous fermons
we are closing<nous fermons
are we closing<nous fermons
we've closed<nous avons fermé
we have closed<nous avons fermé
have we closed<nous avons fermé
they close<ils ferment
they don't close<ils ne ferment pas
do they close<ils ferment
they closed<ils ont fermé
they didn't close<ils n'ont pas fermé
did they close<ils ont fermé
they're closing<ils ferment
they are closing<ils ferment
are they closing<ils ferment
they've closed<ils ont fermé
they have closed<ils ont fermé
have they closed<ils ont fermé
he closes<il ferme
he doesn't close<il ne ferme pas
does he close<il ferme
he closed<il a fermé
he didn't close<il n'a pas fermé
did he close<il a fermé
he's closing<il ferme
he is closing<il ferme
is he closing<il ferme
he has closed<il a fermé
has he closed<il a fermé
she closes<elle ferme
she doesn't close<elle ne ferme pas
does she close<elle ferme
she closed<elle a fermé
she didn't close<elle n'a pas fermé
did she close<elle a fermé
she's closing<elle ferme
she is closing<elle ferme
is she closing<elle ferme
she has closed<elle a fermé
has she closed<elle a fermé
it closes<il ferme
it doesn't close<il ne ferme pas
does it close<il ferme
it closed<il a fermé
it didn't close<il n'a pas fermé
did it close<il a fermé
it's closing<il ferme
it is closing<il ferme
is it closing<il ferme
it has closed<il a fermé
has it closed<il a fermé
je ferme>i close
je ne ferme pas>i don't close
tu fermes>you close
tu ne fermes pas>you don't close
il ferme>he closes
il ne ferme pas>he doesn't close
elle ferme>she closes
elle ne ferme pas>she doesn't close
nous fermons>we close
nous ne fermons pas>we don't close
vous fermez>you close
vous ne fermez pas>you don't close
ils ferment>they close
ils ne ferment pas>they don't close
elles ferment>they close
elles ne ferment pas>they don't close
fermes tu>do you close
fermez vous>do you close
est ce que tu fermes>do you close
est ce que vous fermez>do you close
j'ai fermé>i closed
tu as fermé>you closed
il a fermé>he closed
elle a fermé>she closed
nous avons fermé>we closed
vous avez fermé>you closed
ils ont fermé>they closed
elles ont fermé>they closed
i pull<je tire
i don't pull<je ne tire pas
do i pull<je tire
i pulled<j'ai tiré
i didn't pull<je n'ai pas tiré
did i pull<j'ai tiré
i'm pulling<je tire
i am pulling<je tire
am i pulling<je tire
i've pulled<j'ai tiré
i have pulled<j'ai tiré
have i pulled<j'ai tiré
you pull<tu tires
you don't pull<tu ne tires pas
do you pull<tu tires
you pulled<tu as tiré
you didn't pull<tu n'as pas tiré
did you pull<tu as tiré
you're pulling<tu tires
you are pulling<tu tires
are you pulling<tu tires
you've pulled<tu as tiré
you have pulled<tu as tiré
have you pulled<tu as tiré
we pull<nous tirons
we don't pull<nous ne tirons pas
do we pull<nous tirons
we pulled<nous avons tiré
we didn't pull<nous n'avons pas tiré
did we pull<nous avons tiré
we're pulling<nous tirons
we are pulling<nous tirons
are we pulling<nous tirons
we've pulled<nous avons tiré
we have pulled<nous avons tiré
have we pulled<nous avons tiré
they pull<ils tirent
they don't pull<ils ne tirent pas
do they pull<ils tirent
they pulled<ils ont tiré
they didn't pull<ils n'ont pas tiré
did they pull<ils ont tiré
they're pulling<ils tirent
they are pulling<ils tirent
are they pulling<ils tirent
they've pulled<ils ont tiré
they have pulled<ils ont tiré
have they pulled<ils ont tiré
he pulls<il tire
he doesn't pull<il ne tire pas
does he pull<il tire
he pulled<il a tiré
he didn't pull<il n'a pas tiré
did he pull<il a tiré
he's pulling<il tire
he is pulling<il tire
is he pulling<il tire
he has pulled<il a tiré
has he pulled<il a tiré
she pulls<elle tire
she doesn't pull<elle ne tire pas
does she pull<elle tire
she pulled<elle a tiré
she didn't pull<elle n'a pas tiré
did she pull<elle a tiré
she's pulling<elle tire
she is pulling<elle tire
is she pulling<elle tire
she has pulled<elle a tiré
has she pulled<elle a tiré
it pulls<il tire
it doesn't pull<il ne tire pas
does it pull<il tire
it pulled<il a tiré
it didn't pull<il n'a pas tiré
did it pull<il a tiré
it's pulling<il tire
it is pulling<il tire
is it pulling<il tire
it has pulled<il a tiré
has it pulled<il a tiré
je tire>i pull
je ne tire pas>i don't pull
tu tires>you pull
tu ne tires pas>you don't pull
il tire>he pulls
il ne tire pas>he doesn't pull
elle tire>she pulls
elle ne tire pas>she doesn't pull
nous tirons>we pull
nous ne tirons pas>we don't pull
vous tirez>you pull
vous ne tirez pas>you don't pull
ils tirent>they pull
ils ne tirent pas>they don't pull
elles tirent>they pull
elles ne tirent pas>they don't pull
tires tu>do you pull
tirez vous>do you pull
est ce que tu tires>do you pull
est ce que vous tirez>do you pull
j'ai tiré>i pulled
tu as tiré>you pulled
il a tiré>he pulled
elle a tiré>she pulled
nous avons tiré>we pulled
vous avez tiré>you pulled
ils ont tiré>they pulled
elles ont tiré>they pulled
i farm<je farme
i don't farm<je ne farme pas
do i farm<je farme
i farmed<j'ai farmé
i didn't farm<je n'ai pas farmé
did i farm<j'ai farmé
i'm farming<je farme
i am farming<je farme
am i farming<je farme
i've farmed<j'ai farmé
i have farmed<j'ai farmé
have i farmed<j'ai farmé
you farm<tu farmes
you don't farm<tu ne farmes pas
do you farm<tu farmes
you farmed<tu as farmé
you didn't farm<tu n'as pas farmé
did you farm<tu as farmé
you're farming<tu farmes
you are farming<tu farmes
are you farming<tu farmes
you've farmed<tu as farmé
you have farmed<tu as farmé
have you farmed<tu as farmé
we farm<nous farmons
we don't farm<nous ne farmons pas
do we farm<nous farmons
we farmed<nous avons farmé
we didn't farm<nous n'avons pas farmé
did we farm<nous avons farmé
we're farming<nous farmons
we are farming<nous farmons
are we farming<nous farmons
we've farmed<nous avons farmé
we have farmed<nous avons farmé
have we farmed<nous avons farmé
they farm<ils farment
they don't farm<ils ne farment pas
do they farm<ils farment
they farmed<ils ont farmé
they didn't farm<ils n'ont pas farmé
did they farm<ils ont farmé
they're farming<ils farment
they are farming<ils farment
are they farming<ils farment
they've farmed<ils ont farmé
they have farmed<ils ont farmé
have they farmed<ils ont farmé
he farms<il farme
he doesn't farm<il ne farme pas
does he farm<il farme
he farmed<il a farmé
he didn't farm<il n'a pas farmé
did he farm<il a farmé
he's farming<il farme
he is farming<il farme
is he farming<il farme
he has farmed<il a farmé
has he farmed<il a farmé
she farms<elle farme
she doesn't farm<elle ne farme pas
does she farm<elle farme
she farmed<elle a farmé
she didn't farm<elle n'a pas farmé
did she farm<elle a farmé
she's farming<elle farme
she is farming<elle farme
is she farming<elle farme
she has farmed<elle a farmé
has she farmed<elle a farmé
it farms<il farme
it doesn't farm<il ne farme pas
does it farm<il farme
it farmed<il a farmé
it didn't farm<il n'a pas farmé
did it farm<il a farmé
it's farming<il farme
it is farming<il farme
is it farming<il farme
it has farmed<il a farmé
has it farmed<il a farmé
je farme>i farm
je ne farme pas>i don't farm
tu farmes>you farm
tu ne farmes pas>you don't farm
il farme>he farms
il ne farme pas>he doesn't farm
elle farme>she farms
elle ne farme pas>she doesn't farm
nous farmons>we farm
nous ne farmons pas>we don't farm
vous farmez>you farm
vous ne farmez pas>you don't farm
ils farment>they farm
ils ne farment pas>they don't farm
elles farment>they farm
elles ne farment pas>they don't farm
farmes tu>do you farm
farmez vous>do you farm
est ce que tu farmes>do you farm
est ce que vous farmez>do you farm
j'ai farmé>i farmed
tu as farmé>you farmed
il a farmé>he farmed
elle a farmé>she farmed
nous avons farmé>we farmed
vous avez farmé>you farmed
ils ont farmé>they farmed
elles ont farmé>they farmed
i put<je mets
i don't put<je ne mets pas
do i put<je mets
i didn't put<je n'ai pas mis
did i put<j'ai mis
i'm putting<je mets
i am putting<je mets
am i putting<je mets
i've put<j'ai mis
i have put<j'ai mis
have i put<j'ai mis
you put<tu mets
you don't put<tu ne mets pas
do you put<tu mets
you didn't put<tu n'as pas mis
did you put<tu as mis
you're putting<tu mets
you are putting<tu mets
are you putting<tu mets
you've put<tu as mis
you have put<tu as mis
have you put<tu as mis
we put<nous mettons
we don't put<nous ne mettons pas
do we put<nous mettons
we didn't put<nous n'avons pas mis
did we put<nous avons mis
we're putting<nous mettons
we are putting<nous mettons
are we putting<nous mettons
we've put<nous avons mis
we have put<nous avons mis
have we put<nous avons mis
they put<ils mettent
they don't put<ils ne mettent pas
do they put<ils mettent
they didn't put<ils n'ont pas mis
did they put<ils ont mis
they're putting<ils mettent
they are putting<ils mettent
are they putting<ils mettent
they've put<ils ont mis
they have put<ils ont mis
have they put<ils ont mis
he puts<il met
he doesn't put<il ne met pas
does he put<il met
he didn't put<il n'a pas mis
did he put<il a mis
he's putting<il met
he is putting<il met
is he putting<il met
he has put<il a mis
has he put<il a mis
she puts<elle met
she doesn't put<elle ne met pas
does she put<elle met
she didn't put<elle n'a pas mis
did she put<elle a mis
she's putting<elle met
she is putting<elle met
is she putting<elle met
she has put<elle a mis
has she put<elle a mis
it puts<il met
it doesn't put<il ne met pas
does it put<il met
it didn't put<il n'a pas mis
did it put<il a mis
it's putting<il met
it is putting<il met
is it putting<il met
it has put<il a mis
has it put<il a mis
je mets>i put
je ne mets pas>i don't put
tu mets>you put
tu ne mets pas>you don't put
il met>he puts
il ne met pas>he doesn't put
elle met>she puts
elle ne met pas>she doesn't put
nous mettons>we put
nous ne mettons pas>we don't put
vous mettez>you put
vous ne mettez pas>you don't put
ils mettent>they put
ils ne mettent pas>they don't put
elles mettent>they put
elles ne mettent pas>they don't put
mets tu>do you put
mettez vous>do you put
est ce que tu mets>do you put
est ce que vous mettez>do you put
i keep<je garde
i don't keep<je ne garde pas
do i keep<je garde
i kept<j'ai gardé
i didn't keep<je n'ai pas gardé
did i keep<j'ai gardé
i'm keeping<je garde
i am keeping<je garde
am i keeping<je garde
i've kept<j'ai gardé
i have kept<j'ai gardé
have i kept<j'ai gardé
you keep<tu gardes
you don't keep<tu ne gardes pas
do you keep<tu gardes
you kept<tu as gardé
you didn't keep<tu n'as pas gardé
did you keep<tu as gardé
you're keeping<tu gardes
you are keeping<tu gardes
are you keeping<tu gardes
you've kept<tu as gardé
you have kept<tu as gardé
have you kept<tu as gardé
we keep<nous gardons
we don't keep<nous ne gardons pas
do we keep<nous gardons
we kept<nous avons gardé
we didn't keep<nous n'avons pas gardé
did we keep<nous avons gardé
we're keeping<nous gardons
we are keeping<nous gardons
are we keeping<nous gardons
we've kept<nous avons gardé
we have kept<nous avons gardé
have we kept<nous avons gardé
they keep<ils gardent
they don't keep<ils ne gardent pas
do they keep<ils gardent
they kept<ils ont gardé
they didn't keep<ils n'ont pas gardé
did they keep<ils ont gardé
they're keeping<ils gardent
they are keeping<ils gardent
are they keeping<ils gardent
they've kept<ils ont gardé
they have kept<ils ont gardé
have they kept<ils ont gardé
he keeps<il garde
he doesn't keep<il ne garde pas
does he keep<il garde
he kept<il a gardé
he didn't keep<il n'a pas gardé
did he keep<il a gardé
he's keeping<il garde
he is keeping<il garde
is he keeping<il garde
he has kept<il a gardé
has he kept<il a gardé
she keeps<elle garde
she doesn't keep<elle ne garde pas
does she keep<elle garde
she kept<elle a gardé
she didn't keep<elle n'a pas gardé
did she keep<elle a gardé
she's keeping<elle garde
she is keeping<elle garde
is she keeping<elle garde
she has kept<elle a gardé
has she kept<elle a gardé
it keeps<il garde
it doesn't keep<il ne garde pas
does it keep<il garde
it kept<il a gardé
it didn't keep<il n'a pas gardé
did it keep<il a gardé
it's keeping<il garde
it is keeping<il garde
is it keeping<il garde
it has kept<il a gardé
has it kept<il a gardé
je garde>i keep
je ne garde pas>i don't keep
tu gardes>you keep
tu ne gardes pas>you don't keep
il garde>he keeps
il ne garde pas>he doesn't keep
elle garde>she keeps
elle ne garde pas>she doesn't keep
nous gardons>we keep
nous ne gardons pas>we don't keep
vous gardez>you keep
vous ne gardez pas>you don't keep
ils gardent>they keep
ils ne gardent pas>they don't keep
elles gardent>they keep
elles ne gardent pas>they don't keep
gardes tu>do you keep
gardez vous>do you keep
est ce que tu gardes>do you keep
est ce que vous gardez>do you keep
j'ai gardé>i kept
tu as gardé>you kept
il a gardé>he kept
elle a gardé>she kept
nous avons gardé>we kept
vous avez gardé>you kept
ils ont gardé>they kept
elles ont gardé>they kept
i let<je laisse
i don't let<je ne laisse pas
do i let<je laisse
i didn't let<je n'ai pas laissé
did i let<j'ai laissé
i'm letting<je laisse
i am letting<je laisse
am i letting<je laisse
i've let<j'ai laissé
i have let<j'ai laissé
have i let<j'ai laissé
you let<tu laisses
you don't let<tu ne laisses pas
do you let<tu laisses
you didn't let<tu n'as pas laissé
did you let<tu as laissé
you're letting<tu laisses
you are letting<tu laisses
are you letting<tu laisses
you've let<tu as laissé
you have let<tu as laissé
have you let<tu as laissé
we let<nous laissons
we don't let<nous ne laissons pas
do we let<nous laissons
we didn't let<nous n'avons pas laissé
did we let<nous avons laissé
we're letting<nous laissons
we are letting<nous laissons
are we letting<nous laissons
we've let<nous avons laissé
we have let<nous avons laissé
have we let<nous avons laissé
they let<ils laissent
they don't let<ils ne laissent pas
do they let<ils laissent
they didn't let<ils n'ont pas laissé
did they let<ils ont laissé
they're letting<ils laissent
they are letting<ils laissent
are they letting<ils laissent
they've let<ils ont laissé
they have let<ils ont laissé
have they let<ils ont laissé
he lets<il laisse
he doesn't let<il ne laisse pas
does he let<il laisse
he didn't let<il n'a pas laissé
did he let<il a laissé
he's letting<il laisse
he is letting<il laisse
is he letting<il laisse
he has let<il a laissé
has he let<il a laissé
she lets<elle laisse
she doesn't let<elle ne laisse pas
does she let<elle laisse
she didn't let<elle n'a pas laissé
did she let<elle a laissé
she's letting<elle laisse
she is letting<elle laisse
is she letting<elle laisse
she has let<elle a laissé
has she let<elle a laissé
it lets<il laisse
it doesn't let<il ne laisse pas
does it let<il laisse
it didn't let<il n'a pas laissé
did it let<il a laissé
it's letting<il laisse
it is letting<il laisse
is it letting<il laisse
it has let<il a laissé
has it let<il a laissé
je laisse>i let
je ne laisse pas>i don't let
tu laisses>you let
tu ne laisses pas>you don't let
il laisse>he lets
il ne laisse pas>he doesn't let
elle laisse>she lets
elle ne laisse pas>she doesn't let
nous laissons>we let
nous ne laissons pas>we don't let
vous laissez>you let
vous ne laissez pas>you don't let
ils laissent>they let
ils ne laissent pas>they don't let
elles laissent>they let
elles ne laissent pas>they don't let
laisses tu>do you let
laissez vous>do you let
est ce que tu laisses>do you let
est ce que vous laissez>do you let
i live<je vis
i don't live<je ne vis pas
do i live<je vis
i lived<j'ai vécu
i didn't live<je n'ai pas vécu
did i live<j'ai vécu
i'm living<je vis
i am living<je vis
am i living<je vis
i've lived<j'ai vécu
i have lived<j'ai vécu
have i lived<j'ai vécu
you live<tu vis
you don't live<tu ne vis pas
do you live<tu vis
you lived<tu as vécu
you didn't live<tu n'as pas vécu
did you live<tu as vécu
you're living<tu vis
you are living<tu vis
are you living<tu vis
you've lived<tu as vécu
you have lived<tu as vécu
have you lived<tu as vécu
we live<nous vivons
we don't live<nous ne vivons pas
do we live<nous vivons
we lived<nous avons vécu
we didn't live<nous n'avons pas vécu
did we live<nous avons vécu
we're living<nous vivons
we are living<nous vivons
are we living<nous vivons
we've lived<nous avons vécu
we have lived<nous avons vécu
have we lived<nous avons vécu
they live<ils vivent
they don't live<ils ne vivent pas
do they live<ils vivent
they lived<ils ont vécu
they didn't live<ils n'ont pas vécu
did they live<ils ont vécu
they're living<ils vivent
they are living<ils vivent
are they living<ils vivent
they've lived<ils ont vécu
they have lived<ils ont vécu
have they lived<ils ont vécu
he lives<il vit
he doesn't live<il ne vit pas
does he live<il vit
he lived<il a vécu
he didn't live<il n'a pas vécu
did he live<il a vécu
he's living<il vit
he is living<il vit
is he living<il vit
he has lived<il a vécu
has he lived<il a vécu
she lives<elle vit
she doesn't live<elle ne vit pas
does she live<elle vit
she lived<elle a vécu
she didn't live<elle n'a pas vécu
did she live<elle a vécu
she's living<elle vit
she is living<elle vit
is she living<elle vit
she has lived<elle a vécu
has she lived<elle a vécu
it lives<il vit
it doesn't live<il ne vit pas
does it live<il vit
it lived<il a vécu
it didn't live<il n'a pas vécu
did it live<il a vécu
it's living<il vit
it is living<il vit
is it living<il vit
it has lived<il a vécu
has it lived<il a vécu
je vis>i live
je ne vis pas>i don't live
tu vis>you live
tu ne vis pas>you don't live
il vit>he lives
il ne vit pas>he doesn't live
elle vit>she lives
elle ne vit pas>she doesn't live
nous vivons>we live
nous ne vivons pas>we don't live
vous vivez>you live
vous ne vivez pas>you don't live
ils vivent>they live
ils ne vivent pas>they don't live
elles vivent>they live
elles ne vivent pas>they don't live
vis tu>do you live
vivez vous>do you live
est ce que tu vis>do you live
est ce que vous vivez>do you live
j'ai vécu>i lived
tu as vécu>you lived
il a vécu>he lived
elle a vécu>she lived
nous avons vécu>we lived
vous avez vécu>you lived
ils ont vécu>they lived
elles ont vécu>they lived
i move<je bouge
i don't move<je ne bouge pas
do i move<je bouge
i moved<j'ai bougé
i didn't move<je n'ai pas bougé
did i move<j'ai bougé
i'm moving<je bouge
i am moving<je bouge
am i moving<je bouge
i've moved<j'ai bougé
i have moved<j'ai bougé
have i moved<j'ai bougé
you move<tu bouges
you don't move<tu ne bouges pas
do you move<tu bouges
you moved<tu as bougé
you didn't move<tu n'as pas bougé
did you move<tu as bougé
you're moving<tu bouges
you are moving<tu bouges
are you moving<tu bouges
you've moved<tu as bougé
you have moved<tu as bougé
have you moved<tu as bougé
we move<nous bougeons
we don't move<nous ne bougeons pas
do we move<nous bougeons
we moved<nous avons bougé
we didn't move<nous n'avons pas bougé
did we move<nous avons bougé
we're moving<nous bougeons
we are moving<nous bougeons
are we moving<nous bougeons
we've moved<nous avons bougé
we have moved<nous avons bougé
have we moved<nous avons bougé
they move<ils bougent
they don't move<ils ne bougent pas
do they move<ils bougent
they moved<ils ont bougé
they didn't move<ils n'ont pas bougé
did they move<ils ont bougé
they're moving<ils bougent
they are moving<ils bougent
are they moving<ils bougent
they've moved<ils ont bougé
they have moved<ils ont bougé
have they moved<ils ont bougé
he moves<il bouge
he doesn't move<il ne bouge pas
does he move<il bouge
he moved<il a bougé
he didn't move<il n'a pas bougé
did he move<il a bougé
he's moving<il bouge
he is moving<il bouge
is he moving<il bouge
he has moved<il a bougé
has he moved<il a bougé
she moves<elle bouge
she doesn't move<elle ne bouge pas
does she move<elle bouge
she moved<elle a bougé
she didn't move<elle n'a pas bougé
did she move<elle a bougé
she's moving<elle bouge
she is moving<elle bouge
is she moving<elle bouge
she has moved<elle a bougé
has she moved<elle a bougé
it moves<il bouge
it doesn't move<il ne bouge pas
does it move<il bouge
it moved<il a bougé
it didn't move<il n'a pas bougé
did it move<il a bougé
it's moving<il bouge
it is moving<il bouge
is it moving<il bouge
it has moved<il a bougé
has it moved<il a bougé
je bouge>i move
je ne bouge pas>i don't move
tu bouges>you move
tu ne bouges pas>you don't move
il bouge>he moves
il ne bouge pas>he doesn't move
elle bouge>she moves
elle ne bouge pas>she doesn't move
nous bougeons>we move
nous ne bougeons pas>we don't move
vous bougez>you move
vous ne bougez pas>you don't move
ils bougent>they move
ils ne bougent pas>they don't move
elles bougent>they move
elles ne bougent pas>they don't move
bouges tu>do you move
bougez vous>do you move
est ce que tu bouges>do you move
est ce que vous bougez>do you move
j'ai bougé>i moved
tu as bougé>you moved
il a bougé>he moved
elle a bougé>she moved
nous avons bougé>we moved
vous avez bougé>you moved
ils ont bougé>they moved
elles ont bougé>they moved
i hold<je tiens
i don't hold<je ne tiens pas
do i hold<je tiens
i held<j'ai tenu
i didn't hold<je n'ai pas tenu
did i hold<j'ai tenu
i'm holding<je tiens
i am holding<je tiens
am i holding<je tiens
i've held<j'ai tenu
i have held<j'ai tenu
have i held<j'ai tenu
you hold<tu tiens
you don't hold<tu ne tiens pas
do you hold<tu tiens
you held<tu as tenu
you didn't hold<tu n'as pas tenu
did you hold<tu as tenu
you're holding<tu tiens
you are holding<tu tiens
are you holding<tu tiens
you've held<tu as tenu
you have held<tu as tenu
have you held<tu as tenu
we hold<nous tenons
we don't hold<nous ne tenons pas
do we hold<nous tenons
we held<nous avons tenu
we didn't hold<nous n'avons pas tenu
did we hold<nous avons tenu
we're holding<nous tenons
we are holding<nous tenons
are we holding<nous tenons
we've held<nous avons tenu
we have held<nous avons tenu
have we held<nous avons tenu
they hold<ils tiennent
they don't hold<ils ne tiennent pas
do they hold<ils tiennent
they held<ils ont tenu
they didn't hold<ils n'ont pas tenu
did they hold<ils ont tenu
they're holding<ils tiennent
they are holding<ils tiennent
are they holding<ils tiennent
they've held<ils ont tenu
they have held<ils ont tenu
have they held<ils ont tenu
he holds<il tient
he doesn't hold<il ne tient pas
does he hold<il tient
he held<il a tenu
he didn't hold<il n'a pas tenu
did he hold<il a tenu
he's holding<il tient
he is holding<il tient
is he holding<il tient
he has held<il a tenu
has he held<il a tenu
she holds<elle tient
she doesn't hold<elle ne tient pas
does she hold<elle tient
she held<elle a tenu
she didn't hold<elle n'a pas tenu
did she hold<elle a tenu
she's holding<elle tient
she is holding<elle tient
is she holding<elle tient
she has held<elle a tenu
has she held<elle a tenu
it holds<il tient
it doesn't hold<il ne tient pas
does it hold<il tient
it held<il a tenu
it didn't hold<il n'a pas tenu
did it hold<il a tenu
it's holding<il tient
it is holding<il tient
is it holding<il tient
it has held<il a tenu
has it held<il a tenu
je tiens>i hold
je ne tiens pas>i don't hold
tu tiens>you hold
tu ne tiens pas>you don't hold
il tient>he holds
il ne tient pas>he doesn't hold
elle tient>she holds
elle ne tient pas>she doesn't hold
nous tenons>we hold
nous ne tenons pas>we don't hold
vous tenez>you hold
vous ne tenez pas>you don't hold
ils tiennent>they hold
ils ne tiennent pas>they don't hold
elles tiennent>they hold
elles ne tiennent pas>they don't hold
tiens tu>do you hold
tenez vous>do you hold
est ce que tu tiens>do you hold
est ce que vous tenez>do you hold
j'ai tenu>i held
tu as tenu>you held
il a tenu>he held
elle a tenu>she held
nous avons tenu>we held
vous avez tenu>you held
ils ont tenu>they held
elles ont tenu>they held
i read<je lis
i don't read<je ne lis pas
do i read<je lis
i didn't read<je n'ai pas lu
did i read<j'ai lu
i'm reading<je lis
i am reading<je lis
am i reading<je lis
i've read<j'ai lu
i have read<j'ai lu
have i read<j'ai lu
you read<tu lis
you don't read<tu ne lis pas
do you read<tu lis
you didn't read<tu n'as pas lu
did you read<tu as lu
you're reading<tu lis
you are reading<tu lis
are you reading<tu lis
you've read<tu as lu
you have read<tu as lu
have you read<tu as lu
we read<nous lisons
we don't read<nous ne lisons pas
do we read<nous lisons
we didn't read<nous n'avons pas lu
did we read<nous avons lu
we're reading<nous lisons
we are reading<nous lisons
are we reading<nous lisons
we've read<nous avons lu
we have read<nous avons lu
have we read<nous avons lu
they read<ils lisent
they don't read<ils ne lisent pas
do they read<ils lisent
they didn't read<ils n'ont pas lu
did they read<ils ont lu
they're reading<ils lisent
they are reading<ils lisent
are they reading<ils lisent
they've read<ils ont lu
they have read<ils ont lu
have they read<ils ont lu
he reads<il lit
he doesn't read<il ne lit pas
does he read<il lit
he didn't read<il n'a pas lu
did he read<il a lu
he's reading<il lit
he is reading<il lit
is he reading<il lit
he has read<il a lu
has he read<il a lu
she reads<elle lit
she doesn't read<elle ne lit pas
does she read<elle lit
she didn't read<elle n'a pas lu
did she read<elle a lu
she's reading<elle lit
she is reading<elle lit
is she reading<elle lit
she has read<elle a lu
has she read<elle a lu
it reads<il lit
it doesn't read<il ne lit pas
does it read<il lit
it didn't read<il n'a pas lu
did it read<il a lu
it's reading<il lit
it is reading<il lit
is it reading<il lit
it has read<il a lu
has it read<il a lu
je lis>i read
je ne lis pas>i don't read
tu lis>you read
tu ne lis pas>you don't read
il lit>he reads
il ne lit pas>he doesn't read
elle lit>she reads
elle ne lit pas>she doesn't read
nous lisons>we read
nous ne lisons pas>we don't read
vous lisez>you read
vous ne lisez pas>you don't read
ils lisent>they read
ils ne lisent pas>they don't read
elles lisent>they read
elles ne lisent pas>they don't read
lis tu>do you read
lisez vous>do you read
est ce que tu lis>do you read
est ce que vous lisez>do you read
i write<j'écris
i don't write<je n'écris pas
do i write<j'écris
i wrote<j'ai écrit
i didn't write<je n'ai pas écrit
did i write<j'ai écrit
i'm writing<j'écris
i am writing<j'écris
am i writing<j'écris
i've written<j'ai écrit
i have written<j'ai écrit
have i written<j'ai écrit
you write<tu écris
you don't write<tu n'écris pas
do you write<tu écris
you wrote<tu as écrit
you didn't write<tu n'as pas écrit
did you write<tu as écrit
you're writing<tu écris
you are writing<tu écris
are you writing<tu écris
you've written<tu as écrit
you have written<tu as écrit
have you written<tu as écrit
we write<nous écrivons
we don't write<nous n'écrivons pas
do we write<nous écrivons
we wrote<nous avons écrit
we didn't write<nous n'avons pas écrit
did we write<nous avons écrit
we're writing<nous écrivons
we are writing<nous écrivons
are we writing<nous écrivons
we've written<nous avons écrit
we have written<nous avons écrit
have we written<nous avons écrit
they write<ils écrivent
they don't write<ils n'écrivent pas
do they write<ils écrivent
they wrote<ils ont écrit
they didn't write<ils n'ont pas écrit
did they write<ils ont écrit
they're writing<ils écrivent
they are writing<ils écrivent
are they writing<ils écrivent
they've written<ils ont écrit
they have written<ils ont écrit
have they written<ils ont écrit
he writes<il écrit
he doesn't write<il n'écrit pas
does he write<il écrit
he wrote<il a écrit
he didn't write<il n'a pas écrit
did he write<il a écrit
he's writing<il écrit
he is writing<il écrit
is he writing<il écrit
he has written<il a écrit
has he written<il a écrit
she writes<elle écrit
she doesn't write<elle n'écrit pas
does she write<elle écrit
she wrote<elle a écrit
she didn't write<elle n'a pas écrit
did she write<elle a écrit
she's writing<elle écrit
she is writing<elle écrit
is she writing<elle écrit
she has written<elle a écrit
has she written<elle a écrit
it writes<il écrit
it doesn't write<il n'écrit pas
does it write<il écrit
it wrote<il a écrit
it didn't write<il n'a pas écrit
did it write<il a écrit
it's writing<il écrit
it is writing<il écrit
is it writing<il écrit
it has written<il a écrit
has it written<il a écrit
j'écris>i write
je n'écris pas>i don't write
tu écris>you write
tu n'écris pas>you don't write
il écrit>he writes
il n'écrit pas>he doesn't write
elle écrit>she writes
elle n'écrit pas>she doesn't write
nous écrivons>we write
nous n'écrivons pas>we don't write
vous écrivez>you write
vous n'écrivez pas>you don't write
ils écrivent>they write
ils n'écrivent pas>they don't write
elles écrivent>they write
elles n'écrivent pas>they don't write
écris tu>do you write
écrivez vous>do you write
est ce que tu écris>do you write
est ce que vous écrivez>do you write
j'ai écrit>i wrote
tu as écrit>you wrote
il a écrit>he wrote
elle a écrit>she wrote
nous avons écrit>we wrote
vous avez écrit>you wrote
ils ont écrit>they wrote
elles ont écrit>they wrote
i eat<je mange
i don't eat<je ne mange pas
do i eat<je mange
i ate<j'ai mangé
i didn't eat<je n'ai pas mangé
did i eat<j'ai mangé
i'm eating<je mange
i am eating<je mange
am i eating<je mange
i've eaten<j'ai mangé
i have eaten<j'ai mangé
have i eaten<j'ai mangé
you eat<tu manges
you don't eat<tu ne manges pas
do you eat<tu manges
you ate<tu as mangé
you didn't eat<tu n'as pas mangé
did you eat<tu as mangé
you're eating<tu manges
you are eating<tu manges
are you eating<tu manges
you've eaten<tu as mangé
you have eaten<tu as mangé
have you eaten<tu as mangé
we eat<nous mangeons
we don't eat<nous ne mangeons pas
do we eat<nous mangeons
we ate<nous avons mangé
we didn't eat<nous n'avons pas mangé
did we eat<nous avons mangé
we're eating<nous mangeons
we are eating<nous mangeons
are we eating<nous mangeons
we've eaten<nous avons mangé
we have eaten<nous avons mangé
have we eaten<nous avons mangé
they eat<ils mangent
they don't eat<ils ne mangent pas
do they eat<ils mangent
they ate<ils ont mangé
they didn't eat<ils n'ont pas mangé
did they eat<ils ont mangé
they're eating<ils mangent
they are eating<ils mangent
are they eating<ils mangent
they've eaten<ils ont mangé
they have eaten<ils ont mangé
have they eaten<ils ont mangé
he eats<il mange
he doesn't eat<il ne mange pas
does he eat<il mange
he ate<il a mangé
he didn't eat<il n'a pas mangé
did he eat<il a mangé
he's eating<il mange
he is eating<il mange
is he eating<il mange
he has eaten<il a mangé
has he eaten<il a mangé
she eats<elle mange
she doesn't eat<elle ne mange pas
does she eat<elle mange
she ate<elle a mangé
she didn't eat<elle n'a pas mangé
did she eat<elle a mangé
she's eating<elle mange
she is eating<elle mange
is she eating<elle mange
she has eaten<elle a mangé
has she eaten<elle a mangé
it eats<il mange
it doesn't eat<il ne mange pas
does it eat<il mange
it ate<il a mangé
it didn't eat<il n'a pas mangé
did it eat<il a mangé
it's eating<il mange
it is eating<il mange
is it eating<il mange
it has eaten<il a mangé
has it eaten<il a mangé
je mange>i eat
je ne mange pas>i don't eat
tu manges>you eat
tu ne manges pas>you don't eat
il mange>he eats
il ne mange pas>he doesn't eat
elle mange>she eats
elle ne mange pas>she doesn't eat
nous mangeons>we eat
nous ne mangeons pas>we don't eat
vous mangez>you eat
vous ne mangez pas>you don't eat
ils mangent>they eat
ils ne mangent pas>they don't eat
elles mangent>they eat
elles ne mangent pas>they don't eat
manges tu>do you eat
mangez vous>do you eat
est ce que tu manges>do you eat
est ce que vous mangez>do you eat
j'ai mangé>i ate
tu as mangé>you ate
il a mangé>he ate
elle a mangé>she ate
nous avons mangé>we ate
vous avez mangé>you ate
ils ont mangé>they ate
elles ont mangé>they ate
i sleep<je dors
i don't sleep<je ne dors pas
do i sleep<je dors
i slept<j'ai dormi
i didn't sleep<je n'ai pas dormi
did i sleep<j'ai dormi
i'm sleeping<je dors
i am sleeping<je dors
am i sleeping<je dors
i've slept<j'ai dormi
i have slept<j'ai dormi
have i slept<j'ai dormi
you sleep<tu dors
you don't sleep<tu ne dors pas
do you sleep<tu dors
you slept<tu as dormi
you didn't sleep<tu n'as pas dormi
did you sleep<tu as dormi
you're sleeping<tu dors
you are sleeping<tu dors
are you sleeping<tu dors
you've slept<tu as dormi
you have slept<tu as dormi
have you slept<tu as dormi
we sleep<nous dormons
we don't sleep<nous ne dormons pas
do we sleep<nous dormons
we slept<nous avons dormi
we didn't sleep<nous n'avons pas dormi
did we sleep<nous avons dormi
we're sleeping<nous dormons
we are sleeping<nous dormons
are we sleeping<nous dormons
we've slept<nous avons dormi
we have slept<nous avons dormi
have we slept<nous avons dormi
they sleep<ils dorment
they don't sleep<ils ne dorment pas
do they sleep<ils dorment
they slept<ils ont dormi
they didn't sleep<ils n'ont pas dormi
did they sleep<ils ont dormi
they're sleeping<ils dorment
they are sleeping<ils dorment
are they sleeping<ils dorment
they've slept<ils ont dormi
they have slept<ils ont dormi
have they slept<ils ont dormi
he sleeps<il dort
he doesn't sleep<il ne dort pas
does he sleep<il dort
he slept<il a dormi
he didn't sleep<il n'a pas dormi
did he sleep<il a dormi
he's sleeping<il dort
he is sleeping<il dort
is he sleeping<il dort
he has slept<il a dormi
has he slept<il a dormi
she sleeps<elle dort
she doesn't sleep<elle ne dort pas
does she sleep<elle dort
she slept<elle a dormi
she didn't sleep<elle n'a pas dormi
did she sleep<elle a dormi
she's sleeping<elle dort
she is sleeping<elle dort
is she sleeping<elle dort
she has slept<elle a dormi
has she slept<elle a dormi
it sleeps<il dort
it doesn't sleep<il ne dort pas
does it sleep<il dort
it slept<il a dormi
it didn't sleep<il n'a pas dormi
did it sleep<il a dormi
it's sleeping<il dort
it is sleeping<il dort
is it sleeping<il dort
it has slept<il a dormi
has it slept<il a dormi
je dors>i sleep
je ne dors pas>i don't sleep
tu dors>you sleep
tu ne dors pas>you don't sleep
il dort>he sleeps
il ne dort pas>he doesn't sleep
elle dort>she sleeps
elle ne dort pas>she doesn't sleep
nous dormons>we sleep
nous ne dormons pas>we don't sleep
vous dormez>you sleep
vous ne dormez pas>you don't sleep
ils dorment>they sleep
ils ne dorment pas>they don't sleep
elles dorment>they sleep
elles ne dorment pas>they don't sleep
dors tu>do you sleep
dormez vous>do you sleep
est ce que tu dors>do you sleep
est ce que vous dormez>do you sleep
j'ai dormi>i slept
tu as dormi>you slept
il a dormi>he slept
elle a dormi>she slept
nous avons dormi>we slept
vous avez dormi>you slept
ils ont dormi>they slept
elles ont dormi>they slept
i guess<je suppose
i don't guess<je ne suppose pas
i guess that<je suppose que
do i guess<je suppose
i guessed<j'ai supposé
i didn't guess<je n'ai pas supposé
did i guess<j'ai supposé
i'm guessing<je suppose
i am guessing<je suppose
am i guessing<je suppose
i've guessed<j'ai supposé
i have guessed<j'ai supposé
have i guessed<j'ai supposé
you guess<tu supposes
you don't guess<tu ne supposes pas
you guess that<tu supposes que
do you guess<tu supposes
you guessed<tu as supposé
you didn't guess<tu n'as pas supposé
did you guess<tu as supposé
you're guessing<tu supposes
you are guessing<tu supposes
are you guessing<tu supposes
you've guessed<tu as supposé
you have guessed<tu as supposé
have you guessed<tu as supposé
we guess<nous supposons
we don't guess<nous ne supposons pas
we guess that<nous supposons que
do we guess<nous supposons
we guessed<nous avons supposé
we didn't guess<nous n'avons pas supposé
did we guess<nous avons supposé
we're guessing<nous supposons
we are guessing<nous supposons
are we guessing<nous supposons
we've guessed<nous avons supposé
we have guessed<nous avons supposé
have we guessed<nous avons supposé
they guess<ils supposent
they don't guess<ils ne supposent pas
they guess that<ils supposent que
do they guess<ils supposent
they guessed<ils ont supposé
they didn't guess<ils n'ont pas supposé
did they guess<ils ont supposé
they're guessing<ils supposent
they are guessing<ils supposent
are they guessing<ils supposent
they've guessed<ils ont supposé
they have guessed<ils ont supposé
have they guessed<ils ont supposé
he guesses<il suppose
he doesn't guess<il ne suppose pas
he guesses that<il suppose que
does he guess<il suppose
he guessed<il a supposé
he didn't guess<il n'a pas supposé
did he guess<il a supposé
he's guessing<il suppose
he is guessing<il suppose
is he guessing<il suppose
he has guessed<il a supposé
has he guessed<il a supposé
she guesses<elle suppose
she doesn't guess<elle ne suppose pas
she guesses that<elle suppose que
does she guess<elle suppose
she guessed<elle a supposé
she didn't guess<elle n'a pas supposé
did she guess<elle a supposé
she's guessing<elle suppose
she is guessing<elle suppose
is she guessing<elle suppose
she has guessed<elle a supposé
has she guessed<elle a supposé
it guesses<il suppose
it doesn't guess<il ne suppose pas
it guesses that<il suppose que
does it guess<il suppose
it guessed<il a supposé
it didn't guess<il n'a pas supposé
did it guess<il a supposé
it's guessing<il suppose
it is guessing<il suppose
is it guessing<il suppose
it has guessed<il a supposé
has it guessed<il a supposé
je suppose>i guess
je ne suppose pas>i don't guess
tu supposes>you guess
tu ne supposes pas>you don't guess
il suppose>he guesses
il ne suppose pas>he doesn't guess
elle suppose>she guesses
elle ne suppose pas>she doesn't guess
nous supposons>we guess
nous ne supposons pas>we don't guess
vous supposez>you guess
vous ne supposez pas>you don't guess
ils supposent>they guess
ils ne supposent pas>they don't guess
elles supposent>they guess
elles ne supposent pas>they don't guess
supposes tu>do you guess
supposez vous>do you guess
est ce que tu supposes>do you guess
est ce que vous supposez>do you guess
j'ai supposé>i guessed
tu as supposé>you guessed
il a supposé>he guessed
elle a supposé>she guessed
nous avons supposé>we guessed
vous avez supposé>you guessed
ils ont supposé>they guessed
elles ont supposé>they guessed
i log<je me connecte
i don't log<je ne me pas connecte
do i log<je me connecte
i logged<j'ai connecté
i didn't log<je n'ai pas connecté
did i log<j'ai connecté
i'm logging<je me connecte
i am logging<je me connecte
am i logging<je me connecte
i've logged<j'ai connecté
i have logged<j'ai connecté
have i logged<j'ai connecté
you log<tu te connectes
you don't log<tu ne te pas connectes
do you log<tu te connectes
you logged<tu as connecté
you didn't log<tu n'as pas connecté
did you log<tu as connecté
you're logging<tu te connectes
you are logging<tu te connectes
are you logging<tu te connectes
you've logged<tu as connecté
you have logged<tu as connecté
have you logged<tu as connecté
we log<nous nous connectons
we don't log<nous ne nous pas connectons
do we log<nous nous connectons
we logged<nous avons connecté
we didn't log<nous n'avons pas connecté
did we log<nous avons connecté
we're logging<nous nous connectons
we are logging<nous nous connectons
are we logging<nous nous connectons
we've logged<nous avons connecté
we have logged<nous avons connecté
have we logged<nous avons connecté
they log<ils se connectent
they don't log<ils ne se pas connectent
do they log<ils se connectent
they logged<ils ont connecté
they didn't log<ils n'ont pas connecté
did they log<ils ont connecté
they're logging<ils se connectent
they are logging<ils se connectent
are they logging<ils se connectent
they've logged<ils ont connecté
they have logged<ils ont connecté
have they logged<ils ont connecté
he logs<il se connecte
he doesn't log<il ne se pas connecte
does he log<il se connecte
he logged<il a connecté
he didn't log<il n'a pas connecté
did he log<il a connecté
he's logging<il se connecte
he is logging<il se connecte
is he logging<il se connecte
he has logged<il a connecté
has he logged<il a connecté
she logs<elle se connecte
she doesn't log<elle ne se pas connecte
does she log<elle se connecte
she logged<elle a connecté
she didn't log<elle n'a pas connecté
did she log<elle a connecté
she's logging<elle se connecte
she is logging<elle se connecte
is she logging<elle se connecte
she has logged<elle a connecté
has she logged<elle a connecté
it logs<il se connecte
it doesn't log<il ne se pas connecte
does it log<il se connecte
it logged<il a connecté
it didn't log<il n'a pas connecté
did it log<il a connecté
it's logging<il se connecte
it is logging<il se connecte
is it logging<il se connecte
it has logged<il a connecté
has it logged<il a connecté
je me connecte>i log
je ne me pas connecte>i don't log
tu te connectes>you log
tu ne te pas connectes>you don't log
il se connecte>he logs
il ne se pas connecte>he doesn't log
elle se connecte>she logs
elle ne se pas connecte>she doesn't log
nous nous connectons>we log
nous ne nous pas connectons>we don't log
vous vous connectez>you log
vous ne vous pas connectez>you don't log
ils se connectent>they log
ils ne se pas connectent>they don't log
elles se connectent>they log
elles ne se pas connectent>they don't log
te connectes tu>do you log
vous connectez vous>do you log
est ce que tu te connectes>do you log
est ce que vous vous connectez>do you log
j'ai connecté>i logged
tu as connecté>you logged
il a connecté>he logged
elle a connecté>she logged
nous avons connecté>we logged
vous avez connecté>you logged
ils ont connecté>they logged
elles ont connecté>they logged
i am<je suis
i'm<je suis
you are<tu es
you're<tu es
he is<il est
he's<il est
she is<elle est
she's<elle est
it is<c'est
it's<c'est
that is<c'est
that's<c'est
this is<c'est
there is<il y a
there's<il y a
there are<il y a
we are<nous sommes
we're<nous sommes
they are<ils sont
they're<ils sont
who is<qui est
who's<qui est
what is<qu'est-ce que
what's<qu'est-ce que
where's<où est
how's<comment va
i was<j'étais
you were<tu étais
he was<il était
she was<elle était
it was<c'était
that was<c'était
we were<nous étions
they were<ils étaient
there was<il y avait
there were<il y avait
i'm not<je ne suis pas
i am not<je ne suis pas
you're not<tu n'es pas
you aren't<tu n'es pas
you are not<tu n'es pas
he's not<il n'est pas
he isn't<il n'est pas
she's not<elle n'est pas
she isn't<elle n'est pas
it's not<ce n'est pas
it isn't<ce n'est pas
that's not<ce n'est pas
that isn't<ce n'est pas
we're not<nous ne sommes pas
we aren't<nous ne sommes pas
they're not<ils ne sont pas
they aren't<ils ne sont pas
i wasn't<je n'étais pas
you weren't<tu n'étais pas
he wasn't<il n'était pas
she wasn't<elle n'était pas
it wasn't<ce n'était pas
that wasn't<ce n'était pas
we weren't<nous n'étions pas
they weren't<ils n'étaient pas
are you<tu es
is it<c'est
is he<il est
is she<elle est
are we<nous sommes
are they<ils sont
am i<je suis
was it<c'était
were you<tu étais
is that<c'est
is this<c'est
isn't it<n'est-ce pas
i have<j'ai
you have<tu as
he has<il a
she has<elle a
we have<nous avons
they have<ils ont
i've<j'ai
you've<tu as
we've<nous avons
they've<ils ont
i don't have<je n'ai pas
you don't have<tu n'as pas
he doesn't have<il n'a pas
she doesn't have<elle n'a pas
we don't have<nous n'avons pas
they don't have<ils n'ont pas
i haven't<je n'ai pas
you haven't<tu n'as pas
he hasn't<il n'a pas
we haven't<nous n'avons pas
they haven't<ils n'ont pas
i had<j'avais
you had<tu avais
he had<il avait
she had<elle avait
we had<nous avions
they had<ils avaient
do you have<tu as
does he have<il a
do we have<nous avons
do they have<ils ont
have you<tu as
did you have<tu avais
i can<je peux
can i<je peux
i can't<je ne peux pas
i cannot<je ne peux pas
you can<tu peux
can you<tu peux
you can't<tu ne peux pas
you cannot<tu ne peux pas
he can<il peut
can he<il peut
he can't<il ne peut pas
he cannot<il ne peut pas
she can<elle peut
can she<elle peut
she can't<elle ne peut pas
she cannot<elle ne peut pas
it can<il peut
can it<il peut
it can't<il ne peut pas
it cannot<il ne peut pas
we can<nous pouvons
can we<nous pouvons
we can't<nous ne pouvons pas
we cannot<nous ne pouvons pas
they can<ils peuvent
can they<ils peuvent
they can't<ils ne peuvent pas
they cannot<ils ne peuvent pas
i could<je pourrais
could i<je pourrais
i couldn't<je ne pourrais pas
you could<tu pourrais
could you<tu pourrais
you couldn't<tu ne pourrais pas
he could<il pourrait
could he<il pourrait
he couldn't<il ne pourrait pas
she could<elle pourrait
could she<elle pourrait
she couldn't<elle ne pourrait pas
it could<il pourrait
could it<il pourrait
it couldn't<il ne pourrait pas
we could<nous pourrions
could we<nous pourrions
we couldn't<nous ne pourrions pas
they could<ils pourraient
could they<ils pourraient
they couldn't<ils ne pourraient pas
i must<je dois
must i<je dois
i mustn't<je ne dois pas
you must<tu dois
must you<tu dois
you mustn't<tu ne dois pas
he must<il doit
must he<il doit
he mustn't<il ne doit pas
she must<elle doit
must she<elle doit
she mustn't<elle ne doit pas
it must<il doit
must it<il doit
it mustn't<il ne doit pas
we must<nous devons
must we<nous devons
we mustn't<nous ne devons pas
they must<ils doivent
must they<ils doivent
they mustn't<ils ne doivent pas
i should<je devrais
should i<je devrais
i shouldn't<je ne devrais pas
you should<tu devrais
should you<tu devrais
you shouldn't<tu ne devrais pas
he should<il devrait
should he<il devrait
he shouldn't<il ne devrait pas
she should<elle devrait
should she<elle devrait
she shouldn't<elle ne devrait pas
it should<il devrait
should it<il devrait
it shouldn't<il ne devrait pas
we should<nous devrions
should we<nous devrions
we shouldn't<nous ne devrions pas
they should<ils devraient
should they<ils devraient
they shouldn't<ils ne devraient pas
i will<je vais
will i<je vais
i'll<je vais
i won't<je ne vais pas
you will<tu vas
will you<tu vas
you'll<tu vas
you won't<tu ne vas pas
he will<il va
will he<il va
he'll<il va
he won't<il ne va pas
she will<elle va
will she<elle va
she'll<elle va
she won't<elle ne va pas
it will<il va
will it<il va
it'll<il va
it won't<il ne va pas
we will<nous allons
will we<nous allons
we'll<nous allons
we won't<nous n'allons pas
they will<ils vont
will they<ils vont
they'll<ils vont
they won't<ils ne vont pas
i would<je voudrais
would i<je voudrais
i wouldn't<je ne voudrais pas
i'd<je voudrais
you would<tu voudrais
would you<tu voudrais
you wouldn't<tu ne voudrais pas
you'd<tu voudrais
he would<il voudrait
would he<il voudrait
he wouldn't<il ne voudrait pas
he'd<il voudrait
she would<elle voudrait
would she<elle voudrait
she wouldn't<elle ne voudrait pas
she'd<elle voudrait
it would<il voudrait
would it<il voudrait
it wouldn't<il ne voudrait pas
it'd<il voudrait
we would<nous voudrions
would we<nous voudrions
we wouldn't<nous ne voudrions pas
we'd<nous voudrions
they would<ils voudraient
would they<ils voudraient
they wouldn't<ils ne voudraient pas
they'd<ils voudraient
i have to<je dois
i don't have to<je n'ai pas besoin de
i had to<j'ai dû
i am going to<je vais
i'm going to<je vais
i'm gonna<je vais
i gonna<je vais
you have to<tu dois
you don't have to<tu n'as pas besoin de
you had to<tu as dû
you are going to<tu vas
you're going to<tu vas
you're gonna<tu vas
you gonna<tu vas
he has to<il doit
he doesn't have to<il n'a pas besoin de
he is going to<il va
he's going to<il va
he's gonna<il va
he gonna<il va
she has to<elle doit
she doesn't have to<elle n'a pas besoin de
she is going to<elle va
she's going to<elle va
she's gonna<elle va
she gonna<elle va
it has to<il doit
it doesn't have to<il n'a pas besoin de
it is going to<il va
it's going to<il va
it's gonna<il va
it gonna<il va
we have to<nous devons
we don't have to<nous n'avons pas besoin de
we had to<nous avons dû
we are going to<nous allons
we're going to<nous allons
we're gonna<nous allons
we gonna<nous allons
they have to<ils doivent
they don't have to<ils n'ont pas besoin de
they had to<ils ont dû
they are going to<ils vont
they're going to<ils vont
they're gonna<ils vont
they gonna<ils vont
tu es>you are
il est>he is
elle est>she is
nous sommes>we are
vous êtes>you are
ils sont>they are
elles sont>they are
c'est>it's
ce n'est pas>it's not
tu n'es pas>you're not
il n'est pas>he isn't
elle n'est pas>she isn't
nous ne sommes pas>we aren't
ils ne sont pas>they aren't
j'étais>i was
tu étais>you were
il était>he was
elle était>she was
c'était>it was
nous étions>we were
ils étaient>they were
j'ai>i have
tu as>you have
il a>he has
elle a>she has
nous avons>we have
vous avez>you have
ils ont>they have
je n'ai pas>i don't have
tu n'as pas>you don't have
il n'a pas>he doesn't have
nous n'avons pas>we don't have
j'avais>i had
tu avais>you had
il avait>he had
je peux>i can
tu peux>can you
il peut>he can
nous pouvons>we can
vous pouvez>can you
ils peuvent>they can
je ne peux pas>i can't
tu ne peux pas>you can't
il ne peut pas>he can't
nous ne pouvons pas>we can't
je dois>i have to
tu dois>you have to
il doit>he has to
nous devons>we have to
ils doivent>they have to
je devrais>i should
tu devrais>you should
je pourrais>i could
tu pourrais>could you
je voudrais>i would like
tu voudrais>would you like
il y a>there is
il y avait>there was
il n'y a pas>there isn't
qu'est ce que c'est>what is it
qu'est ce que tu>what do you
m'aider>help me
t'aider>help you
m'aide>help me
me aider>help me
m'attendre>wait for me
m'invite>invite me
m'inviter>invite me
m'envoyer>send me
m'envoie>send me
me dire>tell me
me donner>give me
me répondre>answer me
gj<bien joué
good job<bien joué
well done<bien joué
nice one<bien joué
nice try<bien tenté
nt<bien tenté
ns<beau coup
wp<bien joué
ggwp<bien joué
gz<félicitations
grats<félicitations
gratz<félicitations
congrats<félicitations
ty<merci
tyvm<merci beaucoup
tks<merci
thnx<merci
np<pas de souci
no worries<pas de souci
nvm<laisse tomber
never mind<laisse tomber
nevermind<laisse tomber
brb<je reviens
afk<absent
omg<oh mon dieu
oh my god<oh mon dieu
idk<je sais pas
imo<à mon avis
imho<à mon humble avis
in my opinion<à mon avis
tbh<franchement
to be honest<franchement
honestly<honnêtement
btw<au fait
by the way<au fait
irl<dans la vraie vie
rn<maintenant
asap<au plus vite
oom<plus de mana
op<abusé
ez pz<trop facile
easy<facile
sry<désolé
srry<désolé
soz<désolé
mb<ma faute
my bad<ma faute
my fault<ma faute
your fault<ta faute
oh well<tant pis
too bad<dommage
so what<et alors
so far<jusqu'ici
ik<je sais
ikr<je sais, hein
ofc<bien sûr
obv<évidemment
obviously<évidemment
def<clairement
definitely<clairement
prob<probablement
probs<probablement
bout<à propos
about<à propos de
tho<pourtant
though<pourtant
although<bien que
however<cependant
lil<petit
yo<salut
sup<quoi de neuf
wassup<quoi de neuf
whats up<quoi de neuf
hru<comment vas-tu
how r u<comment vas-tu
hbu<et toi
wbu<et toi
dam<punaise
damn<punaise
dang<zut
crap<zut
shit<merde
wow<waouh
whoa<waouh
hmm<hmm
huh<hein
nah<nan
nope<non
yup<ouais
yea<ouais
yeah<ouais
ya<ouais
aye<oui
mate<mec
bruh<mec
fam<pote
bro<frère
lmao<mdr
rofl<mdr
lol<mdr
lul<mdr
haha<haha
hehe<hehe
toxic<toxique
rekt<détruit
carry<porter l'équipe
carried<porté
camping<en train de camper
camp<camper
dc<déconnecté
dc'd<déconnecté
disconnected<déconnecté
kick<expulser
kicked<expulsé
banned<banni
reset<réinitialisation
gl hf<bonne chance et amuse-toi
glhf<bonne chance et amuse-toi
gl<bonne chance
hf<amuse-toi bien
gn<bonne nuit
gnight<bonne nuit
g2g<je dois y aller
gtg<je dois y aller
got to go<je dois y aller
gotta go<je dois y aller
ttyl<à plus tard
talk to you later<à plus tard
cya<à plus
see ya<à plus
laters<à plus
later<à plus tard
wb<bon retour
welcome back<bon retour
big deal<grosse affaire
a big deal<une grosse affaire
no big deal<pas grave
deal<affaire
what the<c'est quoi ce
what the hell<c'est quoi ce bordel
what the heck<c'est quoi ce truc
wtf<c'est quoi ce bordel
are you kidding<tu rigoles
no kidding<sans blague
for real<sérieusement
seriously<sérieusement
really<vraiment
what's the point<à quoi bon
at least<au moins
at most<au plus
in fact<en fait
for example<par exemple
for instance<par exemple
in case<au cas où
just in case<au cas où
as usual<comme d'habitude
make sure<assure-toi
take a look<regarde
check it out<regarde ça
check this<regarde ça
hang on<attends
hold on<attends
hold up<attends
give me a sec<donne-moi une seconde
one sec<une seconde
a sec<une seconde
just a sec<juste une seconde
just a moment<juste un instant
be right there<j'arrive
on my way<j'arrive
omw<j'arrive
coming<j'arrive
how come<comment ça se fait
how about<et si
what about<et
you guys<vous
you all<vous tous
all of you<vous tous
each other<l'un l'autre
a couple of<quelques
a couple<quelques
the other day<l'autre jour
all day<toute la journée
every day<tous les jours
every time<à chaque fois
next time<la prochaine fois
last time<la dernière fois
first time<première fois
this time<cette fois
any time<à tout moment
sign up<s'inscrire
party up<se grouper
group up<se grouper
queue up<se mettre en file
hop in<monte
join us<rejoins-nous
join me<rejoins-moi
join the group<rejoins le groupe
invite me<invite-moi
invite him<invite-le
invite her<invite-la
inv me<invite-moi
port me<téléporte-moi
summon me<invoque-moi
res me<ressuscite-moi
rez me<ressuscite-moi
heal me<soigne-moi
buff me<buff-moi
help me<aide-moi
follow me<suis-moi
wait for me<attends-moi
wait for us<attendez-nous
come with me<viens avec moi
come here<viens ici
go away<va-t'en
shut up<tais-toi
calm down<calme-toi
relax<détends-toi
chill<détends-toi
good luck<bonne chance
have fun<amuse-toi bien
enjoy<profite
take care<prends soin de toi
be careful<fais attention
watch out<attention
look out<attention
heads up<attention
incoming<ça arrive
inc<ça arrive
oh no<oh non
oh yes<oh oui
oh yeah<oh ouais
oh wow<oh waouh
oh my<oh là là
oh dear<oh là là
ouch<aïe
oops<oups
whoops<oups
sorry about that<désolé pour ça
sorry for the wait<désolé pour l'attente
thanks for the help<merci pour l'aide
thanks for the invite<merci pour l'invitation
thanks for the heal<merci pour le soin
thanks for waiting<merci d'avoir attendu
thanks for coming<merci d'être venu
thanks a lot<merci beaucoup
thank you so much<merci beaucoup
many thanks<merci beaucoup
much appreciated<très apprécié
appreciate it<je l'apprécie
you're welcome<de rien
you are welcome<de rien
anytime<quand tu veux
no prob<pas de problème
no problem<pas de problème
sure thing<bien sûr
of course<bien sûr
absolutely<absolument
exactly<exactement
right<exact
correct<correct
that's right<c'est exact
that's true<c'est vrai
that's cool<c'est cool
that's fine<ça va
that's ok<c'est ok
that's crazy<c'est fou
that's insane<c'est de la folie
that's great<c'est génial
that's awesome<c'est génial
that's nice<c'est sympa
that's bad<c'est mauvais
that's sad<c'est triste
that's funny<c'est drôle
that's it<c'est tout
that's all<c'est tout
that's why<c'est pour ça
that is why<c'est pour ça
i get it<je comprends
got it<compris
i got it<j'ai compris
makes sense<ça a du sens
fair enough<d'accord
fair point<bien vu
good point<bien vu
good idea<bonne idée
great idea<super idée
sounds good<ça marche
sounds great<ça marche
sounds fun<ça a l'air fun
looks good<ça a l'air bien
looks like<on dirait
seems like<on dirait
it looks like<on dirait
it seems<il semble
doesn't work<ne marche pas
not working<ne marche pas
is broken<est cassé
is bugged<est buggé
bugged<buggé
glitched<buggé
laggy<qui lag
lagging<qui lag
so laggy<ça lag trop
ptr<ptr
new patch<nouveau patch
hotfix<correctif
maintenance<maintenance
downtime<indisponibilité
pop<pop
popped<lancé
queue<file d'attente
queued<en file
in queue<en file d'attente
waiting for queue<attend la file
long queue<longue file
short queue<courte file
need heals<besoin de soins
need healer<besoin d'un soigneur
need tank<besoin d'un tank
need dps<besoin de dps
need more<besoin de plus
need one more<il en faut un de plus
need 1 more<il en faut 1 de plus
one more<encore un
1 more<encore 1
two more<encore deux
2 more<encore 2
last spot<dernière place
last one<le dernier
any healers<des soigneurs ?
any tanks<des tanks ?
any dps<des dps ?
anyone<quelqu'un
anybody<quelqu'un
someone<quelqu'un
somebody<quelqu'un
everyone<tout le monde
everybody<tout le monde
nobody<personne
no one<personne
noone<personne
looking for more<cherche plus
looking for group<cherche un groupe
lfg<cherche un groupe
lfm<cherche des joueurs
lf1m<cherche un joueur
lf2m<cherche 2 joueurs
lf3m<cherche 3 joueurs
wts<vend
wtb<achète
wtt<échange
lfw<cherche du travail
pst<chuchotez-moi
pm me<chuchote-moi
whisper me<chuchote-moi
dm me<chuchote-moi
msg me<chuchote-moi
pm<chuchotement
tank<tank
heals<soins
healer<soigneur
dps<dps
lockout<verrouillage
saved<verrouillé
unsaved<non verrouillé
loot<butin
loots<butins
looted<looté
loot rules<règles de butin
master loot<butin par le chef
need before greed<besoin avant cupidité
free for all<chacun pour soi
ffa<chacun pour soi
roll<jet
rolled<a fait un jet
rolling<fait un jet
roll need<jet besoin
roll greed<jet cupidité
greed<cupidité
need<besoin
pass<passe
passed<passé
winner<gagnant
loser<perdant
drop<butin
drops<butins
dropped<a lâché
farm<farm
farming<farm
grind<grind
grinding<grind
leveling<montée de niveau
levelling<montée de niveau
power leveling<niveau rapide
pl<niveau rapide
boost<boost
boosting<boost
carry run<run porté
run<run
runs<runs
clear<nettoyer
cleared<nettoyé
full clear<nettoyage complet
skip<sauter
skips<sauts
wipe<wipe
wiped<a wipe
we wiped<on a wipe
another wipe<encore un wipe
ress<résurrection
res<résurrection
rez<résurrection
resurrect<ressusciter
release<libérer
corpse run<course au cadavre
spirit<esprit
ghost<fantôme
dead<mort
dying<en train de mourir
died<est mort
i'm dead<je suis mort
almost dead<presque mort
low hp<peu de vie
low health<peu de vie
low mana<peu de mana
no mana<plus de mana
out of mana<plus de mana
drinking<en train de boire
eating<en train de manger
need to drink<besoin de boire
drink<boire
food<nourriture
water<eau
mana break<pause mana
break<pause
take a break<fais une pause
short break<courte pause
5 min<5 min
5 mins<5 min
two mins<deux minutes
few mins<quelques minutes
a few minutes<quelques minutes
in a bit<dans un instant
in a minute<dans une minute
in 5<dans 5
in five<dans cinq
ready<prêt
ready check<vérification de préparation
not ready<pas prêt
im ready<je suis prêt
i'm ready<je suis prêt
are you ready<es-tu prêt
everyone ready<tout le monde est prêt
lets go<allons-y
let's go<allons-y
lets do it<faisons-le
let's do it<faisons-le
go go go<go go go
pull<pull
pulling<en train de pull
pulled<a pull
pull now<pull maintenant
dont pull<ne pull pas
don't pull<ne pull pas
wait for mana<attends le mana
wait for heals<attends les soins
wait for the tank<attends le tank
tank first<le tank d'abord
focus<focus
focus fire<focus
kill first<tuer en premier
kill the healer<tue le soigneur
kill the healers<tuez les soigneurs
kill the flag carrier<tuez le porteur du drapeau
kill fc<tuez le porteur
kill the fc<tuez le porteur
cc<contrôle
crowd control<contrôle de foule
stun<étourdissement
stunned<étourdi
root<racine
rooted<enraciné
sheep<métamorphose
sheeped<métamorphosé
fear<peur
feared<effrayé
slow<ralentissement
slowed<ralenti
silence<silence
silenced<réduit au silence
interrupt<interruption
interrupted<interrompu
taunt<provocation
aggro<aggro
threat<menace
aoe<zone
dot<dot
hot<hot
cooldown<recharge
cooldowns<recharges
on cooldown<en recharge
cd<recharge
cds<recharges
buff<buff
buffs<buffs
debuff<debuff
debuffs<debuffs
buffed<buffé
nerf<nerf
nerfed<nerfé
overpowered<trop puissant
broken<cassé
balanced<équilibré
imbalanced<déséquilibré
meta<méta
spec<spé
specs<spés
respec<changer de spé
talents<talents
talent<talent
build<build
rotation<rotation
priority<priorité
gear<équipement
geared<équipé
ilvl<ilvl
bis<meilleur équipement
best in slot<meilleur équipement
upgrade<amélioration
upgrades<améliorations
enchant<enchantement
enchants<enchantements
gem<gemme
gems<gemmes
socket<châsse
sockets<châsses
reforge<reforge
flask<flacon
flasks<flacons
elixir<élixir
potion<potion
potions<potions
pot<potion
pots<potions
food buff<buff de nourriture
consumables<consommables
consumable<consommable
repair<réparer
repairs<réparations
vendor<marchand
vendor trash<déchets à vendre
trash<déchets
grey<gris
gray<gris
white<blanc
green<vert
blue<bleu
purple<violet
epic<épique
epics<épiques
legendary<légendaire
rare<rare
common<commun
uncommon<peu commun
heirloom<héritage
bind on pickup<lié quand ramassé
bop<lié quand ramassé
bind on equip<lié quand équipé
boe<lié quand équipé
soulbound<lié
tradeable<échangeable
tradable<échangeable
auction house<hôtel des ventes
auction<enchère
ah<hôtel des ventes
mailbox<boîte aux lettres
mail<courrier
bank<banque
guild bank<banque de guilde
inn<auberge
innkeeper<aubergiste
hearth<foyer
hearthstone<pierre de foyer
flight master<maître de vol
flight path<trajet de vol
portal<portail
portals<portails
teleport<téléportation
summon<invocation
summoning<invocation
summoning stone<pierre d'invocation
meeting stone<pierre de rencontre
graveyard<cimetière
spirit healer<guérisseur des âmes
corpse<cadavre
zone<zone
map<carte
minimap<minicarte
tooltip<infobulle
addon<addon
addons<addons
ui<interface
interface<interface
macro<macro
macros<macros
keybind<raccourci
keybinds<raccourcis
bind<raccourci
bindings<raccourcis
settings<réglages
options<options
config<configuration
setup<configuration
install<installer
installed<installé
update<mise à jour
updated<mis à jour
download<télécharger
downloaded<téléchargé
version<version
patch<mise à jour
fps<fps
ping<ping
lag<lag
latency<latence
crash<plantage
crashed<planté
freeze<gel
frozen<gelé
stuck<bloqué
unstuck<débloquer
i'm stuck<je suis bloqué
i am stuck<je suis bloqué
we're stuck<on est bloqués
bugged out<buggé
zero<zéro
one<un
two<deux
three<trois
four<quatre
five<cinq
six<six
seven<sept
eight<huit
nine<neuf
ten<dix
eleven<onze
twelve<douze
thirteen<treize
fourteen<quatorze
fifteen<quinze
sixteen<seize
seventeen<dix-sept
eighteen<dix-huit
nineteen<dix-neuf
twenty<vingt
thirty<trente
forty<quarante
fifty<cinquante
sixty<soixante
seventy<soixante-dix
eighty<quatre-vingts
ninety<quatre-vingt-dix
hundred<cent
thousand<mille
million<million
first<premier
second<deuxième
third<troisième
last<dernier
next<prochain
red<rouge
yellow<jaune
black<noir
orange<orange
pink<rose
brown<marron
monday<lundi
tuesday<mardi
wednesday<mercredi
thursday<jeudi
friday<vendredi
saturday<samedi
sunday<dimanche
today<aujourd'hui
tomorrow<demain
yesterday<hier
tonight<ce soir
morning<matin
evening<soir
afternoon<après-midi
night<nuit
weekend<week-end
week<semaine
month<mois
year<année
mdr>lol
ptdr>lmao
tkt>no worries
tqt>no worries
jsp>idk
jvais>i'm going to
jpeux>i can
jsuis>i am
chui>i am
chuis>i am
dsl>sorry
wsh>yo
ouais>yeah
ouai>yeah
nan>nope
grave>totally
trop bien>awesome
c'est abusé>that's crazy
abusé>crazy
de ouf>crazy
ouf>crazy
ça roule>sounds good
ça marche>sounds good
frr>bro
frero>bro
mon frère>bro
ma gueule>man
gars>guy
les gars>guys
meuf>girl
mec>dude
truc>thing
un truc>a thing
un peu>a bit
carrément>totally
franchement>honestly
sérieux>seriously
vraiment>really
en vrai>honestly
du coup>so
enfin>anyway
bref>anyway
bon>well
ben>well
bah>well
euh>uh
hein>huh
quoi>what
genre>like
style>like
j'ai pas>i don't have
j'sais pas>i don't know
je sais pas>i don't know
j'comprends pas>i don't understand
je comprends pas>i don't understand
chelou>weird
relou>annoying
nul>bad
naze>bad
pourri>rotten
cool>cool
sympa>nice
génial>great
super>great
top>great
excellent>excellent
parfait>perfect
bien joué>well played
bravo>well done
félicitations>congratulations
merci>thanks
merci beaucoup>thank you very much
merci bien>thanks a lot
de rien>you're welcome
avec plaisir>with pleasure
pas de quoi>you're welcome
s'il te plaît>please
s'il vous plaît>please
stp>please
svp>please
pardon>sorry
désolé>sorry
excuse moi>excuse me
excusez moi>excuse me
bonne chance>good luck
bon courage>good luck
bonne soirée>have a good evening
bonne nuit>good night
à demain>see you tomorrow
à plus tard>see you later
à tout à l'heure>see you later
à bientôt>see you soon
à la prochaine>see you next time
salut tout le monde>hi everyone
bonjour à tous>hello everyone
salut les gars>hi guys
coucou tout le monde>hey everyone
je reviens>brb
je suis là>i'm here
je suis afk>i'm afk
je suis en retard>i'm late
j'arrive>i'm coming
j'arrive tout de suite>i'm coming right now
un instant>one moment
une seconde>one second
attends moi>wait for me
attendez moi>wait for me
attendez nous>wait for us
suis moi>follow me
suivez moi>follow me
viens avec moi>come with me
viens ici>come here
invite moi>invite me
invitez moi>invite me
soigne moi>heal me
aide moi>help me
aidez moi>help me
rez moi>res me
ressuscite moi>res me
tu es prêt>are you ready
vous êtes prêts>are you ready
on est prêts>we're ready
je suis prêt>i'm ready
c'est parti>let's go
on y va>let's go
allons y>let's go
on commence>let's start
on peut commencer>we can start
on attend>we wait
on attend un peu>we wait a bit
encore un>one more
il en faut un>we need one
il nous faut un>we need one
il me faut>i need
il te faut>you need
il manque un>one is missing
il manque un soigneur>a healer is missing
il manque un tank>a tank is missing
cherche un tank>looking for a tank
cherche un soigneur>looking for a healer
cherche un groupe>looking for a group
cherche une guilde>looking for a guild
cherche des joueurs>looking for players
je cherche un tank>i'm looking for a tank
je cherche un soigneur>i'm looking for a healer
combien tu veux>how much do you want
c'est combien>how much is it
c'est trop cher>it's too expensive
c'est pas cher>it's cheap
c'est gratuit>it's free
je te le donne>i'll give it to you
je te l'offre>i'll give it to you
tu veux quoi>what do you want
qu'est ce que tu veux>what do you want
qu'est ce que tu fais>what are you doing
tu fais quoi>what are you doing
tu es où>where are you
t'es où>where are you
où es tu>where are you
je suis à>i'm in
je suis dans>i'm in
je suis en>i'm in
je suis en combat>i'm in combat
je suis en donjon>i'm in a dungeon
je suis en bg>i'm in a bg
je suis occupé>i'm busy
je suis indisponible>i'm unavailable
je suis pas là>i'm not here
je ne suis pas là>i'm not here
pas maintenant>not now
plus tard>later
tout à l'heure>later
tout de suite>right away
en ce moment>right now
pour l'instant>for now
ce soir>tonight
demain soir>tomorrow night
ce week end>this weekend
la semaine prochaine>next week
la prochaine fois>next time
la dernière fois>last time
une autre fois>another time
mace<masse
dagger<dague
daggers<dagues
axe<hache
axes<haches
bow<arc
crossbow<arbalète
gun<fusil
staff<bâton
wand<baguette
shield<bouclier
helm<casque
helmet<casque
shoulders<épaulières
chest<torse
robe<robe
cloak<cape
cape<cape
bracers<bracelets
gloves<gants
belt<ceinture
pants<pantalon
legs<jambières
boots<bottes
ring<anneau
rings<anneaux
necklace<collier
neck<cou
trinket<bijou
trinkets<bijoux
weapon<arme
weapons<armes
armor<armure
armour<armure
plate<plaques
leather<cuir
cloth<tissu
bag<sac
bags<sacs
herb<herbe
herbs<herbes
ore<minerai
bar<lingot
bars<lingots
skin<peau
hide<peau
recipe<recette
recipes<recettes
pattern<patron
quest<quête
quests<quêtes
dungeon<donjon
dungeons<donjons
instance<instance
raid<raid
raids<raids
pet<familier
pets<familiers
mount<monture
mounts<montures
flag<drapeau
guard<garde
guards<gardes
captain<capitaine
chief<chef
king<roi
queen<reine
lord<seigneur
master<maître
trainer<instructeur
merchant<marchand
player<joueur
players<joueurs
character<personnage
characters<personnages
class<classe
race<race
faction<faction
guild<guilde
guilds<guildes
team<équipe
teams<équipes
map<carte
city<ville
cities<villes
town<ville
village<village
camp<camp
tower<tour
towers<tours
bridge<pont
gate<porte
gates<portes
door<porte
house<maison
building<bâtiment
cave<grotte
forest<forêt
mountain<montagne
mountains<montagnes
river<rivière
lake<lac
sea<mer
island<île
desert<désert
snow<neige
ice<glace
fire<feu
water<eau
earth<terre
wind<vent
light<lumière
dark<sombre
darkness<ténèbres
shadow<ombre
holy<sacré
nature<nature
arcane<arcane
frost<givre
what a joke<quelle blague
what a shame<quel dommage
what a pity<quel dommage
what a mess<quel bazar
what a day<quelle journée
what a game<quel match
joke<blague
jokes<blagues
have time<avoir le temps
do you have time<tu as le temps
i have time<j'ai le temps
i don't have time<je n'ai pas le temps
i have no time<je n'ai pas le temps
no time<pas le temps
not enough time<pas assez de temps
look at<regarde
looking at<regarde
what he's doing<ce qu'il fait
what she's doing<ce qu'elle fait
what i'm doing<ce que je fais
what you're doing<ce que tu fais
what we're doing<ce que nous faisons
what they're doing<ce qu'ils font
what he did<ce qu'il a fait
what i did<ce que j'ai fait
what you did<ce que tu as fait
what do you want<ce que tu veux
what do you mean<qu'est-ce que tu veux dire
what do you think<qu'en penses-tu
what happened<ce qui s'est passé
what is happening<ce qui se passe
what's happening<ce qui se passe
what's wrong<qu'est-ce qui ne va pas
what's the matter<qu'est-ce qui se passe
where are you<où es-tu
where are we<où sommes-nous
where is he<où est-il
who are you<qui es-tu
who is that<qui est-ce
how do i<comment je peux
how do you<comment tu peux
how can i<comment je peux
why are you<pourquoi es-tu
why is it<pourquoi c'est
why not<pourquoi pas
when is it<quand est-ce
when do you<quand est-ce que tu
are down<sont en panne
is down<est en panne
went down<est tombé en panne
goes down<tombe en panne
died<est mort
dies<meurt
was killed<a été tué
were killed<ont été tués
got killed<s'est fait tuer
we'll see you<on se voit
i'll see you<je te verrai
see you<à plus
can you invite me<tu peux m'inviter
can you help me<tu peux m'aider
can you heal me<tu peux me soigner
can you summon me<tu peux m'invoquer
can you port me<tu peux me téléporter
can you res me<tu peux me ressusciter
can you buff me<tu peux me buffer
can you wait<tu peux attendre
can you come<tu peux venir
can you join<tu peux rejoindre
can i join<je peux rejoindre
can i invite<je peux inviter
can i have<je peux avoir
can i get<je peux avoir
may i<puis-je
could you help me<pourrais-tu m'aider
could you invite me<pourrais-tu m'inviter
could i join<pourrais-je rejoindre
please invite me<invite-moi s'il te plaît
please help<aide s'il te plaît
please wait<attends s'il te plaît
please heal<soigne s'il te plaît
please come<viens s'il te plaît
please join<rejoins s'il te plaît
for me<pour moi
for you<pour toi
for him<pour lui
for her<pour elle
for us<pour nous
for them<pour eux
to me<à moi
to you<à toi
to him<à lui
to her<à elle
to us<à nous
to them<à eux
with me<avec moi
with you<avec toi
with him<avec lui
with her<avec elle
with us<avec nous
with them<avec eux
from me<de moi
from you<de toi
about me<sur moi
about you<sur toi
about it<à ce sujet
because of<à cause de
instead of<au lieu de
in front of<devant
next to<à côté de
according to<selon
none of the<aucun des
none of them<aucun d'eux
none of us<aucun de nous
none of you<aucun de vous
none of<aucun de
none<aucun
all of the<tous les
all of them<tous
all of us<nous tous
all of you<vous tous
some of the<certains des
some of them<certains
one of the<un des
one of them<l'un d'eux
most of the<la plupart des
most of them<la plupart
half of the<la moitié des
each of the<chacun des
any of the<n'importe lequel des
from level<dès le niveau
from lvl<dès le niveau
at level<au niveau
level up<monter de niveau
levels<niveaux
i don't have any<je n'ai pas de
you don't have any<tu n'as pas de
he doesn't have any<il n'a pas de
she doesn't have any<elle n'a pas de
we don't have any<nous n'avons pas de
they don't have any<ils n'ont pas de
there isn't any<il n'y a pas de
there aren't any<il n'y a pas de
do you have any<tu as des
did you get any<tu as eu des
any<des
unlocked<débloqué
unlock<débloquer
unlocks<débloque
locked<verrouillé
lock<verrouiller
deliverable<livrable
deliverables<livrables
heirloom<héritage
heirlooms<héritages
vanity<vanity
tab<onglet
tabs<onglets
collection<collection
show up<apparaître
shows up<apparaît
showed up<est apparu
doesn't show up<n'apparaît pas
does not show up<n'apparaît pas
didn't show up<n'est pas apparu
still<toujours
is there something<y a-t-il quelque chose
is there anything<y a-t-il quelque chose
is there a way<y a-t-il un moyen
is there any<y a-t-il des
are there any<y a-t-il des
i need to do<que je dois faire
what i need to do<ce que je dois faire
something i need<quelque chose dont j'ai besoin
so i bought<alors j'ai acheté
i bought<j'ai acheté
i sold<j'ai vendu
i got<j'ai obtenu
i found<j'ai trouvé
i lost<j'ai perdu
i forgot<j'ai oublié
i thought<je pensais
i told<j'ai dit
i asked<j'ai demandé
a new one<un nouveau
new one<nouveau
another one<un autre
the other one<l'autre
this one<celui-ci
that one<celui-là
which one<lequel
the one<celui
each one<chacun
every one<chacun
one of them<l'un d'eux
cosmetics<cosmétiques
cosmetic<cosmétique
transmog<transmog
odd<bizarre
weird<bizarre
strange<étrange
nop<non
yep<oui
do you have bots<tu as des bots
toon<perso
toons<persos
alt<alt
alts<alts
my other toon<mon autre perso
my main<mon main
relog<me reconnecter
relogs<se reconnecte
relogged<reconnecté
relogging<me reconnecter
relog into<me reconnecter sur
relog on<me reconnecter sur
log into<se connecter sur
log in to<se connecter à
into him<sur lui
into her<sur elle
into it<dedans
into them<sur eux
glitch<bug
glitches<bugs
glitched<buggé
all i had to do was<il m'a suffi de
all i had to do is<il me suffit de
all i had to do<tout ce que j'avais à faire
all you have to do is<il te suffit de
all you have to do<tout ce que tu as à faire
all you need to do is<il te suffit de
all you need to do<tout ce que tu dois faire
all you need is<il te suffit de
all i need is<il me faut juste
all i need to do is<il me suffit de
all we need to do is<il nous suffit de
all we have to do is<il nous suffit de
all i did was<tout ce que j'ai fait, c'est
all it takes is<il suffit de
that'll do it<ça devrait le faire
that will do it<ça devrait le faire
that'll do<ça suffira
that should do it<ça devrait le faire
that did it<ça a fait l'affaire
that does it<ça fait l'affaire
that fixed it<ça l'a réglé
that fixes it<ça règle le problème
that'll fix it<ça va régler ça
that should fix it<ça devrait régler ça
that'll work<ça marchera
that will work<ça marchera
that should work<ça devrait marcher
gonna afk<je m'absente
gonna go afk<je m'absente
going afk<je m'absente
i'm afk<je suis absent
afk for<absent pour
go afk<m'absenter
back from afk<de retour
im back<je suis de retour
i'm back<je suis de retour
##GEN-END##
]]

local ELISION = {
  ["l'"] = "the ", ["d'"] = "of ", ["j'"] = "i ", ["qu'"] = "that ",
  ["m'"] = "me ", ["t'"] = "you ", ["s'"] = "", ["n'"] = "", ["c'"] = "it ",
}

local ACCENTS = {
  { "\195\169", "e" }, { "\195\168", "e" }, { "\195\170", "e" }, { "\195\171", "e" },
  { "\195\160", "a" }, { "\195\162", "a" }, { "\195\174", "i" }, { "\195\175", "i" },
  { "\195\180", "o" }, { "\195\185", "u" }, { "\195\187", "u" }, { "\195\167", "c" },
  { "\195\137", "e" }, { "\195\136", "e" }, { "\195\138", "e" }, { "\195\128", "a" },
  { "\195\135", "c" }, { "\226\128\153", "'" },
}

local function Norm(s)
  s = s:lower()
  if s:find("[\128-\255]") then
    for _, p in ipairs(ACCENTS) do s = s:gsub(p[1], p[2]) end
  end
  s = s:gsub("-", " ")
  return s
end

----------------------------------------------------------------------
-- Construction des dictionnaires
----------------------------------------------------------------------
local frEn, enFr = {}, {}
local maxN = { fren = 1, enfr = 1 }

local function CountWords(key)
  local _, n = key:gsub(" ", "")
  return n + 1
end

local userEntries = { fren = {}, enfr = {} }
local function ApplyUser(dir)
  local d = (dir == "fren") and frEn or enFr
  for k, v in pairs(userEntries[dir]) do
    d[k] = v
    local _, n = k:gsub(" ", "")
    if n + 1 > maxN[dir] then maxN[dir] = n + 1 end
  end
end

local built = false
local INF, ENV, GERUND = {}, {}, {}
local function EnsureBuilt()
  if built then return end
  built = true
  for line in GLOSSARY:gmatch("[^\n]+") do
    if line:sub(1, 7) == "##INF##" then
      for w in line:gmatch("%S+") do INF[Norm(w)] = true end
    elseif line:sub(1, 7) == "##ENV##" then
    for w in line:gmatch("%S+") do ENV[w] = true end
    elseif line:sub(1, 7) == "##ING##" then
    for w in line:gmatch("%S+") do GERUND[w] = true end
    end
    local a, sep, b = line:match("^(.-)([|<>])(.*)$")
    if a and a ~= "" then
      if sep == "|" or sep == ">" then
        local k = Norm(a)
        if frEn[k] == nil then frEn[k] = b end
        maxN.fren = math.max(maxN.fren, CountWords(k))
      end
      if sep == "|" then
        local k = Norm(b)
        if enFr[k] == nil then enFr[k] = a end
        maxN.enfr = math.max(maxN.enfr, CountWords(k))
      elseif sep == "<" then
        local k = Norm(a)
        if enFr[k] == nil then enFr[k] = b end
        maxN.enfr = math.max(maxN.enfr, CountWords(k))
      end
    end
  end
  ApplyUser("fren")
  ApplyUser("enfr")
end

-- dictionnaire personnel : TW.LearnEntry("enfr", "big deal", "grosse affaire")
function TW.LearnEntry(dir, key, value)
  if not userEntries[dir] or not key or key == "" or not value then return false end
  userEntries[dir][Norm(key)] = value
  if built then ApplyUser(dir) end
  return true
end

function TW.ForgetEntry(dir, key)
  if not userEntries[dir] or not key then return false end
  local k = Norm(key)
  local had = userEntries[dir][k] ~= nil
  userEntries[dir][k] = nil
  if built and had then
    local d = (dir == "fren") and frEn or enFr
    d[k] = nil -- le glossaire d'origine revient après /reload
  end
  return had
end

local dicts = { fren = frEn, enfr = enFr }

----------------------------------------------------------------------
-- Moteur
----------------------------------------------------------------------
local atStartFlag = true
local function MatchCase(orig, tr)
  if tr == "" then return "" end
  -- le pronom anglais "I" / "I'm" prend une majuscule partout : ne pas la copier en français
  if (orig == "I" or orig:sub(1, 2) == "I'") and not atStartFlag then return tr end
  if #orig > 1 and orig:match("^[%u]+$") then
    if not tr:find("[\128-\255]") and not tr:find(" ") then return tr:upper() end
    if not atStartFlag then return tr end
  end
  if orig:match("^%u") and tr:byte(1) < 128 then
    return tr:sub(1, 1):upper() .. tr:sub(2)
  end
  return tr
end

-- repli : gros dictionnaires FR<->EN (mots absents du glossaire)
local bulk = {}
local function BulkLookup(dir, nw)
  local b = bulk[dir]
  if not b then
    b = {}
    local src = (dir == "fren") and TW.BulkFREN or TW.BulkENFR
    for line in (src or ""):gmatch("[^\n]+") do
      local k, v = line:match("^(.-)|(.*)$")
      if k then
        k = Norm(k)
        if b[k] == nil then b[k] = v end
      end
    end
    bulk[dir] = b
  end
  return b[nw]
end

local function HandleUnknown(w, dict, dir)
  if dir == "fren" then
    local p1, p2 = w:find("'", 2, true)
    if not p1 then p1, p2 = w:find("\226\128\153", 2, true) end
    if p1 and p2 < #w then
      local pre = Norm(w:sub(1, p2))
      local e = ELISION[pre]
      if e then
        local rest = w:sub(p2 + 1)
        local r = dict[Norm(rest)]
        return e .. (r ~= nil and r or rest)
      end
    end
  end
  if #w >= 3 then
    local nw = Norm(w)
    local b = BulkLookup(dir, nw)
    if b then return MatchCase(w, b) end
    -- formes conjuguées / pluriels : on cherche le radical
    local stems = {}
    local function add(st, plural) if #st >= 2 then stems[#stems + 1] = { st, plural } end end
    if dir == "enfr" then
      if nw:sub(-3) == "ies" then add(nw:sub(1, -4) .. "y", true) end
      if nw:sub(-3) == "ing" then
        local st = nw:sub(1, -4)
        add(st); add(st .. "e")
        if st:sub(-1) == st:sub(-2, -2) then add(st:sub(1, -2)) end
      end
      if nw:sub(-2) == "ed" then
        local st = nw:sub(1, -3)
        add(st); add(st .. "e")
        if st:sub(-1) == st:sub(-2, -2) then add(st:sub(1, -2)) end
      end
      if nw:sub(-2) == "es" then add(nw:sub(1, -3), true) end
      if nw:sub(-1) == "s" then add(nw:sub(1, -2), true) end
    else
      if nw:sub(-1) == "s" or nw:sub(-1) == "x" then add(nw:sub(1, -2), true) end
    end
    for _, e in ipairs(stems) do
      local r = dict[e[1]] or BulkLookup(dir, e[1])
      if r and r ~= "" then
        if e[2] and not r:find(" ") and not r:find("[sxz]$") then r = r .. "s" end
        return MatchCase(w, r)
      end
    end
  end
  return w
end


----------------------------------------------------------------------
-- Accord des articles / possessifs (EN -> FR) : genre et nombre devinés d'après le nom qui suit
----------------------------------------------------------------------
local DET = { the = 1, a = 1, an = 1, my = 1, your = 1, his = 1, her = 1, our = 1, their = 1,
              this = 1, that = 1, these = 1, those = 1, some = 1, all = 1 }
local COMBO = { the = 1, these = 1, those = 1, my = 1, your = 1, his = 1, her = 1, our = 1, their = 1 }
local IMPER = { wait = "attends", look = "regarde", come = "viens", go = "va", stop = "arrête", try = "essaie",
                help = "aide", check = "vérifie", listen = "écoute", tell = "dis", show = "montre", give = "donne",
                take = "prends", let = "laisse", hurry = "dépêche-toi", relax = "détends-toi", calm = "calme-toi",
                join = "rejoins", invite = "invite", heal = "soigne", kill = "tue", follow = "suis", ask = "demande",
                send = "envoie", use = "utilise", open = "ouvre", close = "ferme", read = "lis", remember = "souviens-toi",
                think = "réfléchis", pay = "paie", sell = "vends", buy = "achète", grab = "prends", get = "prends",
                bring = "apporte", keep = "garde", leave = "pars", stay = "reste", turn = "tourne", run = "cours" }
local DE_PREV = { try = "de", tries = "de", tried = "de", trying = "de", stop = "de", stops = "de", stopped = "de",
                 stopping = "de", finish = "de", finishes = "de", finished = "de", finishing = "de", forget = "de",
                 start = "à", starts = "à", started = "à", starting = "à" }
local NOT_SUBJ = {}
for w in ("i you we they he she it to will would can could should must may might do does did don't doesn't didn't not never also just already still really always ever and or but if when then so who that which what there here"):gmatch("%S+") do NOT_SUBJ[w] = true end
local BE_EN = { is = 1, was = 1, are = 1, were = 1, be = 1, ["isn't"] = 1, ["wasn't"] = 1, ["aren't"] = 1 }
local END_EN = { lol = 1, lmao = 1, mdr = 1, haha = 1, hehe = 1, xd = 1, pls = 1, plz = 1, please = 1, now = 1, too = 1 }
local TOVERB = { want = 1, wants = 1, need = 1, needs = 1, like = 1, likes = 1, love = 1, loves = 1, hate = 1, hates = 1,
                 try = 1, tries = 1, hope = 1, hopes = 1, wish = 1, wishes = 1, forget = 1, forgets = 1, start = 1, starts = 1 }
local CONJ_NEXT = { the = 1, a = 1, an = 1, we = 1, i = 1, you = 1, he = 1, she = 1, they = 1, it = 1,
                    there = 1, this = 1, my = 1, your = 1, his = 1, her = 1, our = 1, their = 1 }
local function Set(str) local t = {} for w in str:gmatch("%S+") do t[w] = true end return t end

local STOPFR = Set("pour de du des d' à au aux avec sans sur sous dans en par chez vers entre et ou mais que qui dont où car donc comme si ne pas plus très trop je tu il elle nous vous ils elles on ce c'est est sont était étaient a ont va vont peut veut doit fait avoir être aller faire pouvoir vouloir devoir suis es sommes êtes ai as avons avez puis quand lorsque parce depuis pendant avant après alors aussi encore déjà toujours jamais bien mal me te se lui leur y qu'")
local MASC_E = Set("groupe monde problème système programme nombre membre exemple service village voyage message courage dommage visage âge age page paysage personnage livre arbre verre siècle temple article rôle lieu peuple risque signe style type texte titre trésor tube homme maire prince ministre sable stade schéma sommet stage tarif thème équipement bouclier")
local FEM_NO_E = Set("main fin faim nuit voix fois part dent peau eau loi foi soif clé maison raison saison chanson leçon façon prison mer fleur sœur série")
local SING_S = Set("mois pas temps corps bras cours prix choix fois voix paix souris radis héros bonus virus campus pays tapis colis logis puits dos gaz nez repas succès accès progrès processus")

local function Gender(w)
  w = w:lower()
  if FEM_NO_E[w] then return "f" end
  if MASC_E[w] then return "m" end
  if w:find("tion$") or w:find("sion$") or w:find("ure$") or w:find("ance$") or w:find("ence$") or w:find("ette$")
     or w:find("esse$") or w:find("ude$") or w:find("ise$") or w:find("ade$") or w:find("ine$") or w:find("ille$")
     or w:find("elle$") or w:find("aine$") then return "f" end
  if w:find("t\195\169$") or w:find("\195\169e$") or w:find("ie$") then return "f" end
  if w:find("age$") or w:find("isme$") or w:find("iste$") or w:find("\195\168me$") or w:find("ment$") then return "m" end
  if w:find("e$") then return "f" end
  return "m"
end

local function IsPlural(w)
  w = w:lower()
  if SING_S[w] or #w < 3 then return false end
  if not w:find("[aeiouy\195]") then return false end -- sigle (dps, fps...)
  return w:find("[sx]$") ~= nil
end

local H_ASPIRE = Set("horde hache hall hangar harpe hasard héros hibou honte housse haut hauteur hurler hurlement hockey homard huit huitième")
local function StartsVowel(w)
  if H_ASPIRE[w:lower()] then return false end
  return w:find("^[aeiouyhAEIOUYH]") ~= nil or w:find("^\195[\160\162\169\168\170\171\174\175\180\185\187]") ~= nil
end

local ADJ_F = {
  grand = "grande", petit = "petite", bon = "bonne", mauvais = "mauvaise", nouveau = "nouvelle", vieux = "vieille",
  beau = "belle", gros = "grosse", long = "longue", court = "courte", haut = "haute", bas = "basse", fort = "forte",
  dernier = "dernière", premier = "première", prochain = "prochaine", meilleur = "meilleure", vrai = "vraie",
  faux = "fausse", ["prêt"] = "prête", mort = "morte", vivant = "vivante", ["occupé"] = "occupée",
  ["fatigué"] = "fatiguée", content = "contente", seul = "seule", plein = "pleine", ["différent"] = "différente",
  important = "importante", ["cassé"] = "cassée", ["réparé"] = "réparée", ["tué"] = "tuée", perdu = "perdue",
  fini = "finie", ancien = "ancienne", complet = "complète", gratuit = "gratuite", blanc = "blanche", vert = "verte",
  noir = "noire", gris = "grise", violet = "violette", ["génial"] = "géniale",
}
local ADJ_P = { nouveau = "nouveaux", beau = "beaux", vieux = "vieux", gros = "gros", mauvais = "mauvais", bas = "bas", faux = "faux" }

local function AdjAgree(w, gender, plural)
  local lw = w:lower()
  local f = ADJ_F[lw]
  if not f then return w end
  local r
  if gender == "f" then
    r = plural and (f .. "s") or f
  else
    r = plural and (ADJ_P[lw] or (lw:find("[sx]$") and lw or (lw .. "s"))) or lw
  end
  if w:match("^%u") then r = r:sub(1, 1):upper() .. r:sub(2) end
  return r
end

local function DetForm(en, gender, plural, vowel)
  local f = gender == "f"
  if en == "the" then
    if plural then return "les" end
    if vowel then return "l'" end
    return f and "la" or "le"
  elseif en == "a" or en == "an" then
    if plural then return "des" end
    return f and "une" or "un"
  elseif en == "some" then
    if plural then return "des" end
    if vowel then return "de l'" end
    return f and "de la" or "du"
  elseif en == "this" or en == "that" then
    if plural then return "ces" end
    if f then return "cette" end
    return vowel and "cet" or "ce"
  elseif en == "all" then
  if plural then return f and "toutes les" or "tous les" end
  return f and "toute" or "tout"
  elseif en == "these" or en == "those" then
    return "ces"
  elseif en == "my" then
    if plural then return "mes" end
    return (f and not vowel) and "ma" or "mon"
  elseif en == "your" then
    if plural then return "tes" end
    return (f and not vowel) and "ta" or "ton"
  elseif en == "his" or en == "her" then
    if plural then return "ses" end
    return (f and not vowel) and "sa" or "son"
  elseif en == "our" then
    return plural and "nos" or "notre"
  elseif en == "their" then
    return plural and "leurs" or "leur"
  end
  return en
end

local PL_BE = Set("étaient sont étions sommes")
local PP_IRR = Set("mort perdu fini pris fait dit vu su mis")
local SG_BE = { sont = "est", ["étaient"] = "était" }
local function FixParticiples(out)
local skipPl = {}
for idx = 1, #out do
  local o = out[idx]
  if type(o) == "string" and o:lower():find("^aucun") then
    for j = idx + 1, math.min(#out, idx + 8) do
      local x = out[j]
      if type(x) == "string" and SG_BE[x:lower()] then
        out[j] = SG_BE[x:lower()]
        skipPl[j] = true
        break
      end
    end
  end
end
for idx = 1, #out do
    local o = out[idx]
    local lastw = type(o) == "string" and o:lower():match("([^ ]+)$")
    if lastw and PL_BE[lastw] and not skipPl[idx] then
      local j = idx + 1
      while out[j] == " " or out[j] == "" do j = j + 1 end
      local w = out[j]
      if type(w) == "string" and not w:find(" ") and not w:find("s$") then
        if w:find("\195\169$") or PP_IRR[w:lower()] then
          out[j] = w .. "s"
        elseif ADJ_F[w:lower()] then
          out[j] = AdjAgree(w, "m", true) -- gratuit -> gratuits, nouveau -> nouveaux
        end
      end
    end
  end
end

local ARTFR_SET = Set("le la les l' un une des du de ces ce cette cet mes mon ma tes ton ta ses son sa notre nos leur leurs")

local function ApplyDet(out, idx, o, words)
  local gender, plural, firstWord = "m", false, nil
  if #words > 0 then
    local lastText = out[words[#words]]
    local head
    if lastText:find(" de ") or lastText:find(" du ") or lastText:find(" des ") or lastText:find(" à ")
       or lastText:find(" au ") or lastText:find(" d'") then
      head = lastText:match("^[^ ]+")
    else
      head = lastText:match("([^ ]+)$")
    end
    gender, plural = Gender(head), IsPlural(head)
    firstWord = out[words[1]]:match("^[^ ]+")
    for k = 1, #words - 1 do
      local aw = out[words[k]]
      if not aw:find(" ") then out[words[k]] = AdjAgree(aw, gender, plural) end
    end
  end
  local form = DetForm(o.en, gender, plural, firstWord and StartsVowel(firstWord))
  if o.all then
    -- "all the / all my ..." : tous les, toutes mes, tout le ...
    local pre = plural and (gender == "f" and "toutes" or "tous") or (gender == "f" and "toute" or "tout")
    form = pre .. " " .. form
  end

  -- contraction : de + le = du, à + le = au ...
  local pj = idx - 1
  while pj >= 1 and (out[pj] == " " or out[pj] == "") do pj = pj - 1 end
  local prev = (pj >= 1 and type(out[pj]) == "string") and out[pj]:lower() or nil
  if prev == "de" and (form == "le" or form == "les") then
    out[pj] = ""
    form = (form == "le") and "du" or "des"
  elseif prev == "à" and (form == "le" or form == "les") then
    out[pj] = ""
    form = (form == "le") and "au" or "aux"
  end

  if o.cap then form = form:sub(1, 1):upper() .. form:sub(2) end
  out[idx] = form
  if form:sub(-1) == "'" and out[idx + 1] == " " then out[idx + 1] = "" end -- l'épée : pas d'espace
end

local function ResolveDets(out)
  for idx = 1, #out do
    local o = out[idx]
    if type(o) == "table" and o.en == "all" then
      -- "all" suivi d'un autre déterminant : on fusionne ("all the" -> tous les)
      local jn = idx + 1
      while out[jn] == " " or out[jn] == "" do jn = jn + 1 end
      local nx = out[jn]
      if type(nx) == "table" and COMBO[nx.en] then
        nx.all = true
        out[idx] = ""
        o = nil
      end
    end
    if type(o) == "table" then
    -- groupe nominal qui suit : jusqu'à 3 mots, arrêt sur préposition / verbe / ponctuation
      local words, j = {}, idx + 1
      while out[j] and #words < 3 do
        local x = out[j]
        if type(x) == "table" then break end
        if x == " " or x == "" then
          j = j + 1
        else
          if not x:find("^[%a\128-\255][%a\128-\255' %-]*$") then break end
          if STOPFR[Norm(x:match("^[^ ]+"))] then break end
          words[#words + 1] = j
          j = j + 1
        end
      end
      local nextFirst = (#words > 0) and out[words[1]]:match("^[^ ]+") or nil
      if nextFirst and ARTFR_SET[nextFirst:lower()] then
        out[idx] = "" -- le mot suivant a déjà son article
      else
        ApplyDet(out, idx, o, words)
      end
    end
  end
end

-- une de vos entrées personnelles commence-t-elle au mot n° idx ?
local function UserHitAt(parts, idx, limit, ud)
  for len = limit, 1, -1 do
    local ws, j, ok = {}, idx, true
    for k = 1, len do
      local pj = parts[j]
      if not pj or not pj.w then ok = false break end
      ws[k] = pj.num and "#" or Norm(pj.w)
      if k < len then
        local gap = parts[j + 1]
        if gap and gap.p and (gap.p == " " or gap.p == "-") then j = j + 2 else ok = false break end
      end
    end
    if ok and ud[table.concat(ws, " ")] ~= nil then return true end
  end
  return false
end

function TW.Translate(text, dir)
  EnsureBuilt()
  local dict = dicts[dir]
  if not dict or not text or text == "" then return text end
  if text:sub(1, 1) == "/" then return text end -- ne jamais toucher aux commandes

  -- protéger liens d'objets et icônes {rt1}
  local saved = {}
  local function protect(s)
    saved[#saved + 1] = s
    return "\1" .. string.rep("\2", #saved) .. "\3"
  end
  text = text:gsub("|c%x%x%x%x%x%x%x%x|H.-|h.-|h|r", protect)
  text = text:gsub("%[[^%]]+%]", protect)
  text = text:gsub("{%w+}", protect)
  text = text:gsub(":[%a%d_]+:", protect)
  text = text:gsub("%f[%w][xX][dD]%f[%W]", protect)

  -- découpage en mots / ponctuation
  local parts, pos, n = {}, 1, #text
  while pos <= n do
    local s, e = text:find("^[%a\128-\255][%a\128-\255']*", pos)
    if s then
      parts[#parts + 1] = { w = text:sub(s, e) }
      pos = e + 1
    else
      local s2, e2 = text:find("^%d+", pos)
      if s2 then
        parts[#parts + 1] = { w = text:sub(s2, e2), num = true }
        pos = e2 + 1
      else
        parts[#parts + 1] = { p = text:sub(pos, pos) }
        pos = pos + 1
      end
    end
  end

  local out, i, np = {}, 1, #parts
  local prevEn = nil
  atStartFlag = true
  local limit = maxN[dir]
  local hasUser = next(userEntries[dir]) ~= nil
  while i <= np do
    local part = parts[i]
    if part.w then
      local matched = false
      for pass = 1, 2 do
        -- passe 1 : vos entrées personnelles (priorité absolue) ; passe 2 : glossaire
        local dd = (pass == 1) and userEntries[dir] or dict
        if not matched and (pass == 2 or next(dd) ~= nil) then
        for len = limit, 1, -1 do
          local keyw, raws, isnum, j, ok, endIdx = {}, {}, {}, i, true, i
          for k = 1, len do
            local pj = parts[j]
            if not pj or not pj.w then ok = false break end
            raws[k] = pj.w
            isnum[k] = pj.num and true or false
            keyw[k] = pj.num and "#" or Norm(pj.w)
            endIdx = j
            if k < len then
              local gap = parts[j + 1]
              if gap and gap.p and (gap.p == " " or gap.p == "-") then
                j = j + 2
              else
                ok = false
                break
              end
            end
          end
          if ok then
            local tr = dd[table.concat(keyw, " ")]
            local wild
            if tr == nil and len >= 2 and not isnum[len] then
              local last = keyw[len]
              keyw[len] = "*"
              tr = dd[table.concat(keyw, " ")]
              keyw[len] = last
              wild = raws[len]
            end
            if tr ~= nil and pass == 2 and len > 1 and hasUser then
              for jj = i + 1, endIdx do
                if parts[jj].w and UserHitAt(parts, jj, limit, userEntries[dir]) then tr = nil break end
              end
            end
            if tr ~= nil then
              local nums = {}
              for k = 1, len do if isnum[k] then nums[#nums + 1] = raws[k] end end
              local ni = 0
              tr = tr:gsub("#", function() ni = ni + 1 return nums[ni] or "#" end)
              if wild then
                wild = wild:sub(1, 1):upper() .. wild:sub(2)
                tr = tr:gsub("%*", function() return wild end)
              end
              if dir == "enfr" and len == 1 and DET[keyw[1]] then
                -- déterminant : pronom / conjonction / article ? (décidé d'après le mot suivant)
                local lw1 = keyw[1]
                local jn = endIdx + 1
                while parts[jn] and parts[jn].p == " " do jn = jn + 1 end
                local nx = parts[jn]
                local nextEnd = (not nx) or (nx.p ~= nil)
                local nextWord = nx and nx.w and Norm(nx.w) or nil
                if (lw1 == "this" or lw1 == "that") and nextEnd then
                  out[#out + 1] = MatchCase(part.w, "ça")
                elseif lw1 == "that" and nextWord and CONJ_NEXT[nextWord] then
                  out[#out + 1] = MatchCase(part.w, "que")
                elseif lw1 == "all" and nextEnd then
                  out[#out + 1] = MatchCase(part.w, "tout")
                elseif lw1 == "her" and nextEnd then
                  out[#out + 1] = MatchCase(part.w, "elle")
                elseif lw1 == "her" and nextWord and (nextWord == "the" or nextWord == "a" or nextWord == "an" or nextWord == "some") then
                  out[#out + 1] = MatchCase(part.w, "lui")
                else
                  out[#out + 1] = { en = lw1, cap = atStartFlag and part.w:match("^%u") ~= nil }
                end
              else
                if dir == "enfr" and len == 1 and GERUND[keyw[1]] and prevEn and DE_PREV[prevEn] then
                  -- "try making" -> "essayer de faire"
                  local prep = DE_PREV[prevEn]
                  if prep == "de" and tr:find("^[aeiouyhàâéèêîôû]") then prep = "d'" .. tr else prep = prep .. " " .. tr end
                  tr = prep
                elseif dir == "enfr" and len == 1 and (keyw[1] == "have" or keyw[1] == "has") and prevEn and not NOT_SUBJ[prevEn] then
                  tr = (keyw[1] == "have") and "ont" or "a" -- sujet nominal : "my friends have" -> "mes amis ont"
                elseif dir == "enfr" and len == 1 and atStartFlag and IMPER[keyw[1]] then
                  tr = IMPER[keyw[1]] -- "Wait ..." en début de phrase = ordre : "Attends ..."
                elseif dir == "enfr" and len == 1 and keyw[1] == "it" then
                  -- "it" complément (fin de phrase, après un verbe) = "ça" ; sujet = "il"
                  local jn = endIdx + 1
                  while parts[jn] and parts[jn].p == " " do jn = jn + 1 end
                  local nx = parts[jn]
                  local nextEnd = (not nx) or (nx.p ~= nil) or (nx.w and END_EN[Norm(nx.w)])
                  if prevEn and not BE_EN[prevEn] and nextEnd then tr = "ça" end
                elseif dir == "enfr" and len == 1 and keyw[1] == "too" then
                  -- "too" en fin de phrase = aussi ; devant un adjectif = trop
                  local jn = endIdx + 1
                  while parts[jn] and parts[jn].p == " " do jn = jn + 1 end
                  local nx = parts[jn]
                  if (not nx) or nx.p then tr = "aussi" end
                elseif dir == "enfr" and len == 1 and keyw[1] == "to" then
                  -- "to go" : la marque de l'infinitif anglais disparaît en français
                  local jn = endIdx + 1
                  while parts[jn] and parts[jn].p == " " do jn = jn + 1 end
                  local nx = parts[jn]
                  if nx and nx.w and ENV[Norm(nx.w)] then tr = "" end
                elseif dir == "fren" then
                  -- "je veux aller" -> "i want to go"
                  local lastw = tr:match("([%a']+)$")
                  if lastw and TOVERB[lastw] then
                    local jn = endIdx + 1
                    while parts[jn] and parts[jn].p == " " do jn = jn + 1 end
                    local nx = parts[jn]
                    if nx and nx.w and INF[Norm(nx.w)] then tr = tr .. " to" end
                  end
                end
                out[#out + 1] = MatchCase(part.w, tr)
              end
              i = endIdx + 1
              matched = true
              break
            end
          end
        end
        end
      end
      if not matched then
        out[#out + 1] = HandleUnknown(part.w, dict, dir)
        i = i + 1
      end
      local lp = parts[i - 1]
      prevEn = (lp and lp.w) and Norm(lp.w) or nil
      atStartFlag = false
      else
      if part.p ~= " " then prevEn = nil end
      out[#out + 1] = part.p
      if part.p == "." or part.p == "!" or part.p == "?" then atStartFlag = true end
      i = i + 1
    end
  end

  if dir == "enfr" then ResolveDets(out); FixParticiples(out) end
  local res = table.concat(out)
  if dir == "enfr" then
    -- élision : "de attendre" -> "d'attendre", "que il" -> "qu'il"
    res = res:gsub(" de ([aeiouy\195])", " d'%1"):gsub(" que ([aeiouy\195])", " qu'%1")
  end
  res = res:gsub("  +", " "):gsub("^ +", ""):gsub(" +([%.,%?!])", "%1")
  if dir == "fren" then res = res:gsub("%f[%a]i%f[%A]", "I") end
  res = res:gsub("\1(\2+)\3", function(k) return saved[#k] end)
  return res
end
