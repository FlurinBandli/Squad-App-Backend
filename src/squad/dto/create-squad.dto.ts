import { Position } from "src/types";
import { IsDate, IsNumber, IsString, ValidateNested } from "class-validator";
import { Type } from "class-transformer";
import { ApiProperty } from "@nestjs/swagger";

class PlayerId {
  @ApiProperty({ description: "ID", example: 1 })
  @IsNumber()
  id: number;
}
class TrainerId {
  @ApiProperty({ description: "ID", example: 1 })
  @IsNumber()
  id: number;
}

class SquadSquadPlayerDto {
  @ApiProperty({ description: "Spieler" })
  player: PlayerId;
  @ApiProperty({ description: "Position vom Spieler" })
  position: Position;
}

export class CreateSquadDto {
  @ApiProperty({ description: "Trainer für diesen Squad" })
  trainer: TrainerId;

  @ApiProperty({ description: "Name", example: "FC Zürich" })
  @IsString()
  name: string;

  @ApiProperty({ description: "Beschreibung", example: "Seit 1896." })
  @IsString()
  description: string;

  @ApiProperty({ description: "Erstellungsdatum" })
  @IsDate()
  date: Date;

  @ApiProperty({ description: "Spieler mit ihren Positionen in diesem Team" })
  @ValidateNested({ always: true })
  @Type(() => SquadSquadPlayerDto)
  squadPlayers: SquadSquadPlayerDto[];
}
