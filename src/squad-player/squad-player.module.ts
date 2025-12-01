import { Module } from "@nestjs/common";
import { SquadPlayer } from "./entities/squad-player.entity";
// import { TypeOrmModule } from "@nestjs/typeorm";

@Module({
  // imports: TypeOrmModule.forFeature([SquadPlayer]),
  // controllers: [],
  // providers: [],
  exports: [SquadPlayer],
})
export class SquadPlayerModule {}
