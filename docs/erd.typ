#import "@preview/fletcher:0.5.8": diagram, edge, node, shapes.rect

#set page(height: auto, width: auto)
#set grid(stroke: 1pt, inset: .5em, columns: 2)
#show grid: set text(font: "Cascadia Code")

#diagram(
  node-inset: 0pt,
  spacing: 4em,
  node-shape: rect,
  node-defocus: 1,
  node((0, 1), name: <player>)[
    #grid(
      grid.cell(colspan: 2)[Player]
    )[ID][int][firstName][varchar][lastName][varchar][gender][enum(male,female,other)]
  ],
  edge(<squad-player>, <player>, "-|>", label: [has], label-side: center),
  node((0, 0), name: <squad-player>)[
    #grid(grid.cell(colspan: 2)[SquadPlayer])[ID][int][squadId][int][playerId][int][position][
      enum(goalkeeper, \
      defender, \
      midfielder, \
      striker, \
      backup)
    ]
  ],
  edge(<squad-player>, <squad>, "-|>", label: [has], label-side: center),
  edge(<player>, <squad>, "<|--|>", label: [trains with], label-side: center),

  node((1, 0), name: <squad>)[
    #grid(grid.cell(colspan: 2)[Squad])[ID][int][trainerId][int][name][varchar][description][varchar][date][date]
  ],

  edge(<squad-trainer>, <squad>, "-|>", label: [has], label-side: center),
  edge(<squad>, <trainer>, "<|--|>", label: [trained by], label-side: center),
  node((2, 0), name: <squad-trainer>)[
    #grid(
      stroke: (dash: "dashed"),
      grid.cell(colspan: 2)[_SquadTrainer_],
    )[ID][int][squadId][int][trainerId][int]
  ],
  edge(<squad-trainer>, <trainer>, "-|>", label: [has], label-side: center),
  node((2, 1), name: <trainer>)[
    #grid(
      grid.cell(colspan: 2)[Trainer]
    )[ID][int][firstName][varchar][lastName][varchar][gender][enum(male,female,other)]
  ],
)
