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
    - Entities erstellen ging schneller als gedacht. Datenbank Docker Container aufgesetzt am Ende des Tages aufgesetzt,
      um die Entities zu testen.
  ],
  // [geleistete Überstunden],
  // [_keine_],
  [Erreichte Ziele],
  [
    - Alle Ziele
    - Datebank Docker Container aufgesetzt, aber wurde nicht fertig.
    - Ausgewählte Technologien:
      - TypeScript (backend)
      - NestJS (web framework)
      - TypeORM (ORM)
      - Node (Javascript runtime)
      - PNPM (package manager)
      - MySQL (Datenbank)
      - PHPMyAdmin (Datenbank Dashboard)
      - Docker (Containerization)
      - Typst (Dokumente + Grafiken + Zeitplan + Diagramme)
      - VSCode (IDE)
      - Lazygit (Git Terminal UI)
  ],
  // [Erfolgserlebnisse],
  // [_keine_],
  [Herausforderungen],
  [
    - Ich hatte Probleme, die Lerndoku zu schreiben. Das Projekt ist nicht neu, aber die Lerndoku gleichzeitig schreiben
      doch schon und ich konnte mich nicht wirklich auf die Aufgaben konzentrieren.
  ],
  [Probleme],
  [
    - Datenbank Verbindung scheiterte, weil die Umgebungsvariabeln falsch waren/nicht angegeben waren.
    - Mehrere Errors und Exceptions, als ich den Dev-Server gestartet habe. Auslöser ist unklar.
  ],
  [Lösungen],
  [
    - Das Datenbank Problem wurde am nächsten Arbeitstag gelöst.
    - Ich bin mir nicht sicher, wie ich das Problem mit dem Dev-Server gelöst habe, aber ich vermute, dass es etwas mit
      dem Datenbank Problem zu tun hatte.
  ],
  // [Durchgeführte Tests],
  // [_keine_],
  [Wissensbeschaffung],
  [
    - NestJS und TypeORM Fähigkeiten verbessert.
    - Docker und Docker Compose verwendet, um die Datenbank aufzusetzen und zu konfigurieren.
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/techniques/serialization
    - https://typeorm.io/docs/relations/many-to-one-one-to-many-relations
    - https://www.slingacademy.com/article/typescript-error-fix-the-types-have-no-overlap/
    - https://typeorm.io/docs/entity/entities
    - https://docs.docker.com/reference/compose-file/services
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    Am Morgen war ich viel langsamer als geplant, weil ich mich nicht konzentrieren konnte, aber am Nachmittag war ich
    viel schneller.
  ],
  [Persönliche Tagesreflexion],
  [
    Ich konnte mich nicht wirklich konzentrieren. Obwohl ich mehr erledigt als geplant habe, kam der Tag mir sehr
    unproduktiv vor.
  ],
)
#pagebreak()

=== #show-date-long(2025, 12, 2) (bis 12:00)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Request DTOs definieren und erstellen.
  ],
  // [_keine_],
  // [geleistete Überstunden],
  // [_keine_],
  // [Erreichte Ziele],
  [Ungeplante Arbeiten],
  [
    - Docker aufsetzen \
      Docker vereinfacht die Konfiguration von der Datenbank, ohne lokal Software installieren oder konfigurieren zu
      müssen.
      - Datenbank Container
      - Datenbank Dashboard Container
    - Migrationen definieren
      - TypeORM CLI verwenden, um Migrationen zu generieren.
      - CSV Daten importieren.
  ],
  [Erfolgserlebnisse],
  [
    - Request DTOs erstellt.
    - Datenbank aufgesetzt mit Docker.
  ],
  [Herausforderungen],
  [
    - Docker/Docker Compose aufsetzen und konfigurieren.
    - TypeORM CLI verwenden, um Migrationen erstellen.
  ],
  [Probleme],
  [
    - Die gleichen Docker Probleme von gestern.
    - Die Build-Scripts hatte Kompatibilitäts-Probleme mit dem TypeORM CLI.
    - Die TypeORM CLI hat die Migrationen falsch generiert.
  ],
  [Lösungen],
  [
    - Verschiedene Kombinationen von Umgebungsvariabeln probiert und Ports geändert, bis es funktioniert hat. Ich bin
      mir aber nicht ganz sicher was das Problem war und es könnte sein, dass etwas anderes es auch beeinflusst hat.
    - Build-Scripts angepasst, sodass das TypeORM CLI funktioniert.
    - TypeORM CLI Migrationen-Kommando angepasst, sodass die Migrationen korrekt generiert werden.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Docker Compose Fähigkeiten verbessert.
    - Welche Umgebungsvariabeln braucht, um den MySQL Container angepasst.
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
  [Datenbank und Migrationen Aufgaben statt Request gelöst.],
  [Persönliche Tagesreflexion],
  [Ich konnte mich besser konzentrieren als gestern.],
)
#pagebreak()

