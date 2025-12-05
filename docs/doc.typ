#set page(
  header: [
    #set text(size: 8pt)
    #box(width: 1.9cm, height: 1.9cm)[
      #image("tf-Academy-22-black.png")
    ]
    #h(1fr)
    #datetime.today().display("[day].[month].[year]")
    #h(1fr)
    Sven Toye
  ],
  footer: context [
    #set text(size: 8pt)
    Seite #counter(page).display("1 | 1", both: true)
    #h(1fr)
    twofold academy ag | Thurgauerstrasse 54 | 8050 Zürich | hi\@twofold.swiss | twofold.swiss
  ],
  margin: (top: 5cm, bottom: 2cm, left: 2.2cm, right: 2.2cm),
)


#set text(font: "Arial")
#set table(columns: (auto, 1fr))

#show "Bewertungskriterium": text.with(fill: red)
#show "Bewertungskriterien": text.with(fill: red)
#show "Entscheidungskriterium": text.with(fill: red)
#show "Individuelle Bewertungskriterien": text.with(fill: red)

#let hauptexperte = "Linus Torvalds"
#let nebenexperte = "Richard Stallman"
#let berufsbildner = "René Bach"

#let show-date-long(year, month, day) = {
  let date = datetime(year: year, month: month, day: day)
  let weekday = date.weekday()
  let show-weekday = if weekday == 1 [Montag] else if (
    weekday == 2
  ) [Dienstag] else if (
    weekday == 3
  ) [Mittwoch] else if (
    weekday == 4
  ) [Donnerstag] else if (
    weekday == 5
  ) [Freitag] else if (
    weekday == 6
  ) [Samstag] else [Sonntag]
  [#show-weekday, #date.display("[day].[month].[year]")]
}
#let show-date-mini(year, month, day) = {
  let date = datetime(year: year, month: month, day: day)
  date.display("[day].[month]")
}


#heading(outlined: false)[Individuelle Praktische Arbeit]
#set heading(numbering: "1.1.")

#pagebreak()

#outline(title: [Inhaltsverzeichnis], target: heading.where().after(outline))

#pagebreak()

= Teil 1: Umfeld und Ablauf

== Projektaufbauorganisation

=== Projektorganisation
#table(
  table.header(
    [*Auszubildender*],
    [*Lehrbetrieb*],
  ),
  [Sven Toye],
  [twofold academy AG],

  [Buchzelgstrasse 65],
  [Thurgauerstrasse 54],

  [8053 Zürich],
  [8050 Zürich],
)

=== Termine
#table(
  table.header(
    [*Was?*],
    [*Wann?*],
  ),
  [1. Expertenbesuch],
  [\<Datum\>],

  [2. Expertenbesuch],
  [\<Datum\>],

  [Präsentation, Demonstration, Fachgespräch],
  [\<Datum\>],
)

=== Involvierte Personen
#table(
  table.header(
    [*Person*],
    [*Rolle*],
  ),
  hauptexperte,
  [Hauptexperte],

  nebenexperte,
  [Nebenexperte],

  berufsbildner,
  [Verantwortliche Fachkraft & Berufsbildner],

  [Sven Toye],
  [IPA-Prüfungskandidat],
)

#pagebreak()

== Zeitplan

- Druckdatum und Autor kontrollieren
- Die Vorlage für den Zeitplan kann direkt aus dem Excel unter den twofold-Vorlagen geöffnet werden
- Der Zeitplan beinhaltet bereits die IPERKA-Struktur und Beispiel-Aufgaben mit den dazugehörigen geschätzten Aufwänden
- Je nach IPA-Auftrag müssen Arbeiten/Zeiten hinzugefügt, entfernt oder angepasst werden
- Zeiten für Testkonzept und Testen nicht unterschätzen!
- Geschätzte Soll/Ist-Zeiten und eingefärbte Blöcke müssen übereinstimmen! Experten kontrollieren das!
- Bewertungskriterien: A1, A3

// #import "@preview/rexllent:0.4.0": xlsx-parser
// #xlsx-parser(read("./zeitplan.xlsx", encoding: none), parse-font: false)

