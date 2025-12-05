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
} from "@nestjs/common";
import { SquadService } from "./squad.service";
import { CreateSquadDto } from "./dto/create-squad.dto";
import { UpdateSquadDto } from "./dto/update-squad.dto";
import { Squad } from "./entities/squad.entity";

@Controller("squad")
@UseInterceptors(ClassSerializerInterceptor)
export class SquadController {
  constructor(private readonly squadService: SquadService) {}

  @Post()
  create(@Body() createSquadDto: CreateSquadDto): Promise<Squad> {
    return this.squadService.create(createSquadDto);
  }

  @Get()
  findAll(): Promise<Squad[]> {
    return this.squadService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: number): Promise<Squad | null> {
    return this.squadService.findOne(id);
  }

  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updateSquadDto: UpdateSquadDto,
  ): Promise<Squad | null> {
    return this.squadService.update(id, updateSquadDto);
  }

  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.squadService.remove(id);
  }
}
