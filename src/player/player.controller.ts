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
} from "@nestjs/common";
import { PlayerService } from "./player.service";
import { CreatePlayerDto } from "./dto/create-player.dto";
import { UpdatePlayerDto } from "./dto/update-player.dto";
import { Player } from "./entities/player.entity";
import { JwtGuard } from "src/auth/jwt.guard";
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
@Controller("player")
export class PlayerController {
  constructor(private readonly playerService: PlayerService) {}

  @ApiOperation({ summary: "Erstelle einen Spieler" })
  @ApiCreatedResponse({ type: Player })
  @Post()
  create(@Body() createPlayerDto: CreatePlayerDto): Promise<Player> {
    return this.playerService.create(createPlayerDto);
  }

  @ApiOkResponse({ type: [Player] })
  @Get()
  findAll(): Promise<Player[]> {
    return this.playerService.findAll();
  }

  @ApiOkResponse({ type: Player })
  @ApiNotFoundResponse()
  @Get(":id")
  findOne(@Param("id") id: number): Promise<Player | null> {
    return this.playerService.findOne(id);
  }

  @ApiOkResponse({ type: Player })
  @ApiNotFoundResponse()
  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updatePlayerDto: UpdatePlayerDto,
  ): Promise<Player | null> {
    return this.playerService.update(id, updatePlayerDto);
  }

  @ApiOkResponse()
  @ApiNotFoundResponse()
  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.playerService.remove(id);
  }
}
