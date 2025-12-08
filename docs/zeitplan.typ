#let show-date-mini(year, month, day) = {
  let date = datetime(year: year, month: month, day: day)
  date.display("[day].[month]")
}

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
            ("b", 16, 1),
            ("s", 17, 1),
            ("b", 18, 1),
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
          [Planen + ERD erstellen],
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
        ([Authentifizierung], (("b", 15, 1), ("i", 17, 1), ("s", 18, 1))),
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

  == Zeitplan

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
