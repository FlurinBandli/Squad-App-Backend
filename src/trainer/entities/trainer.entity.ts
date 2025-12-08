import { Gender } from "src/types";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Trainer {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 255 })
  firstName: string;

  @Column({ length: 255 })
  lastName: string;

  @Column()
  gender: Gender;
}
