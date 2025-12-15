#import "tools.typ": show-date-long, show-date-weekday, show-date-weekday-mini


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

#show link: underline
#show link: text.with(fill: blue)

#let hauptexperte = "Artjan Illi"
#let nebenexperte = "-"
#let berufsbildner = "René Bach"

#let show-criteria = false
// #let show-criteria = true

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
  show-date-long(2025, 12, 4),

  [2. Expertenbesuch],
  [],

  [Präsentation, Demonstration, Fachgespräch],
  [],
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

#include "zeitplan.typ"

#pagebreak()

== Arbeitsprotokoll

#if show-criteria [
  - Arbeitsprotokolle müssen täglich geführt werden! Experten kontrollieren das.
  - Für aussenstehende verständlich beschreiben. Nicht: «Es lief gut» (sagt nichts aus) Besser: «Ich konnte alle
    geplanten Arbeiten abschliessen und hatte keine Probleme».
  - Probleme auch für aussenstehende kurz beschreiben. Nicht: «ich hatte Probleme mit GIT». Besser: «Ich erhielt einen
    Fehler beim Pushen meines Repos. Ich habe die Lösung hier [Link einfügen] gefunden»
  - Wenn online Materialien verwendet wurden, Link reinkopieren. Nicht nur «Google» oder «Laravel Dokumentation»
    schreiben, sondern genauen Link auf Artikel/Seite
  - Schreibe kritisch und reflektiert. Nicht jeden Tag «Alles lief gut». Experten wollen sehen, dass ein Tag z.B.
    stressiger war, weil etwas unerwartetes passiert ist oder dass du mit deiner heutigen Leistung nicht zufrieden
    warst, weil du das Tagesziel nicht erreicht hast

  #pagebreak()
]


=== #show-date-long(2025, 12, 1)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Informieren und Aufgabenstellungen lesen
    - ERD erstellen
    - Zeitplan erstellen
    - Technologien auswählen
    - Git Repository erstellen
    - Dependencies herunterladen
    - Entities definieren
  ],
  [Ungeplante Arbeiten],
  [
    - Entities erstellen ging schneller als gedacht. Datenbank Docker Container aufgesetzt.
  ],
  // [geleistete Überstunden],
  // [_keine_],
  [Erreichte Ziele],
  [
    - Alle Ziele
    - Datebank Docker Container aufgesetzt, aber wurde nicht fertig.
    - Ausgewählte Technologien:
      - TypeScript (backend)
      - Node (Javascript runtime)
      - NestJS (web framework)
      - TypeORM (ORM)
      - MySQL (Datenbank)
      - PHPMyAdmin (Datenbank Dashboard)
      - Docker (Containerization)
      - Typst (Dokumente + Grafiken + Zeitplan + Diagramme)
      - PNPM (package manager)
      - VSCode (IDE)
      - Lazygit (Git Terminal UI)
  ],
  // [Erfolgserlebnisse],
  // [_keine_],
  [Herausforderungen],
  [
    - Ich habe Probleme, die Lerndoku zu schreiben. Das Projekt ist nicht neu, aber die Lerndoku gleichzeitig schreiben
      doch schon und ich konnte mich nicht wirklich auf die Aufgaben konzentrieren.
  ],
  [Probleme],
  [
    - Datenbank Verbindung scheiterte, weil die Umgebungsvariabeln falsch waren/nicht angegeben waren.
    - Mehrere Errors und Exceptions, als ich den Dev-Server gestartet habe. Auslöser ist unklar.
  ],
  [Lösungen],
  [
    - Das Docker Problem wurde am nächsten Arbeitstag gelöst.
  ],
  // [Durchgeführte Tests],
  // [_keine_],
  [Wissensbeschaffung],
  [
    - NestJS, TypeORM und Docker Fähigkeiten verbessert.
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/techniques/serialization
    - https://typeorm.io/docs/relations/many-to-one-one-to-many-relations
    - https://docs.docker.com/reference/compose-file/services
    - https://www.slingacademy.com/article/typescript-error-fix-the-types-have-no-overlap/
    - https://typeorm.io/docs/entity/entities
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
    - Requests definieren und erstellen
  ],
  // [Ungeplante Arbeiten],
  // [_keine_],
  // [geleistete Überstunden],
  // [_keine_],
  [Erreichte Ziele],
  [
    - Docker aufsetzen \
      Docker vereinfacht die Konfiguration von der Datenbank, ohne etwas herunterladen zu müssen.
      - Datenbank Container
      - Datenbank Dashboard Container
    - Migrations definieren
      - CSV Daten importieren
  ],
  [Erfolgserlebnisse],
  [
    - Alle Ziele erreicht
  ],
  [Herausforderungen],
  [
    - Docker/Docker Compose aufsetzen, sodass ich die
    - TypeORM CLI
  ],
  [Probleme],
  [
    - Die gleichen Docker Probleme von gestern.
  ],
  [Lösungen],
  [
    - Ich habe verschiedene Kombinationen von Umgebungsvariabeln probiert und Ports geändert, bis es funktioniert hat.
      Ich bin mir aber nicht ganz sicher was das Problem war und es könnte sein, dass etwas anderes es auch beeinflusst
      hat.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Docker Compose Fähigkeiten
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.docker.com/compose/how-tos/networking/
    - https://hub.docker.com/_/mysql/
    - https://dev.mysql.com/doc/refman/8.4/en/built-in-function-reference.html
    - https://docs.docker.com/get-started/docker-concepts/running-containers/publishing-ports/#use-docker-compose
    - https://typeorm.io/docs/migrations/why/#generating-migrations
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [Ungefähr gleich],
  [Persönliche Tagesreflexion],
  [Ich konnte mich besser konzentrieren als gestern.],
)
#pagebreak()

