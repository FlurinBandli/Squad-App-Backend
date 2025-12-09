import { Controller, Post, Body, UnauthorizedException } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { LoginDto } from "./login.dto";
import { JwtDto } from "./jwt.dto";
import { ApiCreatedResponse, ApiUnauthorizedResponse } from "@nestjs/swagger";

@Controller("/auth")
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @ApiCreatedResponse({ type: JwtDto, description: "Login erfolgreich" })
  @ApiUnauthorizedResponse({ description: "Nicht berechtigt" })
  @Post("/login")
  login(@Body() body: LoginDto): JwtDto {
    const user = this.authService.validateUser(body.username, body.password);
    if (!user) {
      throw new UnauthorizedException("Invalid credentials");
    }
    return new JwtDto(this.authService.login(user));
  }
}