#table(
  table.header(
    [*Tag*],
    [*Aufgabe*],
  ),

  [#show-date-long(2025, 12, 1), 8:00-12:00],
  [
    - Planen
    - ERD erstellen
    - Auswählen, welche Technologien ich verwenden will
  ],

  [#show-date-long(2025, 12, 1), 12:30-13:30],
  [
    - Git Repository erstellen
    - Projekt aufsetzen und Dependencies herunterladen (auch Dev Tools wie Formatters und Linters)
    - Configuration
      - Datenbank-Verbindung
      - Frontend-Verbindung
      - Authentifizierung
  ],

  [#show-date-long(2025, 12, 1), 13:30-16:30],
  [
    - Entities definieren
    - DTOs definieren
    - Controllers definieren
    - Services definieren
  ],

  [#show-date-long(2025, 12, 2), 8:00-12:00],
  [
    - Docker aufsetzen
      - Datenbank Container
      - Datenbank Dashboard Container
    - Migrations definieren
      - CSV Daten importieren
  ],

  [#show-date-long(2025, 12, 3)],
  [
    - Relations
    - Swagger
    - Authentifizierung
  ],
)

#pagebreak()

#page(paper: "a3", flipped: true)[
  #let hours-in-unit = 2
  #let timeplan-data-dates = (
    // week 1
    (show-date-mini(2025, 12, 1), 8 / hours-in-unit),
    (show-date-mini(2025, 12, 2), 4 / hours-in-unit),
    (show-date-mini(2025, 12, 3), 8 / hours-in-unit),
    (show-date-mini(2025, 12, 4), 8 / hours-in-unit),
    (show-date-mini(2025, 12, 5), 8 / hours-in-unit),
    // week 2
    (show-date-mini(2025, 12, 8), 8 / hours-in-unit),
    (show-date-mini(2025, 12, 9), 4 / hours-in-unit),
    (show-date-mini(2025, 12, 10), 8 / hours-in-unit),
    (show-date-mini(2025, 12, 11), 8 / hours-in-unit),
    (show-date-mini(2025, 12, 12), 8 / hours-in-unit),
    // week 3
    (show-date-mini(2025, 12, 15), 8 / hours-in-unit),
  ).map(((date, len)) => (date, int(len)))

  #let len = timeplan-data-dates.map(((_, len)) => len).reduce((acc, len) => acc + len)
  #let timeplan-data-lens = range(len).map(len => [#{ len * hours-in-unit }])
  // #let timeplan-data-lens = range(len).map(len => [#{ (len + 1) * hours-in-unit }])
  // #let timeplan-data-lens = timeplan-data-dates.map(((_, len)) => range(len).map(len => [#{ (len + 1) * 2 }]))

  #let timeplan-data = (
    (
      [],
      (
        (
          [Arbeitsjournal führen],
          (
            ("s", 5, 1),
            ("s", 8, 2),
            ("b", 12, 2),
            ("i", 14, 1),
            ("s", 16, 2),
            ("s", 20, 2),
            ("s", 23, 1),
            ("s", 26, 2),
            ("s", 30, 2),
            ("s", 34, 2),
            ("s", 38, 2),
          ),
        ),
        ([Expertenbesuche], ()),
      ),
    ),
    (
      [Informieren],
      (
        ([Informationen sammeln], (("b", 0, 1),)),
      ),
    ),
    (
      [Planen],
      (
        (
          [
            - Zeitplan erstellen
            - Datenbankmodell erstellen
            - Technologien auswählen
          ],
          (("b", 1, 1),),
        ),
      ),
    ),
    (
      [Entscheiden],
      (
        ([Lösungsvariante festlegen], (("b", 2, 1),)),
      ),
    ),
    (
      [Realisieren],
      (
        ([Entities], (("b", 3, 1),)),
        ([Requests], (("s", 4, 1), ("i", 6, 1))),
        ([Services], (("s", 6, 1), ("i", 7, 1), ("i", 11, 1))),
        ([Controllers], (("s", 7, 1), ("i", 8, 1))),
        ([Relationen], (("i", 9, 1), ("b", 10, 1))),
        ([Datenbank], (("i", 4, 1), ("s", 11, 1))),
        ([Migrationen], (("i", 5, 1), ("s", 14, 1))),
        ([Authentifizierung], (("b", 15, 1), ("s", 18, 1))),
        ([Swagger], (("s", 19, 1),)),
      ),
    ),
    (
      [Kontrollieren],
      (
        ([Fehlerbehebung], (("s", 22, 1), ("s", 28, 2))),
        ([Testen], (("s", 24, 2),)),
      ),
    ),
    (
      [Auswerten],
      (
        ([Reflexion & Fazit], (("s", 32, 1),)),
      ),
    ),
    (
      [],
      (
        ([Dokumentation abschliesen], (("s", 33, 1),)),
        ([Puffer], (("s", 36, 2),)),
      ),
    ),
  )

  #let timeplan-data = timeplan-data.map(((title, rows)) => {
    let rows = rows.map(((title, columns)) => {
      let columns = columns.fold((), (table-columns, (column-type, column-start, column-len)) => {
        (
          ..table-columns,
          ..range(column-start - table-columns.len()).map(_ => " "),
          ..range(column-len).map(_ => column-type),
        )
      })
      let ist-zeit = columns.filter(c => (c == "i" or c == "b")).len() * hours-in-unit
      let soll-zeit = columns.filter(c => (c == "s" or c == "b")).len() * hours-in-unit
      let columns = (..columns, ..range((columns).len(), len).map(_ => " "))

      (title: title, ist-zeit: ist-zeit, soll-zeit: soll-zeit, columns: columns)
    })
    (title, rows)
  })
  #let ist-zeit = (
    timeplan-data.map(((_, rows)) => rows.map(((ist-zeit,)) => ist-zeit)).flatten().reduce((a, b) => a + b)
  )
  #let soll-zeit = (
    timeplan-data.map(((_, rows)) => rows.map(((soll-zeit,)) => soll-zeit)).flatten().reduce((a, b) => a + b)
  )
  #let ist-zeit-color = red
  #let soll-zeit-color = blue
  #let both-color = purple
  #let computed-timeplan-data = timeplan-data.map(((title, rows)) => {
    (
      table.cell(rowspan: rows.len(), align: right, emph(title)),
      ..rows.map(((title, ist-zeit, soll-zeit, columns)) => {
        let columns = columns.map(column => {
          if column == "i" {
            table.cell(fill: ist-zeit-color)[]
          } else if column == "s" {
            table.cell(fill: soll-zeit-color)[]
          } else if column == "b" {
            table.cell(fill: both-color)[]
          } else if column == " " {
            []
          } else {
            panic("invalid column: " + column)
          }
        })

        (table.cell(title, align: right), [#soll-zeit], [#ist-zeit], ..columns)
      }),
      table.hline(),
    )
  })

  #set table.hline(stroke: 1pt)
  #set table.vline(stroke: 1pt)
  #table(
    columns: (..range(4).map(_ => auto), ..range(40).map(_ => 1fr)),
    stroke: 0.5pt,
    align: center,

    table.hline(),
    table.vline(),

    table.cell(colspan: 4)[],
    table.vline(),

    ..timeplan-data-dates
      .map(((date, len)) => (
        table.cell(colspan: len, date),
        table.vline(),
      ))
      .flatten(),

    [*IPERKA Phase*],
    [*Aufgabe*],
    text([*Sollzeit*], fill: soll-zeit-color),
    text([*Istzeit*], fill: ist-zeit-color),

    ..timeplan-data-lens.flatten(),

    table.hline(),

    ..computed-timeplan-data.flatten(),

    [],
    [*Total*], [*#ist-zeit*], [*#soll-zeit*], table.cell(colspan: 40)[],

    table.hline(),
    table.vline(),
  )
]