=== #show-date-long(2025, 12, 3)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Services erstellen
    - Controllers erstellen
  ],
  [Ungeplante Arbeiten],
  [
    - Relations
    - Serialisation
  ],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Alle
  ],
  [Erfolgserlebnisse],
  [
    - Relations definieren
    - Probleme mit Relations lösen.
  ],
  [Herausforderungen],
  [
    - Es gibt (und hat immer noch) mehrere Probleme mit den Relations. Die meisten wurden gelöst, aber nicht alle.
  ],
  [Probleme],
  [
    - Relations von der Tabelle, die referenziert wird, bearbeiten, hat nicht funktioniert. Ein `SquadPlayer` besitzt
      einen `Squad` und ein `Squad` kann von mehrere `SquadPlayer`s besitzt werden. Der `Squad` sollte den
      `SquadPlayer`, welcher ihn besitzt, bearbeiten können.
    - Serialisation hat nicht funktioniert, weil der `ClassSerializerInterceptor` nicht funktioniert hat.
    - Serialisation hat nicht funktioniert, weil es die Felder rekursiv in JSON umgewandelt hat.
    - Imports in der Datenbank-Konfiguration haben fehlgeschlagen.
  ],
  [Lösungen],
  [
    - Ich habe Cascades verwendet, sodass man der `Squad` den `SquadPlayer`, welcher ihn besitzt, bearbeiten können.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Ich habe gelernt, wie man besser mit Relations umgeht.
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://typeorm.io/docs/relations/relations/#cascades
    - https://dev.to/mgohin/typeorm-remove-children-with-orphanedrowaction-4m7b
    - https://typeorm.io/docs/relations/many-to-one-one-to-many-relations
    - https://docs.nestjs.com/techniques/database#database
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Ich habe mehr erledigt als gedacht.
  ],
  [Persönliche Tagesreflexion],
  [
    - Ich habe ganz viele Probleme gelöst, aber ich hatte nicht genug Zeit, die Lerndoku zu schreiben.
  ],
)
#pagebreak()

=== #show-date-long(2025, 12, 4)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Relationen
    - Datenbank
  ],
  // [Ungeplante Arbeiten],
  // [],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Relationen
    - Service
  ],
  [Erfolgserlebnisse],
  [
    - Ich habe das letzte Problem mit den Relationen gelöst und es im Service umgesetzt.
  ],
  [Herausforderungen],
  [
    - Es gab noch ein letztes Problem mit den Relationen.
  ],
  [Probleme],
  [
    - Relationen im Service und im Controller umsetzen.
    - `ClassSerializerInterceptor` hat nicht funktioniert.
    - Die Fremdschlüssel waren nullable.
    - Die Fremdschlüssel hatten keine Datenbank On-Update-/On-Delete-Cascades.
  ],
  [Lösungen],
  [
    - Fremdschlüssel im Entity anpassen und neue Migrations erstellen.
    - Interceptor im Controller hinzufügen.
    - Service anpassen, sodass die Relationen richtig funktionieren.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Wie man Relationen mit dem Service verwendet.
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://typeorm.io/docs/entity/entities
    - https://typeorm.io/docs/relations/relations/#cascades
    - https://typeorm.io/docs/relations/many-to-one-one-to-many-relations
    - https://docs.nestjs.com/interceptors#binding-interceptors
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Die Datenbank war schon fertig.
  ],
  [Persönliche Tagesreflexion],
  [
    - Die Relationen funktionieren jetzt.
  ],
)