=== #show-date-long(2025, 12, 3)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Services erstellen.
    - Controllers erstellen.
    - Relationen definieren.
  ],
  [Ungeplante Arbeiten],
  [
    - Requests erstellen.
    - Services erstellen.
    - Controllers erstellen.
    - Relationen definieren.
    - Serialisation implementieren.
  ],
  // [geleistete Überstunden],
  // [],
  // [Erreichte Ziele],
  // [],
  [Erfolgserlebnisse],
  [
    - Relationen definiert und Relationen-Probleme gelöst.
    - Serialisation implementieren.
  ],
  [Herausforderungen],
  [
    - Es gibt (und hat immer noch) mehrere Probleme mit den Relationen. Die meisten wurden gelöst, aber nicht alle.
  ],
  [Probleme],
  [
    - Relationen von der Tabelle, die referenziert wird, bearbeiten, hat nicht funktioniert. Ein `SquadPlayer` besitzt
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
    - Ich habe gelernt, wie man besser mit Relationen umgeht.
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
    - Ich habe ganz viele Probleme gelöst, aber ich hatte nicht genug Zeit, das Arbeitsjournal zu führen.
  ],
)
#pagebreak()

=== #show-date-long(2025, 12, 4)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Datenbank
  ],
  // [Ungeplante Arbeiten],
  // [],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Relationen verbessern.
    - Service verbessern, sodass sie mit den Relationen funktionieren.
    - Serialisation-Probleme lösen.
  ],
  [Erfolgserlebnisse],
  [
    - Ich habe das letzte Problem mit den Relationen gelöst und es im Service umgesetzt.
    - Ich habe die Relationen-Probleme von gestern gelöst.
    - Ich habe die Serialisation-Probleme von gestern gelöst.
  ],
  [Herausforderungen],
  [
    - Es gab noch ein letztes Problem mit den Relationen, dass ich gestern nicht lösen konnte.
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
    - Die Datenbank war schon fertig und ich habe stattdessen die Probleme von gestern gelöst.
  ],
  [Persönliche Tagesreflexion],
  [
    - Die Relationen und Serialisation funktionieren jetzt.
    - Ich habe Feedback vom Expertenbesuch im Arbeitsjournal gewendet.
  ],
)
#pagebreak()

=== #show-date-long(2025, 12, 5)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Migrationen definieren.
    - Authentifizierung
  ],
  // [Ungeplante Arbeiten],
  // [],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Authentifizierung implementieren.
  ],
  // [Erfolgserlebnisse],
  // [
  //   - Authentifizierung
  // ],
  [Herausforderungen],
  [
    - JWT Guards im Controller einsetzen.
    - Konfiguration für Authentifizierung hat nicht funktioniert.
  ],
  [Probleme],
  [
    - Die JWT Guards im Controller haben nicht funktioniert.
    - Git Commits gerebast statt gemergt. Die Commits waren im falschen Branch.
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
    - Wie man Authentifizierung mit JWT Guards implementiert.
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/security/authentication
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [Ungefähr gleich, aber ich habe zu viel Zeit einplant.],
  [Persönliche Tagesreflexion],
  [
    - Authentifizierung fertig und einsatzbereit.
  ],
)
#pagebreak()

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
    - Swagger implementieren.
    - Controller verbessern, sodass es die Aufgabenstellung erspricht.
  ],
  [Erfolgserlebnisse],
  [
    - Swagger implementieren. Swagger UI ist auf `/api` verfügbar.
    - Endpoints
      - Request-Typ
      - Response-Typ
      - Parameter-Typ
      - Beschreibung
      - JWT Guards
    - DTOs
      - Typ
      - Beschreibung
      - Beispiele
  ],
  [Herausforderungen],
  [
    - Endpoints und DTOs mit Swagger dokumentieren.
    - Swagger Decorators
  ],
  [Probleme],
  [
    - Swagger Decorators verwenden, um die Endpoints zu dokumentieren.
    - NestJS und Swagger Integration
  ],
  [Lösungen],
  [
    - Decorators und Konfiguration angepasst und verbessert.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Swagger Fähigkeiten
    - Swagger mit NestJS Fähigkeiten (Decorators)
    - OpenAPI Spec
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/interceptors
    - https://docs.nestjs.com/openapi/types-and-parameters
    - https://docs.nestjs.com/openapi/cli-plugin
    - https://docs.nestjs.com/openapi/operations
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Swagger Aufgaben gelöst statt Authentifizierung
  ],
  [Persönliche Tagesreflexion],
  [
    - Swagger erflogreich umgesetzt.
  ],
)

