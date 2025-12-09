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
import { ApiProperty } from "@nestjs/swagger";

@Entity()
export class Squad {
  static new(squad: Squad & CreateSquadDto): Squad {
    const self = new Squad();
    Object.assign(self, squad);
    return self;
  }

  @ApiProperty({ description: "ID", example: 1 })
  @PrimaryGeneratedColumn()
  id: number;

  @ApiProperty({ description: "Trainer für diesen Squad" })
  @ManyToOne(() => Trainer, {
    eager: true,
    nullable: false,
  })
  trainer: Trainer;

  @ApiProperty({ description: "Name", example: "FC Zürich" })
  @Column({ length: 255 })
  name: string;

  @ApiProperty({ description: "Beschreibung", example: "Seit 1896." })
  @Column({ length: 255 })
  description: string;

  @ApiProperty({ description: "Erstellungsdatum" })
  @Column()
  date: Date;

  @ApiProperty({ description: "Spieler mit ihren Positionen in diesem Team" })
  @OneToMany(() => SquadPlayer, (squadPlayer) => squadPlayer.squad, {
    eager: true,
    cascade: true,
  })
  @IsInstance(SquadPlayer, { each: true })
  @ValidateNested()
  @Type(() => SquadPlayer)
  squadPlayers: SquadPlayer[];
}
