import * as fs from "node:fs/promises";
import { MigrationInterface, QueryRunner } from "typeorm";

export class SeedTrainers1764668685731 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    const file = await fs.readFile("./data/trainer.csv");
    for (const row of file.toString().trim().split("\n").slice(1)) {
      const columns = row.split(",");
      const gender = columns[3];

      if (gender !== "Male" && gender !== "Female") {
        columns[3] = "Other";
      }

      await queryRunner.query(
        `INSERT INTO "trainer" ("id", "firstName", "lastName", "gender")
         VALUES ($1, $2, $3, $4)`,
        columns,
      );
    }
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DELETE FROM "trainer"`);
  }
}
