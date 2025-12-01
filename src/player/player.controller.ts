import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from "@nestjs/common";
import { PlayerService } from "./player.service";
import { CreatePlayerDto } from "./dto/create-player.dto";
import { UpdatePlayerDto } from "./dto/update-player.dto";
import { Player } from "./entities/player.entity";

@Controller("player")
export class PlayerController {
  constructor(private readonly playerService: PlayerService) {}

  @Post()
  create(@Body() createPlayerDto: CreatePlayerDto): Promise<Player> {
    return this.playerService.create(createPlayerDto);
  }

  @Get()
  findAll(): Promise<Player[]> {
    return this.playerService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: number): Promise<Player | null> {
    return this.playerService.findOne(id);
  }

  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updatePlayerDto: UpdatePlayerDto,
  ): Promise<Player | null> {
    return this.playerService.update(id, updatePlayerDto);
  }

  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.playerService.remove(id);
  }
}
