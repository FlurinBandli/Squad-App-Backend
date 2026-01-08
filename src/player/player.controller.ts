import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  UseInterceptors,
  ClassSerializerInterceptor,
  NotFoundException,
} from "@nestjs/common";
import { PlayerService } from "./player.service";
import { CreatePlayerDto } from "./dto/create-player.dto";
import { UpdatePlayerDto } from "./dto/update-player.dto";
import { Player } from "./entities/player.entity";
import { JwtGuard } from "..//auth/jwt.guard";
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiUnauthorizedResponse,
} from "@nestjs/swagger";

@ApiUnauthorizedResponse()
@ApiBearerAuth()
@UseGuards(JwtGuard)
@UseInterceptors(ClassSerializerInterceptor)
@Controller("/player")
export class PlayerController {
  constructor(private readonly playerService: PlayerService) {}

  @ApiOperation({ summary: "Erstelle einen Spieler" })
  @ApiCreatedResponse({ type: Player, description: "Spieler erstellt" })
  @Post()
  create(@Body() createPlayerDto: CreatePlayerDto): Promise<Player> {
    return this.playerService.create(createPlayerDto);
  }

  @ApiOperation({ summary: "Lese alle Spieler aus" })
  @ApiOkResponse({ type: [Player], description: "Alle Spieler ausgelesen" })
  @Get()
  findAll(): Promise<Player[]> {
    return this.playerService.findAll();
  }

  @ApiOperation({ summary: "Lese einen Spieler aus" })
  @ApiOkResponse({ type: Player, description: "Spieler ausgelesen" })
  @ApiNotFoundResponse({ description: "Spieler existiert nicht" })
  @Get(":id")
  async findOne(@Param("id") id: number): Promise<Player> {
    const player = await this.playerService.findOne(id);
    if (!player) throw new NotFoundException();
    return player;
  }

  @ApiOperation({ summary: "Bearbeite einen Spieler" })
  @ApiOkResponse({ type: Player, description: "Spieler bearbeitet" })
  @ApiNotFoundResponse({ description: "Spieler existiert nicht" })
  @Patch(":id")
  async update(
    @Param("id") id: number,
    @Body() updatePlayerDto: UpdatePlayerDto,
  ): Promise<Player> {
    const player = await this.playerService.update(id, updatePlayerDto);
    if (!player) throw new NotFoundException();
    return player;
  }

  @ApiOperation({ summary: "Lösche einen Spieler" })
  @ApiOkResponse({ description: "Spieler gelöscht" })
  @ApiNotFoundResponse({ description: "Spieler existiert nicht" })
  @Delete(":id")
  async remove(@Param("id") id: number): Promise<void> {
    const exists = await this.playerService.remove(id);
    if (!exists) throw new NotFoundException();
  }
}
