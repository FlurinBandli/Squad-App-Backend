import { Trainer } from "src/trainer/entities/trainer.entity";

export class CreateSquadDto {
  trainer: Trainer;
  name: string;
  description: string;
  date: Date;
}
