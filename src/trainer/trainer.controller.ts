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
import { TrainerService } from "./trainer.service";
import { CreateTrainerDto } from "./dto/create-trainer.dto";
import { UpdateTrainerDto } from "./dto/update-trainer.dto";
import { Trainer } from "./entities/trainer.entity";
import { JwtGuard } from "src/auth/jwt.guard";
import {
  ApiBearerAuth,
  ApiCreatedResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiUnauthorizedResponse,
} from "@nestjs/swagger";

@ApiUnauthorizedResponse()
@ApiBearerAuth()
@UseGuards(JwtGuard)
@UseInterceptors(ClassSerializerInterceptor)
@Controller("trainer")
export class TrainerController {
  constructor(private readonly trainerService: TrainerService) {}

  @ApiCreatedResponse({ type: Trainer })
  @Post()
  create(@Body() createTrainerDto: CreateTrainerDto): Promise<Trainer> {
    return this.trainerService.create(createTrainerDto);
  }

  @ApiOkResponse({ type: [Trainer] })
  @Get()
  findAll(): Promise<Trainer[]> {
    return this.trainerService.findAll();
  }

  @ApiOkResponse({ type: Trainer })
  @ApiNotFoundResponse()
  @Get(":id")
  findOne(@Param("id") id: number): Promise<Trainer | null> {
    return this.trainerService.findOne(id);
  }

  @ApiOkResponse({ type: Trainer })
  @ApiNotFoundResponse()
  @Patch(":id")
  update(
    @Param("id") id: number,
    @Body() updateTrainerDto: UpdateTrainerDto,
  ): Promise<Trainer | null> {
    return this.trainerService.update(id, updateTrainerDto);
  }

  @ApiOkResponse()
  @ApiNotFoundResponse()
  @Delete(":id")
  remove(@Param("id") id: number): Promise<void> {
    return this.trainerService.remove(id);
  }
}
