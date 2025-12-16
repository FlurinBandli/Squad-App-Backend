import { Position } from "../../types";
import {
  IsDate,
  IsInstance,
  IsInt,
  IsNotEmpty,
  IsPositive,
  IsString,
  ValidateNested,
} from "class-validator";
import { Type } from "class-transformer";
import { ApiProperty } from "@nestjs/swagger";
import { SerializeOptions } from "@nestjs/common";

@SerializeOptions({ excludeExtraneousValues: true })
class PlayerId {
  @ApiProperty({ description: "ID", example: 1 })
  @IsInt()
  @IsPositive()
  id: number;
}

@SerializeOptions({ excludeExtraneousValues: true })
class TrainerId {
  @ApiProperty({ description: "ID", example: 1 })
  @IsInt()
  @IsPositive()
  id: number;
}

@SerializeOptions({ excludeExtraneousValues: true })
class SquadSquadPlayerDto {
  @ApiProperty({ description: "Spieler" })
  @ValidateNested()
  @IsInstance(PlayerId)
  @Type(() => PlayerId)
  player: PlayerId;

  @ApiProperty({ description: "Position vom Spieler" })
  position: Position;
}

@SerializeOptions({ excludeExtraneousValues: true })
export class CreateSquadDto {
  @ApiProperty({ description: "Trainer für diesen Squad" })
  @ValidateNested()
  @IsInstance(TrainerId, { each: true })
  @Type(() => TrainerId)
  trainers: TrainerId[];

  @ApiProperty({ description: "Name", example: "FC Zürich" })
  @IsString()
  @IsNotEmpty()
  name: string;

  @ApiProperty({ description: "Beschreibung", example: "Seit 1896." })
  @IsString()
  description: string;

  @ApiProperty({ description: "Erstellungsdatum" })
  @IsDate()
  @Type(() => Date)
  date: Date;

  @ApiProperty({ description: "Spieler mit ihren Positionen in diesem Team" })
  @ValidateNested()
  @IsInstance(SquadSquadPlayerDto, { each: true })
  @Type(() => SquadSquadPlayerDto)
  squadPlayers: SquadSquadPlayerDto[];
}