== Arbeitsprotokoll

- Arbeitsprotokolle müssen täglich geführt werden! Experten kontrollieren das.
- Für aussenstehende verständlich beschreiben. Nicht: «Es lief gut» (sagt nichts aus) Besser: «Ich konnte alle geplanten
  Arbeiten abschliessen und hatte keine Probleme».
- Probleme auch für aussenstehende kurz beschreiben. Nicht: «ich hatte Probleme mit GIT». Besser: «Ich erhielt einen
  Fehler beim Pushen meines Repos. Ich habe die Lösung hier [Link einfügen] gefunden»
- Wenn online Materialien verwendet wurden, Link reinkopieren. Nicht nur «Google» oder «Laravel Dokumentation»
  schreiben, sondern genauen Link auf Artikel/Seite
- Schreibe kritisch und reflektiert. Nicht jeden Tag «Alles lief gut». Experten wollen sehen, dass ein Tag z.B.
  stressiger war, weil etwas unerwartetes passiert ist oder dass du mit deiner heutigen Leistung nicht zufrieden warst,
  weil du das Tagesziel nicht erreicht hast
- Bewertungskriterien: A2, A7, A8, A9, A10, A12, B2, B3, B7

#pagebreak()

=== #show-date-long(2025, 12, 1)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Technologien auswählen
    - ERD erstellen
    - Git Repository erstellen
    - Dependencies herunterladen
    - Entities definieren
    - DTOs definieren
    - Controllers definieren
    - Services definieren
  ],
  [Ungeplante Arbeiten],
  [
    - Ich war schneller mit den Entities, DTOs, Services und Controllers fertig als gedacht und ich fing an, den
      Datenbank Docker Container aufzusetzen.
  ],
  [geleistete Überstunden],
  [_keine_],
  [Erreichte Ziele],
  [
    - ERD erstellen
    - Projekt aufsetzen
    - Entities, DTOs, Controllers, Services und Modules erstellen
  ],
  [Erfolgserlebnisse],
  [
    _keine_
  ],
  [Herausforderungen],
  [
    - Ich habe Probleme, die Lerndoku zu schreiben. Das Projekt ist nicht neu, aber die Lerndoku gleichzeitig schreiben
      doch schon und ich konnte mich nicht wirklich auf die Aufgaben konzentrieren.
  ],
  [Probleme],
  [
    - Datenbank Verbindung scheiterte, weil die Umgebungsvariabeln falsch waren/nicht angegeben waren.
    - Mehrere Errors und Exceptions, als ich den Dev-Server gestartet habe.
  ],
  [Lösungen],
  [
    - Ich habe es am nächsten Arbeitstag gelöst.
  ],
  [Durchgeführte Tests],
  [_keine_],
  [Wissensbeschaffung],
  [
    - NestJS, TypeORM und Docker Fähigkeiten verbessert.
  ],
  [Beanspruchte Hilfeleistung],
  [
    NestJS Docs, TypeORM Docs, Docker Docs, René, Stackoverflow, Typescript Docs
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    Am Morgen viel langsamer, aber am Nachmittag schneller
  ],
  [Persönliche Tagesreflexion],
  [
    Ich konnte mich nicht wirklich konzentrieren. Obwohl ich mehr erledigt habe als gedacht, kam der Tag mir sehr
    unproduktiv vor.
  ],
)
#pagebreak()

