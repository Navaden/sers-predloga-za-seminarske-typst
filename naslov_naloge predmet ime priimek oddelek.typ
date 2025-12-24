// SERŠ Predloga za seminarske naloge
// by Matic Tement

// Nastavitve papirja, ne spreminjaj
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2cm, left: 2cm, right: 2cm),
)

// Oblikovanje besedila
#set text(
  font: "Times New Roman",
  size: 12pt
)

// Povezave podčrtane
#show link: underline

// Oštevilčenje naslovov
#set heading(numbering: "1.")

// Obojestranska poravnava
#set par(justify: true)

// Sivo ozadje, border radius in outline za kodo
#show raw: box.with(
  fill: gray.lighten(80%),
  inset: 10pt,
  radius: 2pt,
  //stroke: 0.5pt + black,
)

// Formatiranje glavnega naslova, ne spreminjaj
#show title: set text(size: 18pt)
#show title: set align(center)
#show title: set block(above: 14em)
// Formatiranje podnaslova, ne spreminjaj
#let subtitle(body) = align(center, text(fill: rgb("#555555"), body))

// KONEC GLAVE IN ZAČETEK DOKUMENTA
//    NASLOVNA STRAN

// SERŠ logo na naslovnici
#align(center)[#image("SERS_logotip_cp_slogan_rgb.jpg")]

// Glavni naslov in podnaslov
#title("Glavni naslov")
#subtitle("Podnaslov")

// Podatki o dijaku
// #v(1fr) tukaj pove, da se naj naslednje beseddilo piše od spodaj navzgor, to obnašanje je prekinjeno z #pagebreak
#v(1fr)
  Ime in priimek: \
  Oddelek: \
  Predmet: \
  Mentor/-ica: \
  Šolsko leto:

// #pagebreak prelomi stran
#pagebreak()

// KONEC NASLOVNE STRANI
//    STRAN S KAZALI

// Številčenje strani, postavljeno je tukaj (ne na naslovnici, ali v glavi, čeprav se ne vidi na strani), ker na naslovni strani številke strani naj ne bi bilo).
#set page(
  numbering: "1"
)

// Kazalo
#outline(
  title: [Kazalo vsebine],
)

// Kazalo slik
#outline(
  title: [Kazalo slik],
  target: figure.where(kind: image),
)

// Kazalo tabel
#outline(
  title: [Kazalo tabel],
  target: figure.where(kind: table),
)


#pagebreak()

// KONEC STRANI S KAZALi
//    ZAČETEK VSEBINE

// Naslovi se označijo z enim enačajem, ker je oštevilčenje naslovov že definirano v glavi, jih posebaj oštevilčevati vsakega posebaj ni potrebno
= Naslov

// Odstavek, odstavki so ločeni s dvema novima vrsticama, ali z backslashom (\)
Pozdravljen svet!


// #lorem() naključno generira želeno število znakov, za placeholder
#lorem(40)

// Koda je začne in konča z ```
// programski jezik kode je definiran zgoraj, za ```, to vpliva na obarvanje kode, ni potrebno
// Za lepši padding je treba dodati tekst nad njo v ta block, ki je spodaj, s temi vrednostmi
#block(spacing: 0pt, above: 1.3em, below: 0.5em)[
  Koda:
]
```py
for i in linux:
    sudo pacman apt install uninstall linux RTX windows
    for j in i:
        reboot()
```

#block(spacing: 0pt, above: 1.3em, below: 0.5em)[
  Izpis:
]
```
wtf am i even meant to print out man
```
// Podnaslovi se označijo z dvema enačajema (tako se nadaljuje za podpodnaslove, podpodpodnaslove...)
== Primeri uporabe sintakse
*Široko*
_Poševno_
#strike[Prečrtano]

Pomišljaji bi naj delali enostavno -- z dvema minusoma. Lahko tudi s tremi --- tako.

// Neoštevilčen seznam, znak za označevanje se da spremeniti
- neoštevilčeni seznami
- z
- minusi
 - test
  - test

// Oštevilčen seznam, znak za označevanje se da spremeniti
+ oštevilčeni seznami
+ s
+ plusi

= Primer slike
// sintaksa slike, caption je opis, supplement je beseda, poleg številke, dokler kind ni posebaj nastavljen, se avtomatsko šteje k slikam
#figure(
  image("1055-536x354.jpg", width: 60%),
  caption: [Obala],
  supplement: [Slika],
)

#pagebreak()

= Viri in literatura
== Elektronski
=== Besedilni
- Začetnica imena avtorja. Priimek avtorja. Naslov. Podnaslov. [citirano: 00.00.0000]. Dostopno na povezavi: #link("https://www.example.com") // Ustrezen format navajanja virov
== Tiskani
=== Slikovni
- Slika 1: Lorem Picsum. Izvod: 1055. [preneseno: 00.00.0000]. Dostopno na povezavi: #link("https://picsum.photos/") // (ročno) številčenje slik po kazalu
