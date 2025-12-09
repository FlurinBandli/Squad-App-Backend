import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseInterceptors,
  ClassSerializerInterceptor,
  UseGuards,
} from "@nestjs/common";
import { SquadService } from "./squad.service";
import { CreateSquadDto } from "./dto/create-squad.dto";
import { UpdateSquadDto } from "./dto/update-squad.dto";
import { Squad } from "./entities/squad.entity";
import { JwtGuard } from "src/auth/jwt.guard";
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiOperation,
  ApiUnauthorizedResponse,
} from "@nestjs/swagger";

@Controller("/squad")
@UseInterceptors(ClassSerializerInterceptor)
export class SquadController {
  constructor(private readonly squadService: SquadService) {}

  @ApiOperation({ summary: "Erstelle einen Squad" })
  @ApiCreatedResponse({ type: Squad, description: "Squad erstellt" })
  @ApiUnauthorizedResponse()
  @ApiBearerAuth()
  @UseGuards(JwtGuard)
  @Post()
  create(@Body() createSquadDto: CreateSquadDto): Promise<Squad> {
    return this.squadService.create(createSquadDto);
  }

  @ApiOperation({ summary: "Lese alle Squad aus" })
  @ApiOkResponse({ type: [Squad], description: "Alle Squads ausgelesen" })
  @ApiUnauthorizedResponse()
  @ApiBearerAuth()
  @UseGuards(JwtGuard)
  @Get()
  findAll(): Promise<Squad[]> {
    return this.squadService.findAll();
  }

  @ApiOperation({ summary: "Lese einen Squad aus" })
  @ApiOkResponse({ type: Squad, description: "Squad ausgelesen" })
  @ApiNotFoundResponse({ description: "Squad existiert nicht" })
  @Get(":id")
  findOne(@Param("id") id: number): Promise<Squad | null> {
    return this.squadService.findOne(id);
  }

  @ApiOperation({ summary: "Bearbeite einen Squad" })
  @ApiOkResponse({ type: Squad, description: "Squad bearbeitet" })
  @ApiNotFoundResponse({ description: "Squad existiert nicht" })
  @ApiUnauthorizedResponse()
  @ApiBearerAuth()
  @UseGuards(JwtGuard)
  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updateSquadDto: UpdateSquadDto,
  ): Promise<Squad | null> {
    return this.squadService.update(id, updateSquadDto);
  }

  @ApiOperation({ summary: "Lösche einen Squad" })
  @ApiOkResponse({ description: "Squad gelöscht" })
  @ApiNotFoundResponse({ description: "Squad existiert nicht" })
  @ApiUnauthorizedResponse()
  @ApiBearerAuth()
  @UseGuards(JwtGuard)
  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.squadService.remove(id);
  }
}
