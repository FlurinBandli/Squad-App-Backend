import { ApiProperty } from "@nestjs/swagger";

export class JwtDto {
  @ApiProperty({ description: "JSON Web Token" })
  accessToken: string;
  constructor(accessToken: string) {
    this.accessToken = accessToken;
  }
}