=== #show-date-long(2025, 12, 9) (bis 12:00)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Fehler-Behebung
  ],
  [Ungeplante Arbeiten],
  [
    - Swagger-Dokumentation verbessern und erweitern
    - Relationen verbessert, sodass es die Aufgabenstellung entspricht. Ein Squad soll mehere Trainer besitzen können.
  ],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Swagger erweitert.
    - Relationen verbessert.
  ],
  [Erfolgserlebnisse],
  [
    - Swagger
    - Relationen
  ],
  [Herausforderungen],
  [
    - Relationen
    - Migrationen
  ],
  [Probleme],
  [
    - Die Migrationen hatten Konflikte und ich konnte es nicht anpassen oder rückgängig machen.
  ],
  [Lösungen],
  [
    - Migrationen rückgängig gemacht und neu erstellt.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Swagger
    - Relationen
    - Migrationen
    - TypeORM CLI
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/openapi/types-and-parameters
    - https://docs.nestjs.com/openapi/introduction#setup-options
    - https://typeorm.io/docs/relations/many-to-many-relations#many-to-many-relations-with-custom-properties
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Aufgabe war, Fehler zu finden und zu beheben, aber ich habe Swagger implementiert und die Relationen-Probleme
      gelöst.
  ],
  [Persönliche Tagesreflexion],
  [
    - Viel Fortschritt in kurze Zeit
  ],
)

=== #show-date-long(2025, 12, 10)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Testing
  ],
  // [Ungeplante Arbeiten],
  // [],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - End-to-End Testing
  ],
  // [Erfolgserlebnisse],
  // [],
  // [Herausforderungen],
  // [],
  [Probleme],
  [
    - Jest für NestJS einsetzen.
  ],
  [Lösungen],
  [
    - Ich habe Deepseek gefragt, den Boilerplate zu generieren.
    - Imports angepasst.
  ],
  // [Durchgeführte Tests],
  // [],
  // [Wissensbeschaffung],
  // [],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/fundamentals/testing
    - https://stackoverflow.com/questions/60652617/how-to-mock-repository-service-and-controller-in-nestjs-typeorm-jest
    - https://stackoverflow.com/questions/55366037/inject-typeorm-repository-into-nestjs-service-for-mock-data-testing?rq=3
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Ungefähr gleich
  ],
  [Persönliche Tagesreflexion],
  [
    - Nicht sehr viel Fortschritt
  ],
)

=== #show-date-long(2025, 12, 11)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Testing und Fehlerbehebung
  ],
  // [Ungeplante Arbeiten],
  // [],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Testing gerefactored und automatisiert, sodass man die Tests nur ein Mal definieren kann und für jeden Endpoint
      wiederverwenden.
    - Fehler behoben.
    - Neue Tests für Spieler und Trainer erfolgreich implementiert.
  ],
  [Erfolgserlebnisse],
  [
    - Testing verbessert, sodass ich die Tests wiederverwenden kann, ohne es für jeden Endpoint zu repetieren.
    - Fehler mit Tests gefunden und gelöst.
  ],
  // [Herausforderungen],
  // [],
  [Probleme],
  [
    - Tests refactoren.
  ],
  [Lösungen],
  [
    - Bug lösen
    - Tests gerefactored.
  ],
  // [Durchgeführte Tests],
  // [],
  [Wissensbeschaffung],
  [
    - Wie man E2E Tests implementiert.
  ],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/fundamentals/testing
    - https://stackoverflow.com/questions/60652617/how-to-mock-repository-service-and-controller-in-nestjs-typeorm-jest
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Ich habe die Tests verbessert, statt das Arbeitsjournal zu schreiben.
  ],
  [Persönliche Tagesreflexion],
  [
    - Probleme mit den Tests überwunden und Fehler mit Tests gefunden.
  ],
)

=== #show-date-long(2025, 12, 12)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Puffer-Zeit
    - Arbeitsjournal führen
  ],
  [Ungeplante Arbeiten],
  [
    - Tests verbessern.
    - Tests für SquadPlayer implementiert.
    - Fehler finden.
    - Fehler lösen.
  ],
  // [geleistete Überstunden],
  // [],
  // [Erreichte Ziele],
  // [],
  [Erfolgserlebnisse],
  [
    - Tests für SquadPlayer verbessern.
    - Tests verbessern.
  ],
  [Herausforderungen],
  [
    - Mock-Datenbank
  ],
  [Probleme],
  [
    - Mock-Datenbank-Verbindung fehlgeschlagen.
  ],
  [Lösungen],
  [
    - Imports angepasst.
    - App-Modul-Providers im Tests angepasst
  ],
  // [Durchgeführte Tests],
  // [],
  // [Wissensbeschaffung],
  // [],
  [Beanspruchte Hilfeleistung],
  [
    - https://docs.nestjs.com/fundamentals/testing
  ],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Ich hatte keine Zeit, das Arbeitsjournal zu führen.
  ],
  [Persönliche Tagesreflexion],
  [
    - Sehr viele Fehler behoben, aber ich hatte keine Zeit, das Arbeitsjournal zu schreiben.
  ],
)

