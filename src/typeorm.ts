import { config as dotenvConfig } from "dotenv";
import { DataSource } from "typeorm";
// import typeormConfig from "./config/typeorm.config.ts";

dotenvConfig({ path: ".env" });
export const connectionSource = new DataSource({
  type: "mysql",
  host: process.env.DATABASE_HOST,
  port: Number(process.env.DATABASE_PORT) || 3306,
  username: process.env.DATABASE_USERNAME,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
  entities: ["dist/**/*.entity{.ts,.js}"],
  migrations: ["dist/migrations/*{.ts,.js}"],
  synchronize: false,
});
// export const connectionSource = new DataSource(typeormConfig().typeorm);
