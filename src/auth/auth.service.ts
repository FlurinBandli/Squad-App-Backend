import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { JwtService } from "@nestjs/jwt";

@Injectable()
export class AuthService {
  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {}

  validateUser(
    username: string,
    password: string,
  ): { username: string } | null {
    if (
      this.configService.get("jwt.username") === username &&
      this.configService.get("jwt.password") === password
    ) {
      return { username };
    }
    return null;
  }

  login(user: { username: string }): string {
    return this.jwtService.sign(user);
  }
}
