import { config as dotenvConfig } from "dotenv";
import { DataSource } from "typeorm";
// import typeormConfig from "./config/typeorm.config.ts";

dotenvConfig({ path: ".env" });

export const connectionSource = new DataSource({
  type: "postgres",
  url: process.env.DATABASE_URL || undefined,
  host: process.env.DATABASE_HOST,
  port: Number(process.env.DATABASE_PORT) || 5432,
  username: process.env.DATABASE_USERNAME,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
  entities: ["dist/**/*.entity{.ts,.js}"],
  migrations: ["dist/migrations/*{.ts,.js}"],
  synchronize: false,
  ssl: process.env.DATABASE_URL ? { rejectUnauthorized: false } : undefined,
});
// export const connectionSource = new DataSource(typeormConfig().typeorm);
