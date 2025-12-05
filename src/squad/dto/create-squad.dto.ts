import { Player } from "src/player/entities/player.entity";
import { Trainer } from "src/trainer/entities/trainer.entity";
import { Position } from "src/types";
import { ValidateNested } from "class-validator";
import { Type } from "class-transformer";

export class SquadSquadPlayerDto {
  player: Pick<Player, "id">;
  position: Position;
}

export class CreateSquadDto {
  trainer: Pick<Trainer, "id">;
  name: string;
  description: string;
  date: Date;
  @ValidateNested({ always: true })
  @Type(() => SquadSquadPlayerDto)
  squadPlayers: SquadSquadPlayerDto[];
}
