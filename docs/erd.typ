#import "@preview/fletcher:0.5.8": diagram, edge, node, shapes.rect

// #set page(margin: 2em, height: auto, width: auto)
#set grid(stroke: 1pt, inset: .5em, columns: 2)

#diagram(
  node-inset: 0pt,
  node-shape: rect,
  node((0, 0), name: <squad-player>)[
    #grid(grid.cell(colspan: 2)[SquadPlayer])[ID][int][squadId][int][playerId][int][position][
      enum(goalkeeper, \
      defender, \
      midfielder, \
      striker, \
      backup)
    ]
  ],
  node((1, 0), name: <squad>)[
    #grid(grid.cell(colspan: 2)[Squad])[ID][int][trainerId][int][name][varchar][description][varchar][date][date]
  ],
  node((0, 1), name: <player>)[
    #grid(
      grid.cell(colspan: 2)[Player]
    )[ID][int][firstName][varchar][lastName][varchar][gender][enum(male,female,other)]
  ],
  node((1, 1), name: <trainer>)[
    #grid(
      grid.cell(colspan: 2)[Trainer]
    )[ID][int][firstName][varchar][lastName][varchar][gender][enum(male,female,other)]
  ],
  edge(<squad-player>, <player>, "-|>", label: [has], label-side: center),
  edge(<squad-player>, <squad>, "-|>", label: [has], label-side: center),
  edge(<squad>, <trainer>, "-|>", label: [trained by], label-side: center),
  edge(<player>, <squad>, "<|..|>", label: [train], label-side: center),
)