=== #show-date-long(2025, 12, 2) (bis 12:00)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Docker aufsetzen
      - Datenbank Container
      - Datenbank Dashboard Container
    - Migrations definieren
      - CSV Daten importieren
  ],
  [Ungeplante Arbeiten],
  [_keine_],
  [geleistete Überstunden],
  [_keine_],
  [Erreichte Ziele],
  [
    - Docker aufsetzen
    - Migrations definieren
  ],
  [Erfolgserlebnisse],
  [
    - Alle Ziele erreicht
  ],
  [Herausforderungen],
  [
    - Docker/Docker Compose
    - TypeORM CLI
  ],
  [Probleme],
  [
    - Die gleichen Docker Probleme von gestern
  ],
  [Lösungen],
  [
    - Ich habe verschiedene Kombinationen von Umgebungsvariabeln probiert und Ports geändert, bis es funktioniert hat.
    In bin mir aber nicht ganz sicher was das Problem war und es könnte sein, dass etwas anderes es auch beeinflusst
    hat.
  ],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [Ungefähr gleich],
  [Persönliche Tagesreflexion],
  [
    Ich konnte mich besser konzentrieren.
  ],
)

=== #show-date-long(2025, 12, 3)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Relations
    - Swagger
    - Authentifizierung
  ],
  [Ungeplante Arbeiten],
  [
    - Relations
    - Serialisation
  ],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [
    - Relations
  ],
  [Erfolgserlebnisse],
  [
    - Relations
  ],
  [Herausforderungen],
  [
    - Es gibt (und hat immer noch) mehrere Probleme mit den Relations. Die meisten wurden gelöst, aber nicht alle.
    - Es gab Probleme mit dem Serialisation, weil es die Felder rekursiv in JSON umgewandelt hat
  ],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 4)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 5)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 8)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 9) (bis 12:00)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 10)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 11)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 12)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

=== #show-date-long(2025, 12, 15)
#table(
  [Tagesziele gemäss Zeitplan],
  [],
  [Ungeplante Arbeiten],
  [],
  [geleistete Überstunden],
  [],
  [Erreichte Ziele],
  [],
  [Erfolgserlebnisse],
  [],
  [Herausforderungen],
  [],
  [Probleme],
  [],
  [Lösungen],
  [],
  [Durchgeführte Tests],
  [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [],
  [Vergleich mit dem Soll-Zeitplan],
  [],
  [Persönliche Tagesreflexion],
  [],
)

