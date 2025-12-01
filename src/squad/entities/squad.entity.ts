import { SquadPlayer } from "src/squad-player/entities/squad-player.entity";
import { Trainer } from "src/trainer/entities/trainer.entity";
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";

@Entity()
export class Squad {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => Trainer, (trainer) => trainer.squads)
  trainer: Trainer;

  @Column({ length: 255 })
  name: string;

  @Column({ length: 255 })
  description: string;

  @Column()
  date: Date;

  @OneToMany(() => SquadPlayer, (squadPlayer) => squadPlayer.squad)
  squadPlayers: SquadPlayer[];
}