=== #show-date-long(2025, 12, 15)
#table(
  [Tagesziele gemäss Zeitplan],
  [
    - Arbeitsjournal führen
    - Reflexion und Fazit
    - Dokumentation abschliessen
  ],
  [Ungeplante Arbeiten],
  [
    - Die Einträge im Arbeitsjournal nachholen, weil ich in den vergangen Tagen nicht gemacht habe.
  ],
  // [geleistete Überstunden],
  // [],
  [Erreichte Ziele],
  [
    - Arbeitsjournal
  ],
  // [Erfolgserlebnisse],
  // [],
  [Herausforderungen],
  [
    - Arbeitsjournal abschliessen
    - Nicht genug Zeit
  ],
  // [Probleme],
  // [],
  // [Lösungen],
  // [],
  // [Durchgeführte Tests],
  // [],
  // [Wissensbeschaffung],
  // [],
  // [Beanspruchte Hilfeleistung],
  // [],
  [Vergleich mit dem Soll-Zeitplan],
  [
    - Ich hatte nicht genug Zeit und die letzen drei Tagen vom Arbeitsjournal sind nicht sehr ausführlich.
  ],
  [Persönliche Tagesreflexion],
  [
    - Die letzten Teil vom Arbeitsjournal fehlen teilweise oder sind nicht sehr ausführlich. Ich habe zu lange gewartet,
      es zu schreiben.
  ],
)

= Teil 2: Projekt

== Informieren

Eine REST API für die Verwaltung von Spierler*innen, Trainer*innen und Teamaufstellungen. \

=== Ausgangssituation

Der Fussballverein des VfB Zürich-Leutschenbach verschickt zu jedem Spieltag seiner Jugendmannschaften eine Email an die
Spieler/-innen und deren Eltern, in der der jeweilige Mannschaftskader bekannt gegeben wird.

Um diese Nachricht attraktiver zu gestalten und damit potentielle neue Spieler/-innen zu gewinnen, möchte der
Vereinspräsident seinen Trainer/-innen eine WebApp zur Verfügung stellen, mit deren Hilfe sie den Kader des jeweiligen
Spieles zusammenstellen können. Dieser Kader kann dann über eine definierte URL aufgerufen und per Email oder Whatsapp
verschickt werden.

Spieler*innen und Trainer*innen können jeweils in mehreren Teamkadern gleichzeitig eingesetzt werden.

Teamkader müssen nicht aus Spieler*innen des gleichen Geschlechts bestehen, sondern dürfen auch gemischt sein.

Speiler*innen können verschiedene Positionen in unterschiedlichen haben.

Folgende Spielpositionen gibt es: Tor, Abwehr, Mittelfeld, Sturm, Ersatzspieler

Pro Teamkader können mehrere Trainer*innen gesetzt werden.

Aufgabe dieser PIPA ist es, eine dokumentierte REST Schnittstelle zur Verfügung zu stellen, die beim Bau der Frontend
Applikation (NICHT TEIL DIESER API!) verwendet werden kann.

==== Screendesign

https://miro.com/app/board/uXjVJupqp9M=/?sharelinkid=685326180791

==== Detaillierte Aufgabenstellung

Der Fokus dieser IPA liegt ausschliesslich auf der Erstellung einer REST API.

- Aufsetzen eines Gitlab Repositories, mit README, welches den Gebrauch der App beschreibt.
- Aufsetzen eines Nest.JS Projektes
- Einsatz von Code Qualitäts Tools (prettier, eslint)
- Programmiersprache ist TypeScript.
- Die Auswahl der Datenbank wird dem Kandidaten überlassen. Die Entscheidung muss in der Dokumentation erläutert werden.

Für einen potentiellen Frontend Entwickler, der die APP umsetzt, muss eine REST API erstellt werden. Die API wird mit
Hilfe des Tools “Swagger” dokumentiert. Folgende Endpunkte müssen erstellt werden:

- `/api/player,  /api/player/:id`
  - Felder: id, first_name, last_name, gender (male, female, diverse)
  - GET (protected): Auslesen einzelner und aller Spieler
  - POST (protected): Anlegen einzelner Spieler*innen
  - PUT (protected): Änderung einer bestehend Spieler*in
  - DELETE (protected): Löschen einer Spieler*in

- `/api/trainer, /api/trainer/:id`
  - Felder: id, first_name, last_name, gender (male, female, diverse)
  - GET (protected): Auslesen einzelner und aller Trainer*innen
  - POST (protected): Anlegen einzelner Trainer*innen
  - PUT (protected): Änderung einer bestehend Trainer*in
  - DELETE (protected): Löschen einer Trainer*in

- `/api/squad, /api/squad/:id`
  - Felder: id, description, date, player (list of players + positions), trainer (list of trainers)
  - GET all squad (protected): Liste aller existierenden Teamkader
  - GET single squad (public): Einzelner Teamkader
  - POST (protected): Neuen Squad anlegen
  - PUT (protected): Squad bearbeiten
  - DELETE (protected): Squad löschen

