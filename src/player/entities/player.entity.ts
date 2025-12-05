import { SquadPlayer } from "src/squad-player/entities/squad-player.entity";
import { Gender } from "src/types";
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Player {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 255 })
  firstName: string;

  @Column({ length: 255 })
  lastName: string;

  @Column({ type: "enum", enum: Gender })
  gender: Gender;

  @OneToMany(() => SquadPlayer, (squadPlayer) => squadPlayer.player, {
    cascade: true,
  })
  squadPlayers: SquadPlayer[];
}