= Teil 2: Projekt

== Kurzfassung
- Bewertungskriterien: B1

=== Ausgangssituation
- Soll nicht 1:1 aus pkOrg kopiert sein, sondern in eigenen Worten zusammengefasst, wieso diese IPA gebraucht wird bei
  twofold. Bsp: «Uns hat im Büro das und das gefehlt und deswegen brauchen wir ein Tool welches das und das macht»

=== Umsetzung
- Erklären, wie du vorgegangen bist, um das Problem aus der Ausgangssituation zu lösen. Kurz beschreiben, welche
  Schritte in der IPA gemacht wurde. Bsp: «Ich habe mich für ein Laravel-Projekt entschieden welches als REST-API
  aufgebaut wird und …»

=== Ergebnis
- Erklären was das Endresultat ist. Bsp: «Ein Tool welches diese und diese Funktionailtät bietet und das und das
  erleichtert»

== Informieren

=== Verstandene Aufgabenstellung und Ziel der Arbeit
- Was soll als Produkt dieser Arbeit entstehen? Bsp: «Ein Laravel API-Backend in welchem, …»
- Wie soll das Projekt umgesetzt werden? Welche Vorgaben gibt es? Muss eine Datenbank benutzt werden?
  Programmiersprachen, …

=== Ausgangslage
- Gibt es schon vorbereitete Mockups oder Designs? Falls Ja, hier alle Screenshots rein und erklären, welche
  Funktionalitäten pro Screenshot erkennbar sind und umgesetzt werden müssen
- Ist die Arbeit nur ein Teilprojekt? Falls ja, bestehende Projekt erklären und ggf. mit Screenshots zeigen/erklären
Falls noch nichts besteht kann dieser Punkt auch weggelassen werden

=== Abklärungen
- Was ist dir noch nicht klar aus der Aufgabenstellung/was musstest du beim VF nachfragen/Wo gibt es mehrere Varianten?
  Hier auflisten, mit den Antworten des VF oder möglichen Varianten, für die du dich später entscheiden kannst

=== Verfeinerung des Auftrages
- Welche Aufträge aus der Aufgabenstellung müssen zwar nicht mit dem VF abgeklärt werden/gibt es keine Varianten, aber
  müssen vielleicht noch etwas genauer beschrieben werden?
- Dieser Punkt ist ev. nicht nötig, wenn alles unter «Abklärung» drin ist

=== Projektumfeld und Systemgrenzen
- Welche Datenbank-Version? Welche PHP-Version? Werden spezielle PHP-Extensions benötigt? Wird das Projekt mit externen
  Diensten Verbunden? Was genau am Projekt machst du an der IPA und was gehört nicht dazu?
- Bewertungskriterium A5

== Planen

=== Verwendete Projektmanagementmethode
- Die Schritte von IPERKA erklären und was pro Schritt grob gemacht wird. Je 1-2 Sätze
- Bewertungskriterium A1

=== Versionierung und Datensicherheit
- Täglich mindestens 1x git push mit sinnvoller Commit Message. Online nachkontrollieren, ob alles geklappt hat!
- Doku und Zeitplan können im gleichen Repo auch versioniert werden
- Hier erklären, wie die Versionierung gemacht wird. Bsp: «Täglich wird auf unser firmeninternes GitLab gepusht.»
- Alles auch noch auf zweite Art sichern und hier beschreiben
- GIT Commit History muss entweder direkt hier oder im Anhang eingefügt werden. Falls im Anhang, hier beschreiben
- Wird von den Experten bei den Expertenbesuchen überprüft!
- Bewertungskriterium A12

=== Priorisierung der Tätigkeiten
- Alle Tätigkeiten (mindestens die, die im Zeitplan sind) hier auflisten und priorisieren (Hoch, Mittel, Niedrig)
- Bewertunskriterium A8
#table(
  table.header(
    [*Beschreibung der Tätigkeit*],
    [*Priorität*],
  ),
)

=== Use-Case Diagramm / Aktivitätsdiagramm / Klassendiagramm / … Gesamtsystem
- Je nach Projekt sollte mindestens eines, besser aber mehrere dieser Diagramme eingefügt werden. Die Diagramme sollen
  das gesamte System zeigen
