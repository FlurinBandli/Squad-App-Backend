import { ApiProperty } from "@nestjs/swagger";
import { IsString } from "class-validator";

export class LoginDto {
  @ApiProperty({ description: "Benutzername", example: "username" })
  @IsString()
  username: string;

  @ApiProperty({ description: "Passwort", example: "password" })
  @IsString()
  password: string;
}
