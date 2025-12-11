import { ApiProperty } from "@nestjs/swagger";
import { IsEnum, IsNotEmpty, IsString } from "class-validator";
import { Gender } from "../../../src/types";

export class CreateTrainerDto {
  @ApiProperty({ description: "Vorname", example: "Sven" })
  @IsString()
  @IsNotEmpty()
  firstName: string;

  @ApiProperty({ description: "Nachname", example: "Toye" })
  @IsString()
  @IsNotEmpty()
  lastName: string;

  @ApiProperty({ description: "Geschlecht" })
  @IsEnum(Gender)
  gender: Gender;
}