=== #show-date-long(2025, 12, 5)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Migrationen definieren
    - Authentifizierung definieren
  ],
  // [Ungeplante Arbeiten],
  // [],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Authentifizierung
  ],
  [Erfolgserlebnisse],
  [
    - Authentifizierung
  ],
  [Herausforderungen],
  [
    - JWT Guards
  ],
  [Probleme],
  [
    - Die JWT Guards im Controller haben nicht funktioniert.
    - Git Commits gerebast statt gemergt.
  ],
  [Lösungen],
  [
    - `UseGuards` und die Authentifizierungs-Konfiguration angepasst.
    - Git Rebase Commits rückgängig gemacht und gemergt.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Wie man Probleme mit den JWT Guards löst.
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/security/authentication
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [Ungefär gleich, aber ich habe zu viel Zeit einplant.],
  [Persönliche Tagesreflexion],
  [
    - Authentifizierung fertig
  ],
)

=== #show-date-long(2025, 12, 8)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Authentifizierung
    - Swagger
  ],
  // [Ungeplante Arbeiten],
  // [],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Swagger
    - Controller verbessern, sodass es die Aufgabenstellung erspricht
  ],
  [Erfolgserlebnisse],
  [
    - Swagger Api Docs erstellen
  ],
  [Herausforderungen],
  [
    - Swagger Decorators verwenden, um die Endpoints zu dokumentieren.
  ],
  [Probleme],
  [],
  [Lösungen],
  [],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/interceptors
    - https://docs.nestjs.com/openapi/types-and-parameters
    - https://docs.nestjs.com/openapi/cli-plugin
    - https://docs.nestjs.com/openapi/operations
  ],
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
#if show-criteria [
  - Bewertungskriterien: B1
]

=== Ausgangssituation
#if show-criteria [
  - Soll nicht 1:1 aus pkOrg kopiert sein, sondern in eigenen Worten zusammengefasst, wieso diese IPA gebraucht wird bei
    twofold. Bsp: «Uns hat im Büro das und das gefehlt und deswegen brauchen wir ein Tool welches das und das macht»
]

=== Umsetzung
#if show-criteria [
  - Erklären, wie du vorgegangen bist, um das Problem aus der Ausgangssituation zu lösen. Kurz beschreiben, welche
    Schritte in der IPA gemacht wurde. Bsp: «Ich habe mich für ein Laravel-Projekt entschieden welches als REST-API
    aufgebaut wird und …»
]

=== Ergebnis
#if show-criteria [
  - Erklären was das Endresultat ist. Bsp: «Ein Tool welches diese und diese Funktionailtät bietet und das und das
    erleichtert»
]

== Informieren

=== Verstandene Aufgabenstellung und Ziel der Arbeit
#if show-criteria [
  - Was soll als Produkt dieser Arbeit entstehen? Bsp: «Ein Laravel API-Backend in welchem, …»
  - Wie soll das Projekt umgesetzt werden? Welche Vorgaben gibt es? Muss eine Datenbank benutzt werden?
    Programmiersprachen, …
]

=== Ausgangslage
#if show-criteria [
  - Gibt es schon vorbereitete Mockups oder Designs? Falls Ja, hier alle Screenshots rein und erklären, welche
    Funktionalitäten pro Screenshot erkennbar sind und umgesetzt werden müssen
  - Ist die Arbeit nur ein Teilprojekt? Falls ja, bestehende Projekt erklären und ggf. mit Screenshots zeigen/erklären
    Falls noch nichts besteht kann dieser Punkt auch weggelassen werden
]

