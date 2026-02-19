#import "@preview/fletcher:0.5.8": diagram, edge, node, shapes.rect

#let erd = {
  set grid(stroke: 1pt, inset: .5em, columns: 2)
  set text(font: "FreeSans")
  show grid: set text(font: "Cascadia Code")

  let edge2((start, label-start), (end, label-end), arrow) = {
    let label-pos = 1em
    edge(start, end, arrow, label: label-start, label-pos: label-pos, label-side: left)
    edge(start, end, arrow, label: label-end, label-pos: 100% - label-pos, label-side: left)
  }

  diagram(
    node-inset: 0pt,
    spacing: 4em,
    node-shape: rect,
    node-defocus: 1,

    node((0, 1), name: <player>)[
      #grid(
        grid.cell(colspan: 2)[Player]
      )[ID][int][firstName][varchar][lastName][varchar][gender][enum(male,female,other)]
    ],

    edge2((<squad-player>, [mc]), (<player>, [1]), "-|>"),
    node((0, 0), name: <squad-player>, grid(
      grid.cell(colspan: 2)[SquadPlayer],
      [ID], [int],
      [squadId], [int],
      [playerId], [int],
      [position],
      [enum(goalkeeper, \
        defender, \
        midfielder, \
        striker, \
        backup)],
    )),
    edge2((<squad-player>, [mc]), (<squad>, [1]), "-|>"),

    edge2((<player>, [mc]), (<squad>, [mc]), "<|--|>"),
    node((1, 0), name: <squad>, grid(
      grid.cell(colspan: 2)[Squad],
      [ID], [int], [name], [varchar], [description], [varchar], [date], [date],
    )),
    edge2((<squad>, [mc]), (<trainer>, [mc]), "<|--|>"),

    edge2((<squad-trainer>, [mc]), (<squad>, [1]), "-|>"),
    node((2, 0), name: <squad-trainer>, grid(
      stroke: (dash: "dashed"),
      grid.cell(colspan: 2)[_SquadTrainer_],
      [ID], [int], [squadId], [int], [trainerId], [int],
    )),
    edge2((<squad-trainer>, [mc]), (<trainer>, [1]), "-|>"),

    node((2, 1), name: <trainer>, grid(
      grid.cell(colspan: 2)[Trainer],
      [ID], [int], [firstName], [varchar], [lastName], [varchar], [gender], [enum(male,female,other)],
    )),
  )
  //   diagram(
  //     node-inset: 0pt,
  //     spacing: 4em,
  //     node-shape: rect,
  //     node-defocus: 1,
  //     node((0, 1), name: <player>)[
  //       #grid(
  //         grid.cell(colspan: 2)[Player]
  //       )[ID][int][firstName][varchar][lastName][varchar][gender][enum(male,female,other)]
  //     ],
  //     edge(<squad-player>, <player>, "-|>", label: [has], label-side: center, marks: ()),
  //     node((0, 0), name: <squad-player>)[
  //       #grid(grid.cell(colspan: 2)[SquadPlayer])[ID][int][squadId][int][playerId][int][position][
  //         enum(goalkeeper, \
  //         defender, \
  //         midfielder, \
  //         striker, \
  //         backup)
  //       ]
  //     ],
  //     edge(<squad-player>, <squad>, "-|>", label: [has], label-side: center),
  //     edge(<player>, <squad>, "<|--|>", label: [trains with], label-side: center),
  //
  //     node((1, 0), name: <squad>)[
  //       #grid(grid.cell(colspan: 2)[Squad])[ID][int][trainerId][int][name][varchar][description][varchar][date][date]
  //     ],
  //
  //     edge(<squad-trainer>, <squad>, "-|>", label: [has], label-side: center),
  //     edge(<squad>, <trainer>, "<|--|>", label: [trained by], label-side: center),
  //     node((2, 0), name: <squad-trainer>)[
  //       #grid(
  //         stroke: (dash: "dashed"),
  //         grid.cell(colspan: 2)[_SquadTrainer_],
  //       )[ID][int][squadId][int][trainerId][int]
  //     ],
  //     edge(<squad-trainer>, <trainer>, "-|>", label: [has], label-side: center),
  //     node((2, 1), name: <trainer>)[
  //       #grid(
  //         grid.cell(colspan: 2)[Trainer]
  //       )[ID][int][firstName][varchar][lastName][varchar][gender][enum(male,female,other)]
  //     ],
  //   )
}
#set page(height: auto, width: auto)
#erd
