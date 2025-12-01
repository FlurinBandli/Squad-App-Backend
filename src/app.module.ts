import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { ConfigModule, ConfigService } from "@nestjs/config";
import typeormConfig, { type TypeOrmConfig } from "./config/typeorm.config";
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
  ],
})
export class AppModule {}
