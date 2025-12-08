import { Type } from "class-transformer";
import { IsInstance, ValidateNested } from "class-validator";
import { SquadPlayer } from "../../squad-player/entities/squad-player.entity";
import { Trainer } from "../../trainer/entities/trainer.entity";
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { CreateSquadDto } from "../dto/create-squad.dto";

@Entity()
export class Squad {
  static new(squad: Squad & CreateSquadDto): Squad {
    const self = new Squad();
    Object.assign(self, squad);
    return self;
  }

  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => Trainer, {
    eager: true,
    nullable: false,
  })
  trainer: Trainer;

  @Column({ length: 255 })
  name: string;

  @Column({ length: 255 })
  description: string;

  @Column()
  date: Date;

  @OneToMany(() => SquadPlayer, (squadPlayer) => squadPlayer.squad, {
    eager: true,
    cascade: true,
  })
  @IsInstance(SquadPlayer, { each: true })
  @ValidateNested()
  @Type(() => SquadPlayer)
  squadPlayers: SquadPlayer[];
}
