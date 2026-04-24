import { type TypeOrmModuleOptions } from "@nestjs/typeorm";
import { type PostgresConnectionOptions } from "typeorm/driver/postgres/PostgresConnectionOptions";

export type TypeOrmConfig = TypeOrmModuleOptions & PostgresConnectionOptions;

export default (): { typeorm: TypeOrmConfig } => ({
  typeorm: {
    type: "postgres",
    url: process.env.DATABASE_URL || undefined,
    host: process.env.DATABASE_HOST,
    port: Number(process.env.DATABASE_PORT) || 5432,
    username: process.env.DATABASE_USERNAME,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME,
    entities: ["dist/**/*.entity{.ts,.js}"],
    migrations: ["dist/migrations/*{.ts,.js}"],
    autoLoadEntities: true,
    synchronize: false,
    ssl: process.env.DATABASE_URL ? { rejectUnauthorized: false } : undefined,
  },
});
