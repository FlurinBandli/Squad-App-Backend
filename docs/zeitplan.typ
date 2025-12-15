#import "tools.typ": show-date-mini, show-date-weekday-mini

#set page(paper: "a3", flipped: true)
#set text(font: "Arial")

#let hours-in-unit = 2
#let timeplan-data-dates = (
  // week 1
  ((2025, 12, 1), 8),
  ((2025, 12, 2), 4),
  ((2025, 12, 3), 8),
  ((2025, 12, 4), 8),
  ((2025, 12, 5), 8),
  // week 2
  ((2025, 12, 8), 8),
  ((2025, 12, 9), 4),
  ((2025, 12, 10), 8),
  ((2025, 12, 11), 8),
  ((2025, 12, 12), 8),
  // week 3
  ((2025, 12, 15), 8),
).map((((year, month, day), len)) => (datetime(year: year, month: month, day: day), int(len / hours-in-unit)))

#let len = timeplan-data-dates.map(((_, len)) => len).reduce((acc, len) => acc + len)
#let timeplan-data-lens = range(len).map(len => [#{ (len + 1) * hours-in-unit }])

#let timeplan-data = toml("zeitplan.toml")

#let timeplan-data = (
  timeplan-data
    .pairs()
    .map(((title, rows)) => {
      let rows = rows
        .pairs()
        .map(((title, columns)) => {
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
)
#let ist-zeit = (
  timeplan-data.map(((_, rows)) => rows.map(((ist-zeit,)) => ist-zeit)).flatten().reduce((a, b) => a + b)
)
#let soll-zeit = (
  timeplan-data.map(((_, rows)) => rows.map(((soll-zeit,)) => soll-zeit)).flatten().reduce((a, b) => a + b)
)
#let ist-zeit-color = red
#let soll-zeit-color = blue
#let both-color = green
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
      table.cell(colspan: len)[
        #show-date-mini(date) \
        #show-date-weekday-mini(date)
      ],
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
  [*Total*], [*#soll-zeit*], [*#ist-zeit*], table.cell(colspan: 40)[],

  table.hline(),
  table.vline(),
)