=== Abklärungen
#if show-criteria [
  - Was ist dir noch nicht klar aus der Aufgabenstellung/was musstest du beim VF nachfragen/Wo gibt es mehrere
    Varianten? Hier auflisten, mit den Antworten des VF oder möglichen Varianten, für die du dich später entscheiden
    kannst
]

=== Verfeinerung des Auftrages
#if show-criteria [
  - Welche Aufträge aus der Aufgabenstellung müssen zwar nicht mit dem VF abgeklärt werden/gibt es keine Varianten, aber
    müssen vielleicht noch etwas genauer beschrieben werden?
  - Dieser Punkt ist ev. nicht nötig, wenn alles unter «Abklärung» drin ist
]

=== Projektumfeld und Systemgrenzen
#if show-criteria [
  - Welche Datenbank-Version? Welche PHP-Version? Werden spezielle PHP-Extensions benötigt? Wird das Projekt mit
    externen Diensten Verbunden? Was genau am Projekt machst du an der IPA und was gehört nicht dazu?
  - Bewertungskriterium A5
]

== Planen

=== Verwendete Projektmanagementmethode
#if show-criteria [
  - Die Schritte von IPERKA erklären und was pro Schritt grob gemacht wird. Je 1-2 Sätze
  - Bewertungskriterium A1
]

=== Versionierung und Datensicherheit
#if show-criteria [
  - Täglich mindestens 1x git push mit sinnvoller Commit Message. Online nachkontrollieren, ob alles geklappt hat!
  - Doku und Zeitplan können im gleichen Repo auch versioniert werden
  - Hier erklären, wie die Versionierung gemacht wird. Bsp: «Täglich wird auf unser firmeninternes GitLab gepusht.»
  - Alles auch noch auf zweite Art sichern und hier beschreiben
  - GIT Commit History muss entweder direkt hier oder im Anhang eingefügt werden. Falls im Anhang, hier beschreiben
  - Wird von den Experten bei den Expertenbesuchen überprüft!
  - Bewertungskriterium A12
]

=== Priorisierung der Tätigkeiten
#if show-criteria [
  - Alle Tätigkeiten (mindestens die, die im Zeitplan sind) hier auflisten und priorisieren (Hoch, Mittel, Niedrig)
  - Bewertunskriterium A8
]
#table(
  table.header(
    [*Beschreibung der Tätigkeit*],
    [*Priorität*],
  ),
)

=== Use-Case Diagramm / Aktivitätsdiagramm / Klassendiagramm / … Gesamtsystem
#if show-criteria [
  - Je nach Projekt sollte mindestens eines, besser aber mehrere dieser Diagramme eingefügt werden. Die Diagramme sollen
    das gesamte System zeigen
  - Es müssen nicht zwingend nur die oben genannten Diagramm-Arten sein. Falls dein Projekt besser mit einer eigenen
    Diagramm-Art erklärt werden kann, ist das auch in Ordnung
  - Hier jeweils zuerst den Titel, dann das Diagramm und danach eine Beschreibung, was im Diagramm ersichtlich ist und
    ggf. zusätzliche Infos zum gesamten Aufbau des Projekts
  - Bewertungskriterium A4
]

=== ERD
#if show-criteria [
  - Falls dein Projekt eine Datenbank hat, solltest du hier ein ERD einfügen und beschreiben
  - Datenbank muss in 3. Normalform sein!
  - Im ERD oder im Text darunter muss ersichtlich sein:
    - welche Beziehungen die Tabellen zueinander haben (mc, c, …)
    - welche die Primär und Fremdschlüssel sind
    - welche Datentypen die Spalten sind
  - Individuelle Bewertungskriterien
]

#pagebreak()

#include "erd.typ"

#pagebreak()

=== Routen
#if show-criteria [
  - Falls dein Projekt verschiedene Routen hat oder eine API ist kannst du hier die Routen in einer Tabelle oder Liste
    aufzeigen
  - Je nach Projekt musst du hier auch angeben, wie die Route angesprochen wird (POST, GET, …), die Route schematisch
    und mit Beispielen zeigen oder noch weitere Relevante Infos
]

#include "endpoints.typ"

#pagebreak()

