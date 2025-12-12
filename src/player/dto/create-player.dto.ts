import { ApiProperty } from "@nestjs/swagger";
import { IsEnum, IsNotEmpty, IsString } from "class-validator";
import { Gender } from "../../../src/types";
import { SerializeOptions } from "@nestjs/common";

@SerializeOptions({ excludeExtraneousValues: true })
export class CreatePlayerDto {
  @ApiProperty({ description: "Vorname", example: "Sven" })
  @IsString()
  @IsNotEmpty()
  firstName: string;

  @ApiProperty({ description: "Nachname", example: "Toye" })
  @IsNotEmpty()
  @IsString()
  lastName: string;

  @ApiProperty({ description: "Geschlecht" })
  @IsEnum(Gender)
  gender: Gender;
}
