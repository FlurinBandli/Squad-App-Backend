import { Controller, Post, Body, UnauthorizedException } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { LoginDto } from "./login.dto";
import { JwtDto } from "./jwt.dto";
import { ApiOkResponse, ApiUnauthorizedResponse } from "@nestjs/swagger";

@Controller("auth")
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @ApiUnauthorizedResponse()
  @ApiOkResponse({ type: JwtDto })
  @Post("login")
  login(@Body() body: LoginDto): JwtDto {
    const user = this.authService.validateUser(body.username, body.password);
    if (!user) {
      throw new UnauthorizedException("Invalid credentials");
    }
    return new JwtDto(this.authService.login(user));
  }
}
