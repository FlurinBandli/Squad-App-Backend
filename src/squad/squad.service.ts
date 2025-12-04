import { Injectable } from "@nestjs/common";
import { CreateSquadDto } from "./dto/create-squad.dto";
import { UpdateSquadDto } from "./dto/update-squad.dto";
import { InjectRepository } from "@nestjs/typeorm";
import { Squad } from "./entities/squad.entity";
import { DeepPartial, Repository } from "typeorm";

@Injectable()
export class SquadService {
  constructor(
    @InjectRepository(Squad)
    private squadRepository: Repository<Squad>,
  ) {}

  async create(createSquadDto: CreateSquadDto): Promise<Squad> {
    return Squad.new(await this.squadRepository.save(createSquadDto));
  }

  findAll(): Promise<Squad[]> {
    return this.squadRepository.find();
  }

  findOne(id: number): Promise<Squad | null> {
    return this.squadRepository.findOneBy({ id });
  }

  async update(
    id: number,
    updateSquadDto: UpdateSquadDto,
  ): Promise<Squad | null> {
    const squad = await this.findOne(id);
    if (!squad) return null;
    const updateSquad: DeepPartial<Squad> = { ...squad, ...updateSquadDto };
    return Squad.new(await this.squadRepository.save(updateSquad));
  }

  async remove(id: number): Promise<void> {
    await this.squadRepository.delete(id);
  }
}
