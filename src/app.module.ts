import { ClassSerializerInterceptor, Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { ConfigModule, ConfigService } from "@nestjs/config";
import typeormConfig, { type TypeOrmConfig } from "./config/typeorm.config";
import { PlayerModule } from "./player/player.module";
import { TrainerModule } from "./trainer/trainer.module";
import { SquadModule } from "./squad/squad.module";
import { SquadPlayerModule } from "./squad-player/squad-player.module";
import authConfig from "./config/auth.config";

@Module({
  imports: [
    ConfigModule.forRoot({
      load: [typeormConfig],
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      inject: [ConfigService],
      useFactory: (configService: ConfigService) =>
        configService.get<TypeOrmConfig>("typeorm")!,
    }),
    PlayerModule,
    TrainerModule,
    SquadModule,
    SquadPlayerModule,
  ],
  providers: [ClassSerializerInterceptor],
})
export class AppModule {}
