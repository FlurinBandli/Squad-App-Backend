import { Player } from "src/player/entities/player.entity";
import { Squad } from "src/squad/entities/squad.entity";
import { Position } from "src/types";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class SquadPlayer {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => Player)
  player: Player;

  @ManyToOne(() => Squad, (squad) => squad.squadPlayers)
  squad: Squad;

  @Column({ type: "enum", enum: Position })
  position: Position;
}
