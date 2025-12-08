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
  ApiUnauthorizedResponse,
} from "@nestjs/swagger";

@Controller("squad")
@UseInterceptors(ClassSerializerInterceptor)
export class SquadController {
  constructor(private readonly squadService: SquadService) {}

  @ApiCreatedResponse({ type: Squad })
  @ApiUnauthorizedResponse()
  @ApiBearerAuth()
  @UseGuards(JwtGuard)
  @Post()
  create(@Body() createSquadDto: CreateSquadDto): Promise<Squad> {
    return this.squadService.create(createSquadDto);
  }

  @ApiOkResponse({ type: [Squad] })
  @ApiUnauthorizedResponse()
  @ApiBearerAuth()
  @UseGuards(JwtGuard)
  @Get()
  findAll(): Promise<Squad[]> {
    return this.squadService.findAll();
  }

  @ApiOkResponse({ type: Squad })
  @ApiNotFoundResponse()
  @Get(":id")
  findOne(@Param("id") id: number): Promise<Squad | null> {
    return this.squadService.findOne(id);
  }

  @ApiOkResponse({ type: Squad })
  @ApiNotFoundResponse()
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

  @ApiOkResponse()
  @ApiNotFoundResponse()
  @ApiUnauthorizedResponse()
  @ApiBearerAuth()
  @UseGuards(JwtGuard)
  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.squadService.remove(id);
  }
}
