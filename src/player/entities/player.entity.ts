import { ApiProperty } from "@nestjs/swagger";
import { Gender } from "../../../src/types";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Player {
  @ApiProperty({ description: "ID", example: 1 })
  @PrimaryGeneratedColumn()
  id: number;

  @ApiProperty({ description: "Vorname", example: "Sven" })
  @Column({ length: 255 })
  firstName: string;

  @ApiProperty({ description: "Nachname", example: "Toye" })
  @Column({ length: 255 })
  lastName: string;

  @ApiProperty({ description: "Geschlecht" })
  @Column()
  gender: Gender;
}