Endpunkte die mit “protected” gekennzeichnet sind, müssen im Request Header einen gültigen API-Key übermittelt bekommen.
Ansonsten muss ein entsprechenden 400-er Response erfolgen.

Der Einfachheit halber, reicht es wenn ein statisch erstellter Token übergeben wird. Eine sonstige Authentifizierung
bzw. Autorisierung ist nicht notwendig!

Endpunkte, die als “public” bezeichnet sind, benötigen keinen API-Key im Request Header.

Folgende Daten werden vom Verein zur Verfügung gestellt:

https://git.twofold.dev/rbach/squad-app-preparation

- CSV-Datei mit Spieler/-innen
- CSV-Datei mit Trainer/-innen

// === Umsetzung
// #if show-criteria [
//   - Erklären, wie du vorgegangen bist, um das Problem aus der Ausgangssituation zu lösen. Kurz beschreiben, welche
//     Schritte in der IPA gemacht wurde. Bsp: «Ich habe mich für ein Laravel-Projekt entschieden welches als REST-API
//     aufgebaut wird und …»
// ]
//
// === Ergebnis
// #if show-criteria [
//   - Erklären was das Endresultat ist. Bsp: «Ein Tool welches diese und diese Funktionailtät bietet und das und das
//     erleichtert»
// ]


// === Verstandene Aufgabenstellung und Ziel der Arbeit
// #if show-criteria [
//   - Was soll als Produkt dieser Arbeit entstehen? Bsp: «Ein Laravel API-Backend in welchem, …»
//   - Wie soll das Projekt umgesetzt werden? Welche Vorgaben gibt es? Muss eine Datenbank benutzt werden?
//     Programmiersprachen, …
// ]
//
// === Ausgangslage
// #if show-criteria [
//   - Gibt es schon vorbereitete Mockups oder Designs? Falls Ja, hier alle Screenshots rein und erklären, welche
//     Funktionalitäten pro Screenshot erkennbar sind und umgesetzt werden müssen
//   - Ist die Arbeit nur ein Teilprojekt? Falls ja, bestehende Projekt erklären und ggf. mit Screenshots zeigen/erklären
//     Falls noch nichts besteht kann dieser Punkt auch weggelassen werden
// ]
//
// === Abklärungen
// #if show-criteria [
//   - Was ist dir noch nicht klar aus der Aufgabenstellung/was musstest du beim VF nachfragen/Wo gibt es mehrere
//     Varianten? Hier auflisten, mit den Antworten des VF oder möglichen Varianten, für die du dich später entscheiden
//     kannst
// ]
//
// === Verfeinerung des Auftrages
// #if show-criteria [
//   - Welche Aufträge aus der Aufgabenstellung müssen zwar nicht mit dem VF abgeklärt werden/gibt es keine Varianten, aber
//     müssen vielleicht noch etwas genauer beschrieben werden?
//   - Dieser Punkt ist ev. nicht nötig, wenn alles unter «Abklärung» drin ist
// ]
//
// === Projektumfeld und Systemgrenzen
// #if show-criteria [
//   - Welche Datenbank-Version? Welche PHP-Version? Werden spezielle PHP-Extensions benötigt? Wird das Projekt mit
//     externen Diensten Verbunden? Was genau am Projekt machst du an der IPA und was gehört nicht dazu?
//   - Bewertungskriterium A5
// ]

== Planen

=== Verwendete Projektmanagementmethode

IPERKA
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

Repo: https://git.twofold.dev/sventoye/squad-app-backend-pipa

Wie ich Commits schreibe: https://cbea.ms/git-commit/

// === Priorisierung der Tätigkeiten
// #if show-criteria [
//   - Alle Tätigkeiten (mindestens die, die im Zeitplan sind) hier auflisten und priorisieren (Hoch, Mittel, Niedrig)
//   - Bewertunskriterium A8
// ]
// #table(
//   table.header(
//     [*Beschreibung der Tätigkeit*],
//     [*Priorität*],
//   ),
// )
//
// === Use-Case Diagramm / Aktivitätsdiagramm / Klassendiagramm / … Gesamtsystem
// #if show-criteria [
//   - Je nach Projekt sollte mindestens eines, besser aber mehrere dieser Diagramme eingefügt werden. Die Diagramme sollen
//     das gesamte System zeigen
//   - Es müssen nicht zwingend nur die oben genannten Diagramm-Arten sein. Falls dein Projekt besser mit einer eigenen
//     Diagramm-Art erklärt werden kann, ist das auch in Ordnung
//   - Hier jeweils zuerst den Titel, dann das Diagramm und danach eine Beschreibung, was im Diagramm ersichtlich ist und
//     ggf. zusätzliche Infos zum gesamten Aufbau des Projekts
//   - Bewertungskriterium A4
// ]

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

