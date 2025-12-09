import { ApiHideProperty, ApiProperty } from "@nestjs/swagger";
import { Exclude } from "class-transformer";
import { Player } from "src/player/entities/player.entity";
import { Squad } from "src/squad/entities/squad.entity";
import { Position } from "src/types";
import {
  Column,
  type DeepPartial,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";

@Entity()
export class SquadPlayer {
  static new(o: DeepPartial<SquadPlayer>): DeepPartial<SquadPlayer> {
    const self = new SquadPlayer();
    Object.assign(self, o);
    return self;
  }

  @ApiProperty({ description: "ID", example: 1 })
  @PrimaryGeneratedColumn()
  id: number;

  @ApiProperty({ description: "Spieler" })
  @ManyToOne(() => Player, {
    eager: true,
    nullable: false,
    orphanedRowAction: "delete",
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  player: Player;

  @ApiHideProperty()
  @Exclude()
  @ManyToOne(() => Squad, (squad) => squad.squadPlayers, {
    nullable: false,
    orphanedRowAction: "delete",
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  squad: Squad;

  @ApiProperty({ description: "Position vom Spieler" })
  @Column()
  position: Position;
}
