import { MigrationInterface, QueryRunner } from "typeorm";

export class SeedSquad1764671271255 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      INSERT INTO squad (id, name, description, date) VALUES
        (1, 'Die Feuerfüchse', 'Eine aggressive Offensivmannschaft mit schnellen Flügelspielern.', '2024-09-10'),
        (2, 'Sturmkrähen', 'Bekannt für ihre unberechenbaren Konter und hohe Pressingintensität.', '2024-08-22'),
        (3, 'Eisadler', 'Disziplinierte Defensivformation, die auf Standardsituationen spezialisiert ist.', '2024-10-05'),
        (4, 'Waldwölfe', 'Körperbetontes Spiel durch kraftvolle Mittelfeldspieler.', '2024-09-18'),
        (5, 'Nebelpanther', 'Technisch versierte Mannschaft mit starkem Besitzspiel.', '2024-08-30'),
        (6, 'Donnerbären', 'Physikalisch starkes Team, das auf Zweikämpfe setzt.', '2024-10-12'),
        (7, 'Sonnenfalken', 'Offensiv ausgerichtete Truppe mit kreativem Offensivspiel.', '2024-09-25'),
        (8, 'Mondwölfe', 'Taktisch variabel, oft in defensiver Grundordnung.', '2024-08-15'),
        (9, 'Gletscherfüchse', 'Geduldiges Aufbauspiel und präzise Flanken.', '2024-10-08'),
        (10, 'Wüstenfalken', 'Ermüdet Gegner durch hohes Laufpensum und Ausdauer.', '2024-09-12'),
        (11, 'Blitzbiber', 'Schnelle Kurzpasskombinationen und technische Überlegenheit.', '2024-08-28'),
        (12, 'Felsadler', 'Unbezwingbare Defensive und starke Kopfballstärke.', '2024-10-19')
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query("DELETE FROM squad");
  }
}
