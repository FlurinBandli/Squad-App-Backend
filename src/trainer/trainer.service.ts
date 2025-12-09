import { Injectable } from "@nestjs/common";
import { CreateTrainerDto } from "./dto/create-trainer.dto";
import { UpdateTrainerDto } from "./dto/update-trainer.dto";
import { InjectRepository } from "@nestjs/typeorm";
import { Trainer } from "./entities/trainer.entity";
import { Repository } from "typeorm";

@Injectable()
export class TrainerService {
  constructor(
    @InjectRepository(Trainer)
    private trainerRepository: Repository<Trainer>,
  ) {}

  create(createTrainerDto: CreateTrainerDto): Promise<Trainer> {
    return this.trainerRepository.save(createTrainerDto);
  }

  findAll(): Promise<Trainer[]> {
    return this.trainerRepository.find();
  }

  findOne(id: number): Promise<Trainer | null> {
    return this.trainerRepository.findOneBy({ id });
  }

  async update(
    id: number,
    updateTrainerDto: UpdateTrainerDto,
  ): Promise<Trainer | null> {
    const trainer = await this.findOne(id);
    if (!trainer) return null;
    const updateTrainer = this.trainerRepository.merge(
      trainer,
      updateTrainerDto,
    );
    return await this.trainerRepository.save(updateTrainer);
  }

  async remove(id: number): Promise<boolean> {
    const exists = await this.trainerRepository.existsBy({ id });
    if (exists) {
      await this.trainerRepository.delete(id);
    }
    return exists;
  }
}
