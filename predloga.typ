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

// Oblikovanje naslovov
#show heading.where(level: 1): set text(
  size: 14pt,
  weight: "bold",
)
#show heading.where(level: 2): set text(
  size: 12pt,
  weight: "bold",
)
#show heading.where(level: 3): set text(
  size: 12pt,
  weight: "regular",
)
// Zamik podnaslovov
#show heading.where(level: 2): it => pad(left: 2em, it) // nisem ziher, če je 2em ustrezen zamik, ampak zgleda ok
#show heading.where(level: 3): it => pad(left: 2em, it)


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
// Leve poševnice dajo text v novo vrstico, ne briši jih tukaj!
#v(1fr)
  Ime in priimek: \
  Oddelek: \
  Predmet: \
  Mentor/-ica: \
  Šolsko leto: 

// #pagebreak prelomi stran
#pagebreak()

// KONEC NASLOVNE STRANI
// IZJAVA O AVTORSTVU
#align(center)[
Dijak/-inja [IME] [PRIIMEK] izjavljam, da sem avtor tega dela. \ \
Podpis: \ \
#line(length: 100pt)
]
//    STRAN S KAZALI

// Številčenje strani, postavljeno je tukaj, ker želimo, da se od tukaj naprej vidijo številke strani (ne na naslovnici).
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

// KONEC STRANI S KAZALI
//    ZAČETEK VSEBINE

// Naslovi se označijo z enim enačajem, ker je oštevilčenje naslovov že definirano v glavi, jih posebaj oštevilčevati vsakega posebaj ni potrebno
= Naslov

// Odstavek, odstavki so ločeni s dvema novima vrsticama, ali z backslashom (\)
Pozdravljen svet!


// #lorem() naključno generira želeno število znakov, za placeholder
#lorem(40)

// Podnaslovi se označijo z dvema enačajema (tako se nadaljuje za podpodnaslove, podpodpodnaslove...)
== Primeri uporabe sintakse
*Široko*
_Poševno_
#strike[Prečrtano]

=== Podpodnaslov
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

= Primer tabele
Tukaj sta dva primera tabel iz typst.app docs spletne strani. Ni se mi dalo pisati moje za ta primer, morda v prihodnosti.

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [], [*Volume*], [*Parameters*],
  ),
  "(slika cilindra)",
  $ pi h (D^2 - d^2) / 4 $,
  [
    $h$: height \
    $D$: outer radius \
    $d$: inner radius
  ],
  "(slika tetrahedrona)",
  $ sqrt(2) / 12 a^3 $,
  [$a$: edge length]
)

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)
  } else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]
  } else {
    it
  }
}

#let a = table.cell(
  fill: green.lighten(60%),
)[A]
#let b = table.cell(
  fill: aqua.lighten(60%),
)[B]

#table(
  columns: 4,
  [], [Exam 1], [Exam 2], [Exam 3],

  [John], [], a, [],
  [Mary], [], a, a,
  [Robert], b, a, b,
)

= Primer kode

// Koda je začne in konča z ```
// programski jezik kode je definiran zgoraj, za prvim ```, to vpliva samo na obarvanje kode, ni obvezno
// Za lepši padding (odmik bloka kode od besedila nad njim) je treba dodati tekst nad njo v ta block, ki je spodaj, s temi vrednostmi
#block(spacing: 0pt, above: 1.3em, below: 0.5em)[
  Koda:
]
```py
stevila = [1, 2, 3, 4, 5]
vsota = 0

for stevilo in stevila:
    vsota += stevilo

if vsota > 10:
    print("Vsota je večja od 10.")
else:
    print("Vsota je 10 ali manj.")

print("Vsota vseh števil je:", vsota)
```

#block(spacing: 0pt, above: 1.3em, below: 0.5em)[
  Izpis:
]
```
Vsota je večja od 10.
Vsota vseh števil je: 15
```

= Primeri računov/enačb
== Dolgi eno vrstico
// Enačbe se pišejo med dollar znake, takšen zapis se naj uporablja le inline, ko potrebujete napisati račun sredi povedi.
Splošna formula za eksponentno funkcijo je $f(x) = a^x$, kjer $a$ ne sme biti negativen, enak $0$, ali enak $1$.
// enačbe se lahko centrira s presledki med dollar znaki, takšna je najpogostejša in zaželena sintaksa računov v dokumenih
$ 2 + 2 = 5 $

== Dolgi več vrstic
// Računi/enačbe dolge več vrstic se zapišejo med dollar znake, vrstice so ločene z backslashi
// Enačaje od enačb se lahko centrira z znakom "&" pred njim, npr. 2 + 2 &= 5
// Komertarje se v enačbe da pisati z znakom "&", če se uporabi en "&" so vsi komentarji v enačbi poravnani na levo, če sta uporabljena dva "&&", potem ko vsi komentarji poravnani na desno, poravnave raznih komentarjev se lahko meša
$ 
  2 + (2x + 1)^2 &= (x - 4)^2 - 3x & "Dana enačba" \
  2 + 4x^2 + 4x + 1 &= x^2 - 8x + 16 - 3x \
  4x^2 - x^2 + 4x + 8x + 2 + 1 - 16 &= 0 \
  3x^2 + 12x - 13 &= 0 & "Ničelna oblika"
$

#pagebreak()

= Viri in literatura
// Vire se da pisati ročno ali avtomatsko uvoziti iz datoteke, z "#bibliography("viri.bib"), datoteko z viri se da generirati s programom, kot je zotero. Typst podpira BibTeX in YML/YAML tipe datotek za vire.
== Elektronski
=== Besedilni
- Začetnica imena avtorja. Priimek avtorja. Naslov. Podnaslov. [citirano: 00.00.0000]. Dostopno na povezavi: #link("https://www.example.com") // Ustrezen format navajanja virov
=== Slikovni
- Slika 1: Lorem Picsum. Izvod: 1055. [preneseno: 00.00.0000]. Dostopno na povezavi: #link("https://picsum.photos/") // (ročno) številčenje slik po kazalu
== Tiskani
-