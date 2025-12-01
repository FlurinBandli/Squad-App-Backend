import { type TypeOrmModuleOptions } from "@nestjs/typeorm";
import { type MysqlConnectionOptions } from "typeorm/driver/mysql/MysqlConnectionOptions.js";

export type TypeOrmConfig = TypeOrmModuleOptions & MysqlConnectionOptions & {};
const typeormConfig: () => TypeOrmConfig = () => ({
  type: "mysql",
  host: process.env.DATABASE_HOST,
  port: Number(process.env.DATABASE_PORT) || 3306,
  username: process.env.DATABASE_USERNAME,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
  entities: ["dist/**/*.entity{.ts,.js}"],
  migrations: ["dist/migrations/*{.ts,.js}"],
  // autoLoadEntities: true,
  // synchronize: false,
});
export default typeormConfig;