// === Use-Case Diagramm / Aktivitätsdiagramm / Klassendiagramm / … Funktion XYZ
// #if show-criteria [
//   - Hier müssen ggf. die einzelnen Funktionen/Teilsysteme mit spezifischeren Diagrammen erklärt werden. Bsp:
//     Login-System, Bild-Upload, …
//   - Hier jeweils zuerst den Titel, dann das Diagramm und danach eine Beschreibung, was im Diagramm ersichtlich ist.
//   - Ev. gibt es für die Teilsysteme keine geeigneten Diagramme, dann muss mit Text erklärt werden, wie die Funktion
//     umgesetzt wird
//   - Bewertungskriterium A4
// ]
//
// === Testkonzept
// #if show-criteria [
//   - Bewertungskriterium A6
// ]
//
// ==== Testmethode
// #if show-criteria [
//   - Wie wirst du deine Arbeit testen? Mit Postman/Insomnia? Von Hand? Welche Testart? Blackbox/Whitebox testing?
//   - Testmethode beschreiben und erklären. Was ist whitebox-Testing?
// ]
//
// ==== Testmittel
// #if show-criteria [
//   - Welche Soft- und Hardware in welchen Versionen hast du zum Testen verwendet?
//   - Beschreibe einer aussenstehenden Person, was sie alles machen muss, damit sie selbst dein Projekt auch testen könnte
//   - Braucht dein Projekt ein Login? Das ebenfalls zeigen/erklären
// ]
//
// ==== Abgrenzung
// #if show-criteria [
//   - Was am System testest du genau? Bis wo hin?
//   - Was testet du bewusst nicht?
// ]
//
// ==== Testfälle
// #if show-criteria [
//   - Testfälle müssen so genau definiert werden, dass eine aussenstehende Person diese auch durchführen könnte
//   - Auch Vorbedingungen müssen erklärt werden, wie man zu diesem Zustand kommt
//   - Nicht nur testen, was funktionieren soll (Positiv-Tests) sondern auch, was nicht funktionieren soll (Negativ-Tests)
// ]

// #let test-cases-headers = (
//   (
//     definition-columns: ([*Testfall*], [*Vorbedingung*], [*Vorgehen*], [*Eingaben*], [*Erwartetes Resultat*]),
//     execution-columns: ([*Effektives Ergebnis*], [*OK?*], [*Fazit*], [*Getestet von*], [*Getestet am*]),
//   )
// )
// #let test-cases = (
//   (
//     definition-columns: (
//       [User Ressource abfragen],
//       [User ist eingeloggt],
//       [GET-Request an /user],
//       [],
//       [HTTP-Status 200 und JSON-Objekt mit allen Daten des eingeloggten Nutzers],
//     ),
//     execution-columns: (
//       [
//         ```http
//         200 OK
//         {
//           "message": "User created"
//         }
//         ```
//       ],
//       [Nein],
//       [Die Validierung des Passworts funktioniert noch nicht. In der Validierungs-Funktion ist noch Fehler XYZ, der
//         behoben werden muss.],
//       [Sven Toye],
//       [28.11.2025],
//     ),
//   ),
// )
//
//
// #for cell in test-cases {
//   table(..test-cases-headers.definition-columns.zip(cell.definition-columns).flatten())
// }

// === Anmerkungen zum Zeitplan
// #if show-criteria [
//   - Gibt es etwas, dass du einer aussenstehenden Person zu deinem Zeitplan erklären müsstest, dass nicht schon klar
//     ersichtlich ist?
// ]

== Entscheiden
#if show-criteria [
  - Mindestens zwei Entscheidungen
  - pro Entscheidung eine allgemeine Beschreibung, zwei oder mehr Varianten und dann wofür du dich entschieden hast
  - Entscheidungskriterium B3
]

- TypeScript (backend)
- NestJS (web framework)
- TypeORM (ORM)
- Node (Javascript runtime)
- PNPM (package manager)
- MySQL (Datenbank)
- PHPMyAdmin (Datenbank Dashboard)
- Docker (Containerization)
- Typst (Dokumente + Grafiken + Zeitplan + Diagramme)
- VSCode (IDE)
- Lazygit (Git Terminal UI)


// === Beschreibung Entscheidung 1
// #if show-criteria [
//   - Kurz beschreiben, was du entscheiden musstest und wieso
//   - Bsp: welches Framework zu benutzen? Welche Programmiersprache? Wie ein Problem programmiert werden soll, …
// ]
//
// === Beschreibung Variante a / b / c / …
// #if show-criteria [
//   - Beschreibe die Vor- und Nachteile aller Varianten zur Entscheidung 1
// ]

// === Entscheidung 1
// #if show-criteria [
//   - Hier erläutern, für was du dich entschieden hast und wieso.
//   - Eine Entscheidungsmatrix kann hier helfen
// ]

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

