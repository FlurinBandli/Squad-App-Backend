import { ApiProperty } from "@nestjs/swagger";
import { IsEnum, IsString } from "class-validator";
import { Gender } from "src/types";

export class CreateTrainerDto {
  @ApiProperty({ description: "Vorname", example: "Sven" })
  @IsString()
  firstName: string;

  @ApiProperty({ description: "Nachname", example: "Toye" })
  @IsString()
  lastName: string;

  @ApiProperty({ description: "Geschlecht" })
  @IsEnum(Gender)
  gender: Gender;
}
