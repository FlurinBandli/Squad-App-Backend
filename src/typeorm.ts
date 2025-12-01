import { config as dotenvConfig } from "dotenv";
import { DataSource } from "typeorm";
import typeormConfig from "./config/typeorm.config";

dotenvConfig({ path: ".env" });
export const connectionSource = new DataSource(typeormConfig());