// === Abbildung des Gesamtsystems
//
// === Grundaufbau / Architektur des Projektes
//
// === Vorgehensweise
//
// === Datenbank
// #if show-criteria [
//   - Wie sieht deine Datenbank nach der Realisierung aus? Hat sich etwas verändert ggü. Der Planungs-Phase?
//   - Hier kannst du auch das verbesserte ERD einfügen und erklären, was sich wieso geändert hat
// ]
//
// === Anbindung an die Datenbank
// #if show-criteria [
//   - Wie funktioniert die Anbindung/Kommunikation mit der Datenbank in deinem Projekt?
// ]
//
// === Routen
// #if show-criteria [
//   - Wie sehen deine Routen nach der Realisierung aus? Hat sich etwas verändert ggü. Der Planungs-Phase?
//   - Hier erklären, was sich wieso geändert hat
//   - Wie hast du das Routing gelöst? Code-Beispiele einfügen und erklären
// ]
//
// === Implementierung des Kernfeatures A / B / C / D / …
// #if show-criteria [
//   - Hier pro Funktionalität/Komponente deines Projektes ein Screenshot und/oder Code-Beispiel einfügen und erklären, wie
//     du es umgesetzt hast
//   - Pro Komponente zuerst einen passenden Titel, dann eine einleitende Erklärung zu dieser Komponente, danach ein
//     Screenshot und/oder Code-Beispiel mit Erklärung, was du genau wieso gemacht hast.
// ]
//
// === Vorbereitungen für den Upload / Live-Schaltung / Implementierung
// #if show-criteria [
//   - Ist das Live-Schalten Teil deiner Aufgabe?
//   - Egal ob ja oder nein, erkläre, wie die Live-Schaltung funktionieren würde
// ]

== Kontrollieren

// === Beschreibung der Randbedingungen / Testanlage (Umfeld)
// #if show-criteria [
//   - Welche Voraussetzungen braucht es alles, damit das Projekt getestet werden kann? Was muss installiert/vorbereitet
//     werden?
//   - Auf welchem Gerät mit welchen Versionen wird getestet? Browser-Version? Windows-Version? Gerät selbst?
//   - Alles so erklären, dass auch eine aussenstehende Person testen könnte
//   - Hier auch Screenshots mit Erklärungen einfügen
// ]
//
// === Testprotokoll
// #if show-criteria [
//   - Alle in der Planen-Phase definierten Testfälle werden jetzt hier durchgegangen
// ]

// #for cell in test-cases {
//   table(..test-cases-headers.values().flatten().zip(cell.values().flatten()).flatten())
// }

// === Bugfixing
// #if show-criteria [
//   - Welche Fehler mussten noch behoben werden? Weshalb sind diese Fehler passiert/übersehen worden? Konnten sie noch vor
//     Abgabe behoben werden oder wieso wurden sie nicht mehr behoben?
// ]

== Auswerten
#if show-criteria [
  - Kritisch beschreiben, was man gut fand und was man das nächste Mal besser machen würde
]

=== Reflexion der Vorgehensweise
#if show-criteria [
  - Bist du zufrieden, wie und in welcher Reihenfolge du deine Tasks gemacht hast?
]

Ich hatte Probleme, das Arbeitsjournal zu führen.

=== Bewertung des Produktes
#if show-criteria [
  - Wie passt dir das Endresultat? Bist du zufrieden? Wenn ja, wieso, wenn nein, wieso nicht?
]

Es entspricht die Aufgabenstellung.

=== Abweichungen zum Zeitplan
#if show-criteria [
  - Gab es gröbere Abweichungen von deinem Zeitplan? Kannst du dir erklären wieso? Was würdest du bei einem nächsten
    Projekt besser Planen?
]

Ich hatte nicht genug Zeit, das Arbeitsjournal zu führen.

=== Persönliches Schlusswort und Bilanz
#if show-criteria [
  - Zusammenfassend gesagt, wie bist du zufrieden, mit der Arbeit aber auch mit dir selbst? Würdest du etwas komplett
    anders machen? Was würdest du dir selbst in der Zukunft mitgeben, damit eine zukünftige Arbeit besser laufen würde?
]

Das Projekt selber lief gut, aber ich musste das Arbeitsjournal in letzter Minute fertig machen.

// == Glossar
//
// #let glossary-terms = (
//   A: (
//     ([A], [A Erklärung]),
//     ([Aa], [Aa Erklärung]),
//   ),
//   B: (
//     ([B], [B Erklärung]),
//   ),
// )
//
// #table(columns: (auto, auto, 1fr), ..glossary-terms
//     .pairs()
//     .map(((letter, terms)) => (
//       table.cell(emph(letter), rowspan: terms.len() + 1),
//       [*Begriff / Abkürzung*],
//       [*Erklärung*],
//       terms,
//     ))
//     .flatten())

== Quellenverzeichnis
#if show-criteria [
  - Hier gehören alle Links hin, die in der Arbeit bisher vorgekommen sind nochmals reinkopiert
]

