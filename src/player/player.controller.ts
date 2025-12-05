import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
} from "@nestjs/common";
import { PlayerService } from "./player.service";
import { CreatePlayerDto } from "./dto/create-player.dto";
import { UpdatePlayerDto } from "./dto/update-player.dto";
import { Player } from "./entities/player.entity";
import { JwtGuard } from "src/auth/jwt.guard";

@Controller("player")
export class PlayerController {
  constructor(private readonly playerService: PlayerService) {}

  @UseGuards(JwtGuard)
  @Post()
  create(@Body() createPlayerDto: CreatePlayerDto): Promise<Player> {
    return this.playerService.create(createPlayerDto);
  }

  @UseGuards(JwtGuard)
  @Get()
  findAll(): Promise<Player[]> {
    return this.playerService.findAll();
  }

  @UseGuards(JwtGuard)
  @Get(":id")
  findOne(@Param("id") id: number): Promise<Player | null> {
    return this.playerService.findOne(id);
  }

  @UseGuards(JwtGuard)
  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updatePlayerDto: UpdatePlayerDto,
  ): Promise<Player | null> {
    return this.playerService.update(id, updatePlayerDto);
  }

  @UseGuards(JwtGuard)
  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.playerService.remove(id);
  }
}