=== Use-Case Diagramm / Aktivitätsdiagramm / Klassendiagramm / … Funktion XYZ
#if show-criteria [
  - Hier müssen ggf. die einzelnen Funktionen/Teilsysteme mit spezifischeren Diagrammen erklärt werden. Bsp:
    Login-System, Bild-Upload, …
  - Hier jeweils zuerst den Titel, dann das Diagramm und danach eine Beschreibung, was im Diagramm ersichtlich ist.
  - Ev. gibt es für die Teilsysteme keine geeigneten Diagramme, dann muss mit Text erklärt werden, wie die Funktion
    umgesetzt wird
  - Bewertungskriterium A4
]

=== Testkonzept
#if show-criteria [
  - Bewertungskriterium A6
]

==== Testmethode
#if show-criteria [
  - Wie wirst du deine Arbeit testen? Mit Postman/Insomnia? Von Hand? Welche Testart? Blackbox/Whitebox testing?
  - Testmethode beschreiben und erklären. Was ist whitebox-Testing?
]

==== Testmittel
#if show-criteria [
  - Welche Soft- und Hardware in welchen Versionen hast du zum Testen verwendet?
  - Beschreibe einer aussenstehenden Person, was sie alles machen muss, damit sie selbst dein Projekt auch testen könnte
  - Braucht dein Projekt ein Login? Das ebenfalls zeigen/erklären
]

==== Abgrenzung
#if show-criteria [
  - Was am System testest du genau? Bis wo hin?
  - Was testet du bewusst nicht?
]

==== Testfälle
#if show-criteria [
  - Testfälle müssen so genau definiert werden, dass eine aussenstehende Person diese auch durchführen könnte
  - Auch Vorbedingungen müssen erklärt werden, wie man zu diesem Zustand kommt
  - Nicht nur testen, was funktionieren soll (Positiv-Tests) sondern auch, was nicht funktionieren soll (Negativ-Tests)
]

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
#if show-criteria [
  - Gibt es etwas, dass du einer aussenstehenden Person zu deinem Zeitplan erklären müsstest, dass nicht schon klar
    ersichtlich ist?
]

== Entscheiden
#if show-criteria [
  - Mindestens zwei Entscheidungen
  - pro Entscheidung eine allgemeine Beschreibung, zwei oder mehr Varianten und dann wofür du dich entschieden hast
  - Entscheidungskriterium B3
]

=== Beschreibung Entscheidung 1
#if show-criteria [
  - Kurz beschreiben, was du entscheiden musstest und wieso
  - Bsp: welches Framework zu benutzen? Welche Programmiersprache? Wie ein Problem programmiert werden soll, …
]

=== Beschreibung Variante a / b / c / …
#if show-criteria [
  - Beschreibe die Vor- und Nachteile aller Varianten zur Entscheidung 1
]

=== Entscheidung 1
#if show-criteria [
  - Hier erläutern, für was du dich entschieden hast und wieso.
  - Eine Entscheidungsmatrix kann hier helfen
]

== Realisieren
#if show-criteria [
  - Hier soll alles, was in der Planen Phase geplant wurde, beschrieben werden, wie du es schlussendlich umgesetzt hast
  - In dieser Phase solltest du überall mit Screenshots und/oder Code-Beispielen zeigen, wie du etwas umgesetzt hast
  - Wenn du auf Probleme gestossen bist, kannst du diese hier auch kurz beschreiben, mit einem Link zur Lösung auf
    StackOverflow (Direktlink zur Antwort) oder sonstige Links
  - Wenn du für deine Lösung ein Framework oder Library verwendet hast, kannst du das hier auch beschreiben, mit Link
    zur GitHub-Page
  - Bewertungskriterien A2, A8, A9, A10, A11, A13 + individuelle Kriterien
]

=== Abbildung des Gesamtsystems

=== Grundaufbau / Architektur des Projektes

=== Vorgehensweise

=== Datenbank
#if show-criteria [
  - Wie sieht deine Datenbank nach der Realisierung aus? Hat sich etwas verändert ggü. Der Planungs-Phase?
  - Hier kannst du auch das verbesserte ERD einfügen und erklären, was sich wieso geändert hat
]

=== Anbindung an die Datenbank
#if show-criteria [
  - Wie funktioniert die Anbindung/Kommunikation mit der Datenbank in deinem Projekt?
]