- https://docs.nestjs.com/techniques/serialization
- https://typeorm.io/docs/relations/many-to-one-one-to-many-relations
- https://www.slingacademy.com/article/typescript-error-fix-the-types-have-no-overlap/
- https://typeorm.io/docs/entity/entities
- https://docs.docker.com/reference/compose-file/services
- https://docs.docker.com/compose/how-tos/networking/
- https://hub.docker.com/_/mysql/
- https://dev.mysql.com/doc/refman/8.4/en/built-in-function-reference.html
- https://docs.docker.com/get-started/docker-concepts/running-containers/publishing-ports/#use-docker-compose
- https://typeorm.io/docs/migrations/why/#generating-migrations
- https://typeorm.io/docs/relations/relations/#cascades
- https://dev.to/mgohin/typeorm-remove-children-with-orphanedrowaction-4m7b
- https://typeorm.io/docs/relations/many-to-one-one-to-many-relations
- https://docs.nestjs.com/techniques/database#database
- https://typeorm.io/docs/entity/entities
- https://typeorm.io/docs/relations/relations/#cascades
- https://typeorm.io/docs/relations/many-to-one-one-to-many-relations
- https://docs.nestjs.com/interceptors#binding-interceptors
- https://docs.nestjs.com/security/authentication
- https://docs.nestjs.com/interceptors
- https://docs.nestjs.com/openapi/types-and-parameters
- https://docs.nestjs.com/openapi/cli-plugin
- https://docs.nestjs.com/openapi/operations
- https://docs.nestjs.com/openapi/types-and-parameters
- https://docs.nestjs.com/openapi/introduction#setup-options
- https://typeorm.io/docs/relations/many-to-many-relations#many-to-many-relations-with-custom-properties
- https://docs.nestjs.com/fundamentals/testing
- https://stackoverflow.com/questions/60652617/how-to-mock-repository-service-and-controller-in-nestjs-typeorm-jest
- https://stackoverflow.com/questions/55366037/inject-typeorm-repository-into-nestjs-service-for-mock-data-testing?rq=3
- https://docs.nestjs.com/fundamentals/testing
- https://stackoverflow.com/questions/60652617/how-to-mock-repository-service-and-controller-in-nestjs-typeorm-jest
- https://docs.nestjs.com/fundamentals/testing
- https://miro.com/app/board/uXjVJupqp9M=/?sharelinkid=685326180791
- https://git.twofold.dev/rbach/squad-app-preparation
- https://git.twofold.dev/sventoye/squad-app-backend-pipa
- https://cbea.ms/git-commit/

= Anhang

== Git-Commit-History
#image("git-commits.png")

// == Projektjournal
// #if show-criteria [
//   - Falls während der IPA ein längeres Gespräch mit dem VF stattfindet, muss dieses Protokolliert und hier
//     aufgeschrieben werden
//   - Gesprächsprotokoll vom xx. Monat yyyy
// ]
//
// #let show-meeting(participants: (), date: [], place: [], notes: (), decisions: []) = table(
//   table.cell([Teilnehmer], rowspan: participants.len()), ..participants,
//   [Datum, Zeit], date,
//   [Ort], place,
//   table.cell([Besprechungsnotizen], rowspan: notes.len()), ..notes,
//   table.cell([Getroffene Entscheidungen], rowspan: decisions.len()), ..decisions,
// )
//
// #show-meeting(
//   participants: ([Sven Toye], [Name Vorname]),
//   date: [28.12.2025],
//   place: [Zürich],
//   notes: ([],),
//   decisions: ([],),
// )

// == Erster Expertenbesuch
//
// #show-meeting(
//   participants: ([Sven Toye], [Name Vorname]),
//   date: [28.12.2025],
//   place: [Zürich],
//   notes: ([],),
//   decisions: ([],),
// )
//
// == Zweiter Expertenbesuch
//
// #show-meeting(
//   participants: ([Sven Toye], [Name Vorname]),
//   date: [28.12.2025],
//   place: [Zürich],
//   notes: ([],),
//   decisions: ([],),
// )

// == Code
// #if show-criteria [
//   Der Code kann entweder hier schön formatiert, mit Zeilennummern und Syntax-Highlighting reinkopiert werden oder
//   separat al ZIP auf pkOrg hochgeladen werden. Auch wenn der Code hochgeladen wird, sollte hier ein Vermerk dazu stehen
// ]
//
// === `main.rs`
// ```rs
// fn main() {
//   println!("Hello, world");
// }
// ```
//
// === `main.rs`
// ```rs
// fn main() {
//   println!("Hello, world");
// }
// ```
//
// == Zusätzliche Manuals, Skripts und weiteres
// #if show-criteria [
//   - Gibt es sonstigen Code der Abgegeben werden muss? Testfälle aus Postman? Swagger Datei?
//   - War es Teil der IPA, dass ein Manual geschrieben wird? Dann ganzes Manual hier reinkopieren
// ]
//
// === Handbuch A
// ```rs
// fn main() {
//   println!("Hello, world");
// }
// ```
//
// === Skript B
// ```rs
// fn main() {
//   println!("Hello, world");
// }
// ```