- Es müssen nicht zwingend nur die oben genannten Diagramm-Arten sein. Falls dein Projekt besser mit einer eigenen
  Diagramm-Art erklärt werden kann, ist das auch in Ordnung
- Hier jeweils zuerst den Titel, dann das Diagramm und danach eine Beschreibung, was im Diagramm ersichtlich ist und
  ggf. zusätzliche Infos zum gesamten Aufbau des Projekts
- Bewertungskriterium A4

=== ERD
- Falls dein Projekt eine Datenbank hat, solltest du hier ein ERD einfügen und beschreiben
- Datenbank muss in 3. Normalform sein!
- Im ERD oder im Text darunter muss ersichtlich sein:
  - welche Beziehungen die Tabellen zueinander haben (mc, c, …)
  - welche die Primär und Fremdschlüssel sind
  - welche Datentypen die Spalten sind
- Individuelle Bewertungskriterien

#include "erd.typ"

=== Routen
- Falls dein Projekt verschiedene Routen hat oder eine API ist kannst du hier die Routen in einer Tabelle oder Liste
  aufzeigen
- Je nach Projekt musst du hier auch angeben, wie die Route angesprochen wird (POST, GET, …), die Route schematisch und
  mit Beispielen zeigen oder noch weitere Relevante Infos

=== Use-Case Diagramm / Aktivitätsdiagramm / Klassendiagramm / … Funktion XYZ
- Hier müssen ggf. die einzelnen Funktionen/Teilsysteme mit spezifischeren Diagrammen erklärt werden. Bsp: Login-System,
  Bild-Upload, …
- Hier jeweils zuerst den Titel, dann das Diagramm und danach eine Beschreibung, was im Diagramm ersichtlich ist.
- Ev. gibt es für die Teilsysteme keine geeigneten Diagramme, dann muss mit Text erklärt werden, wie die Funktion
  umgesetzt wird
- Bewertungskriterium A4

=== GUI-Design / Mockup
- Falls während der Arbeit ein Mockup erstellt wird, sollten hier die verschiedenen Screens eingefügt und beschrieben
  werden. Pro Screen einen passenden Titel wählen

=== Testkonzept
- Bewertungskriterium A6

==== Testmethode
- Wie wirst du deine Arbeit testen? Mit Postman/Insomnia? Von Hand? Welche Testart? Blackbox/Whitebox testing?
- Testmethode beschreiben und erklären. Was ist whitebox-Testing?

==== Testmittel
- Welche Soft- und Hardware in welchen Versionen hast du zum Testen verwendet?
- Beschreibe einer aussenstehenden Person, was sie alles machen muss, damit sie selbst dein Projekt auch testen könnte
- Braucht dein Projekt ein Login? Das ebenfalls zeigen/erklären

==== Abgrenzung
- Was am System testest du genau? Bis wo hin?
- Was testet du bewusst nicht?

==== Testfälle
- Testfälle müssen so genau definiert werden, dass eine aussenstehende Person diese auch durchführen könnte
- Auch Vorbedingungen müssen erklärt werden, wie man zu diesem Zustand kommt
- Nicht nur testen, was funktionieren soll (Positiv-Tests) sondern auch, was nicht funktionieren soll (Negativ-Tests)

#let test-cases-headers = (
  (
    definition-columns: ([*Testfall*], [*Vorbedingung*], [*Vorgehen*], [*Eingaben*], [*Erwartetes Resultat*]),
    execution-columns: ([*Effektives Ergebnis*], [*OK?*], [*Fazit*], [*Getestet von*], [*Getestet am*]),
  )
)
#let test-cases = (
  (
    definition-columns: (
      [User Ressource abfragen],
      [User ist eingeloggt],
      [GET-Request an /user],
      [],
      [HTTP-Status 200 und JSON-Objekt mit allen Daten des eingeloggten Nutzers],
    ),
    execution-columns: (
      [
        ```http
        200 OK
        {
          "message": "User created"
        }
        ```
      ],
      [Nein],
      [Die Validierung des Passworts funktioniert noch nicht. In der Validierungs-Funktion ist noch Fehler XYZ, der
        behoben werden muss.],
      [Sven Toye],
      [28.11.2025],
    ),
  ),
)


#for cell in test-cases {
  table(..test-cases-headers.definition-columns.zip(cell.definition-columns).flatten())
}

