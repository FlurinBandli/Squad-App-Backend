import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from "@nestjs/common";
import { TrainerService } from "./trainer.service";
import { CreateTrainerDto } from "./dto/create-trainer.dto";
import { UpdateTrainerDto } from "./dto/update-trainer.dto";
import { Trainer } from "./entities/trainer.entity";

@Controller("trainer")
export class TrainerController {
  constructor(private readonly trainerService: TrainerService) {}

  @Post()
  create(@Body() createTrainerDto: CreateTrainerDto): Promise<Trainer> {
    return this.trainerService.create(createTrainerDto);
  }

  @Get()
  findAll(): Promise<Trainer[]> {
    return this.trainerService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: number): Promise<Trainer | null> {
    return this.trainerService.findOne(id);
  }

  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updateTrainerDto: UpdateTrainerDto,
  ): Promise<Trainer | null> {
    return this.trainerService.update(id, updateTrainerDto);
  }

  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.trainerService.remove(id);
  }
}
