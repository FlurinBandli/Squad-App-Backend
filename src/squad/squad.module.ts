import { Module } from "@nestjs/common";
import { SquadService } from "./squad.service";
import { SquadController } from "./squad.controller";
import { TypeOrmModule } from "@nestjs/typeorm";
import { Squad } from "./entities/squad.entity";
import { SquadPlayer } from "../squad-player/entities/squad-player.entity";

@Module({
  imports: [TypeOrmModule.forFeature([Squad, SquadPlayer])],
  controllers: [SquadController],
  providers: [SquadService],
})
export class SquadModule {}