=== Anmerkungen zum Zeitplan
- Gibt es etwas, dass du einer aussenstehenden Person zu deinem Zeitplan erklären müsstest, dass nicht schon klar
  ersichtlich ist?

== Entscheiden
- Mindestens zwei Entscheidungen
- pro Entscheidung eine allgemeine Beschreibung, zwei oder mehr Varianten und dann wofür du dich entschieden hast
- Entscheidungskriterium B3

=== Beschreibung Entscheidung 1
- Kurz beschreiben, was du entscheiden musstest und wieso
- Bsp: welches Framework zu benutzen? Welche Programmiersprache? Wie ein Problem programmiert werden soll, …

=== Beschreibung Variante a / b / c / …
- Beschreibe die Vor- und Nachteile aller Varianten zur Entscheidung 1

=== Entscheidung 1
- Hier erläutern, für was du dich entschieden hast und wieso.
- Eine Entscheidungsmatrix kann hier helfen

== Realisieren
- Hier soll alles, was in der Planen Phase geplant wurde, beschrieben werden, wie du es schlussendlich umgesetzt hast
- In dieser Phase solltest du überall mit Screenshots und/oder Code-Beispielen zeigen, wie du etwas umgesetzt hast
- Wenn du auf Probleme gestossen bist, kannst du diese hier auch kurz beschreiben, mit einem Link zur Lösung auf
  StackOverflow (Direktlink zur Antwort) oder sonstige Links
- Wenn du für deine Lösung ein Framework oder Library verwendet hast, kannst du das hier auch beschreiben, mit Link zur
  GitHub-Page
- Bewertungskriterien A2, A8, A9, A10, A11, A13 + individuelle Kriterien

=== Abbildung des Gesamtsystems
Hier kann ev. nochmal eine Grafik oder ein Diagramm eingefügt werden, welches das effektiv umgesetzte Gesamtsystem zeigt

=== Grundaufbau / Architektur des Projektes
- Wie ist der Grundaufbau deines Projekts?

=== Vorgehensweise
- Wie bist du generell vorgegangen? Welche Schritte hast du nacheinander gemacht

=== Datenbank
- Wie sieht deine Datenbank nach der Realisierung aus? Hat sich etwas verändert ggü. Der Planungs-Phase?
- Hier kannst du auch das verbesserte ERD einfügen und erklären, was sich wieso geändert hat

=== Anbindung an die Datenbank
- Wie funktioniert die Anbindung/Kommunikation mit der Datenbank in deinem Projekt?

=== Routen
- Wie sehen deine Routen nach der Realisierung aus? Hat sich etwas verändert ggü. Der Planungs-Phase?
- Hier erklären, was sich wieso geändert hat
- Wie hast du das Routing gelöst? Code-Beispiele einfügen und erklären

=== Implementierung des Kernfeatures A / B / C / D / …
- Hier pro Funktionalität/Komponente deines Projektes ein Screenshot und/oder Code-Beispiel einfügen und erklären, wie
  du es umgesetzt hast
- Pro Komponente zuerst einen passenden Titel, dann eine einleitende Erklärung zu dieser Komponente, danach ein
  Screenshot und/oder Code-Beispiel mit Erklärung, was du genau wieso gemacht hast.

=== Vorbereitungen für den Upload / Live-Schaltung / Implementierung
- Ist das Live-Schalten Teil deiner Aufgabe?
- Egal ob ja oder nein, erkläre, wie die Live-Schaltung funktionieren würde

== Kontrollieren
- Bewertungskriterium B10

=== Beschreibung der Randbedingungen / Testanlage (Umfeld)
- Welche Voraussetzungen braucht es alles, damit das Projekt getestet werden kann? Was muss installiert/vorbereitet
  werden?
- Auf welchem Gerät mit welchen Versionen wird getestet? Browser-Version? Windows-Version? Gerät selbst?
- Alles so erklären, dass auch eine aussenstehende Person testen könnte
- Hier auch Screenshots mit Erklärungen einfügen

=== Testprotokoll
- Alle in der Planen-Phase definierten Testfälle werden jetzt hier durchgegangen

#for cell in test-cases {
  table(..test-cases-headers.values().flatten().zip(cell.values().flatten()).flatten())
}

=== Bugfixing
- Welche Fehler mussten noch behoben werden? Weshalb sind diese Fehler passiert/übersehen worden? Konnten sie noch vor
  Abgabe behoben werden oder wieso wurden sie nicht mehr behoben?

