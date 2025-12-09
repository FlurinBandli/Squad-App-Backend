import { Injectable } from "@nestjs/common";
import { CreatePlayerDto } from "./dto/create-player.dto";
import { UpdatePlayerDto } from "./dto/update-player.dto";
import { InjectRepository } from "@nestjs/typeorm";
import { Player } from "./entities/player.entity";
import { Repository } from "typeorm";

@Injectable()
export class PlayerService {
  constructor(
    @InjectRepository(Player)
    private playerRepository: Repository<Player>,
  ) {}

  create(createPlayerDto: CreatePlayerDto): Promise<Player> {
    return this.playerRepository.save(createPlayerDto);
  }

  findAll(): Promise<Player[]> {
    return this.playerRepository.find();
  }

  findOne(id: number): Promise<Player | null> {
    return this.playerRepository.findOneBy({ id });
  }

  async update(
    id: number,
    updatePlayerDto: UpdatePlayerDto,
  ): Promise<Player | null> {
    const player = await this.findOne(id);
    if (!player) return null;
    const updatePlayer = this.playerRepository.merge(player, updatePlayerDto);
    return await this.playerRepository.save(updatePlayer);
  }

  async remove(id: number): Promise<boolean> {
    const exists = await this.playerRepository.existsBy({ id });
    if (exists) {
      await this.playerRepository.delete(id);
    }
    return exists;
  }
}
