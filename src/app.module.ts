import { ClassSerializerInterceptor, Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { ConfigModule, ConfigService } from "@nestjs/config";
import typeormConfig, { type TypeOrmConfig } from "./config/typeorm.config";
import { PlayerModule } from "./player/player.module";
import { TrainerModule } from "./trainer/trainer.module";
import { SquadModule } from "./squad/squad.module";
import { SquadPlayerModule } from "./squad-player/squad-player.module";
import authConfig from "./config/auth.config";
import { AuthModule } from "./auth/auth.module";
import { SentryGlobalFilter, SentryModule } from "@sentry/nestjs/setup";
import { APP_FILTER } from "@nestjs/core";

@Module({
  imports: [
    SentryModule.forRoot(),
    AuthModule,
    ConfigModule.forRoot({
      load: [typeormConfig, authConfig],
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
  providers: [
    ClassSerializerInterceptor,
    { provide: APP_FILTER, useClass: SentryGlobalFilter },
  ],
})
export class AppModule {}
