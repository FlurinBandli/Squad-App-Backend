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
import { TrainerService } from "./trainer.service";
import { CreateTrainerDto } from "./dto/create-trainer.dto";
import { UpdateTrainerDto } from "./dto/update-trainer.dto";
import { Trainer } from "./entities/trainer.entity";
import { JwtGuard } from "src/auth/jwt.guard";

@Controller("trainer")
export class TrainerController {
  constructor(private readonly trainerService: TrainerService) {}

  @UseGuards(JwtGuard)
  @Post()
  create(@Body() createTrainerDto: CreateTrainerDto): Promise<Trainer> {
    return this.trainerService.create(createTrainerDto);
  }

  @UseGuards(JwtGuard)
  @Get()
  findAll(): Promise<Trainer[]> {
    return this.trainerService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: number): Promise<Trainer | null> {
    return this.trainerService.findOne(id);
  }

  @UseGuards(JwtGuard)
  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updateTrainerDto: UpdateTrainerDto,
  ): Promise<Trainer | null> {
    return this.trainerService.update(id, updateTrainerDto);
  }

  @UseGuards(JwtGuard)
  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.trainerService.remove(id);
  }
}
