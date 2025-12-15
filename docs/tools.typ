

#let show-date-weekday(date) = {
  let weekday = date.weekday()
  if weekday == 1 { "Montag" } else if (
    weekday == 2
  ) { "Dienstag" } else if (
    weekday == 3
  ) { "Mittwoch" } else if (
    weekday == 4
  ) { "Donnerstag" } else if (
    weekday == 5
  ) { "Freitag" } else if (
    weekday == 6
  ) { "Samstag" } else { "Sonntag" }
}
#let show-date-weekday-mini(date) = {
  show-date-weekday(date).slice(0, 2)
}
#let show-date-mini(date) = {
  date.display("[day].[month]")
}

#let show-date-long(year, month, day) = {
  let date = datetime(year: year, month: month, day: day)
  let show-weekday = show-date-weekday(date)
  [#show-weekday, #date.display("[day].[month].[year]")]
}