=== Routen
#if show-criteria [
  - Wie sehen deine Routen nach der Realisierung aus? Hat sich etwas verändert ggü. Der Planungs-Phase?
  - Hier erklären, was sich wieso geändert hat
  - Wie hast du das Routing gelöst? Code-Beispiele einfügen und erklären
]

=== Implementierung des Kernfeatures A / B / C / D / …
#if show-criteria [
  - Hier pro Funktionalität/Komponente deines Projektes ein Screenshot und/oder Code-Beispiel einfügen und erklären, wie
    du es umgesetzt hast
  - Pro Komponente zuerst einen passenden Titel, dann eine einleitende Erklärung zu dieser Komponente, danach ein
    Screenshot und/oder Code-Beispiel mit Erklärung, was du genau wieso gemacht hast.
]

=== Vorbereitungen für den Upload / Live-Schaltung / Implementierung
#if show-criteria [
  - Ist das Live-Schalten Teil deiner Aufgabe?
  - Egal ob ja oder nein, erkläre, wie die Live-Schaltung funktionieren würde
]

== Kontrollieren

=== Beschreibung der Randbedingungen / Testanlage (Umfeld)
#if show-criteria [
  - Welche Voraussetzungen braucht es alles, damit das Projekt getestet werden kann? Was muss installiert/vorbereitet
    werden?
  - Auf welchem Gerät mit welchen Versionen wird getestet? Browser-Version? Windows-Version? Gerät selbst?
  - Alles so erklären, dass auch eine aussenstehende Person testen könnte
  - Hier auch Screenshots mit Erklärungen einfügen
]

=== Testprotokoll
#if show-criteria [
  - Alle in der Planen-Phase definierten Testfälle werden jetzt hier durchgegangen
]

#for cell in test-cases {
  table(..test-cases-headers.values().flatten().zip(cell.values().flatten()).flatten())
}

=== Bugfixing
#if show-criteria [
  - Welche Fehler mussten noch behoben werden? Weshalb sind diese Fehler passiert/übersehen worden? Konnten sie noch vor
    Abgabe behoben werden oder wieso wurden sie nicht mehr behoben?
]

== Auswerten
#if show-criteria [
  - Kritisch beschreiben, was man gut fand und was man das nächste Mal besser machen würde
]

=== Reflexion der Vorgehensweise
#if show-criteria [
  - Bist du zufrieden, wie und in welcher Reihenfolge du deine Tasks gemacht hast?
]

=== Bewertung des Produktes
#if show-criteria [
  - Wie passt dir das Endresultat? Bist du zufrieden? Wenn ja, wieso, wenn nein, wieso nicht?
]

=== Abweichungen zum Zeitplan
#if show-criteria [
  - Gab es gröbere Abweichungen von deinem Zeitplan? Kannst du dir erklären wieso? Was würdest du bei einem nächsten
    Projekt besser Planen?
]

=== Persönliches Schlusswort und Bilanz
#if show-criteria [
  - Zusammenfassend gesagt, wie bist du zufrieden, mit der Arbeit aber auch mit dir selbst? Würdest du etwas komplett
    anders machen? Was würdest du dir selbst in der Zukunft mitgeben, damit eine zukünftige Arbeit besser laufen würde?
]

== Glossar

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
#if show-criteria [
  - Hier gehören alle Links hin, die in der Arbeit bisher vorgekommen sind nochmals reinkopiert
]

= Anhang

== Git-Commit-History
#if show-criteria [
  - Alle Commits hier einfügen, um zu beweisen, dass man Bewertungskriterium A12 erfüllt hat
]

== Projektjournal
#if show-criteria [
  - Falls während der IPA ein längeres Gespräch mit dem VF stattfindet, muss dieses Protokolliert und hier
    aufgeschrieben werden
  - Gesprächsprotokoll vom xx. Monat yyyy
]

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
#if show-criteria [
  Der Code kann entweder hier schön formatiert, mit Zeilennummern und Syntax-Highlighting reinkopiert werden oder
  separat al ZIP auf pkOrg hochgeladen werden. Auch wenn der Code hochgeladen wird, sollte hier ein Vermerk dazu stehen
]

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
#if show-criteria [
  - Gibt es sonstigen Code der Abgegeben werden muss? Testfälle aus Postman? Swagger Datei?
  - War es Teil der IPA, dass ein Manual geschrieben wird? Dann ganzes Manual hier reinkopieren
]

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

