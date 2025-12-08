import { Position } from "src/types";
import { ValidateNested } from "class-validator";
import { Type } from "class-transformer";

export class SquadSquadPlayerDto {
  player: { id: number };
  // player: Pick<Player, "id">;
  position: Position;
}

export class CreateSquadDto {
  trainer: { id: number };
  // trainer: Pick<Trainer, "id">;
  name: string;
  description: string;
  date: Date;
  @ValidateNested({ always: true })
  @Type(() => SquadSquadPlayerDto)
  squadPlayers: SquadSquadPlayerDto[];
}
