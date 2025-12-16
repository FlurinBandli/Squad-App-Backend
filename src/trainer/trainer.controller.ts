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
import { TrainerService } from "./trainer.service";
import { CreateTrainerDto } from "./dto/create-trainer.dto";
import { UpdateTrainerDto } from "./dto/update-trainer.dto";
import { Trainer } from "./entities/trainer.entity";
import { JwtGuard } from "../auth/jwt.guard";
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
@Controller("/trainer")
export class TrainerController {
  constructor(private readonly trainerService: TrainerService) {}

  @ApiOperation({ summary: "Erstelle einen Trainer" })
  @ApiCreatedResponse({ type: Trainer, description: "Trainer erstellt" })
  @Post()
  create(@Body() createTrainerDto: CreateTrainerDto): Promise<Trainer> {
    return this.trainerService.create(createTrainerDto);
  }

  @ApiOperation({ summary: "Lese alle Trainer aus" })
  @ApiOkResponse({ type: [Trainer], description: "Alle Trainer ausgelesen" })
  @Get()
  findAll(): Promise<Trainer[]> {
    return this.trainerService.findAll();
  }

  @ApiOperation({ summary: "Lese einen Trainer aus" })
  @ApiOkResponse({ type: Trainer, description: "Trainer ausgelesen" })
  @ApiNotFoundResponse({ description: "Trainer existiert nicht" })
  @Get(":id")
  async findOne(@Param("id") id: number): Promise<Trainer> {
    const trainer = await this.trainerService.findOne(id);
    if (!trainer) throw new NotFoundException();
    return trainer;
  }

  @ApiOperation({ summary: "Bearbeite einen Trainer" })
  @ApiOkResponse({ type: Trainer, description: "Trainer bearbeitet" })
  @ApiNotFoundResponse({ description: "Trainer existiert nicht" })
  @Patch(":id")
  async update(
    @Param("id") id: number,
    @Body() updateTrainerDto: UpdateTrainerDto,
  ): Promise<Trainer> {
    const trainer = await this.trainerService.update(id, updateTrainerDto);
    if (!trainer) throw new NotFoundException();
    return trainer;
  }

  @ApiOperation({ summary: "Lösche einen Trainer" })
  @ApiOkResponse({ description: "Trainer gelöscht" })
  @ApiNotFoundResponse({ description: "Trainer existiert nicht" })
  @Delete(":id")
  async remove(@Param("id") id: number): Promise<void> {
    const exists = await this.trainerService.remove(id);
    if (!exists) throw new NotFoundException();
  }
}
