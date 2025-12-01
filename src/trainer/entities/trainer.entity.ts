import { Squad } from "src/squad/entities/squad.entity";
import { Gender } from "src/types";
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Trainer {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 255 })
  firstName: string;

  @Column({ length: 255 })
  lastName: string;

  @Column({ type: "enum", enum: Gender })
  gender: Gender;

  @OneToMany(() => Squad, (squad) => squad.trainer)
  squads: Squad[];
}