== Auswerten
- Kritisch beschreiben, was man gut fand und was man das nächste Mal besser machen würde
- Bewertungskriterium B3

=== Reflexion der Vorgehensweise
- Bist du zufrieden, wie und in welcher Reihenfolge du deine Tasks gemacht hast?

=== Bewertung des Produktes
- Wie passt dir das Endresultat? Bist du zufrieden? Wenn ja, wieso, wenn nein, wieso nicht?

=== Abweichungen zum Zeitplan
- Gab es gröbere Abweichungen von deinem Zeitplan? Kannst du dir erklären wieso? Was würdest du bei einem nächsten
  Projekt besser Planen?

=== Persönliches Schlusswort und Bilanz
- Zusammenfassend gesagt, wie bist du zufrieden, mit der Arbeit aber auch mit dir selbst? Würdest du etwas komplett
  anders machen? Was würdest du dir selbst in der Zukunft mitgeben, damit eine zukünftige Arbeit besser laufen würde?

== Glossar
- Alle Begriffe die eine IT-Fachperson ev. nicht wissen könnte. Bsp: Postman/Sanctum/Eloquent/Swagger/Three.js
- Begriffe die nur Firmenintern bekannt sind oder spezifisch bei einem Framework/Library vorkommen
- Es müssen nicht alle Buchstaben vorkommen
- Bewertungskriterium B6

#let glossary-terms = (
  A: (
    ([A], [A Erklärung]),
    ([Aa], [Aa Erklärung]),
  ),
  B: (
    ([B], [B Erklärung]),
  ),
)

#table(columns: (auto, auto, 1fr), ..glossary-terms
    .pairs()
    .map(((letter, terms)) => (
      table.cell(emph(letter), rowspan: terms.len() + 1),
      [*Begriff / Abkürzung*],
      [*Erklärung*],
      terms,
    ))
    .flatten())

== Quellenverzeichnis
- Hier gehören alle Links hin, die in der Arbeit bisher vorgekommen sind nochmals reinkopiert
- Bewertungskriterium B6

= Anhang

== Git-Commit-History
- Alle Commits hier einfügen, um zu beweisen, dass man Bewertungskriterium A12 erfüllt hat

== Projektjournal
- Falls während der IPA ein längeres Gespräch mit dem VF stattfindet, muss dieses Protokolliert und hier aufgeschrieben
  werden
- Gesprächsprotokoll vom xx. Monat yyyy

#let show-meeting(participants: (), date: [], place: [], notes: (), decisions: []) = table(
  table.cell([Teilnehmer], rowspan: participants.len()), ..participants,
  [Datum, Zeit], date,
  [Ort], place,
  table.cell([Besprechungsnotizen], rowspan: notes.len()), ..notes,
  table.cell([Getroffene Entscheidungen], rowspan: decisions.len()), ..decisions,
)

#show-meeting(
  participants: ([Sven Toye], [Name Vorname]),
  date: [28.12.2025],
  place: [Zürich],
  notes: ([],),
  decisions: ([],),
)

== Erster Expertenbesuch

#show-meeting(
  participants: ([Sven Toye], [Name Vorname]),
  date: [28.12.2025],
  place: [Zürich],
  notes: ([],),
  decisions: ([],),
)

== Zweiter Expertenbesuch

#show-meeting(
  participants: ([Sven Toye], [Name Vorname]),
  date: [28.12.2025],
  place: [Zürich],
  notes: ([],),
  decisions: ([],),
)

== Code
Der Code kann entweder hier schön formatiert, mit Zeilennummern und Syntax-Highlighting reinkopiert werden oder separat
al ZIP auf pkOrg hochgeladen werden. Auch wenn der Code hochgeladen wird, sollte hier ein Vermerk dazu stehen

=== `main.rs`
```rs
fn main() {
  println!("Hello, world");
}
```

=== `main.rs`
```rs
fn main() {
  println!("Hello, world");
}
```

== Zusätzliche Manuals, Skripts und weiteres
- Gibt es sonstigen Code der Abgegeben werden muss? Testfälle aus Postman? Swagger Datei?
- War es Teil der IPA, dass ein Manual geschrieben wird? Dann ganzes Manual hier reinkopieren

=== Handbuch A
```rs
fn main() {
  println!("Hello, world");
}
```

=== Skript B
```rs
fn main() {
  println!("Hello, world");
}
```

