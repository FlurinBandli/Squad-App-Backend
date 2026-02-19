import { MigrationInterface, QueryRunner } from "typeorm";

export class SeedSquad1764671271255 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
      INSERT INTO squad (id, trainerId, name, description, date) VALUES
        (1, 1, 'Die Feuerfüchse', 'Eine aggressive Offensivmannschaft mit schnellen Flügelspielern.', '2024-09-10'),
        (2, 2, 'Sturmkrähen', 'Bekannt für ihre unberechenbaren Konter und hohe Pressingintensität.', '2024-08-22'),
        (3, 3, 'Eisadler', 'Disziplinierte Defensivformation, die auf Standardsituationen spezialisiert ist.', '2024-10-05'),
        (4, 4, 'Waldwölfe', 'Körperbetontes Spiel durch kraftvolle Mittelfeldspieler.', '2024-09-18'),
        (5, 5, 'Nebelpanther', 'Technisch versierte Mannschaft mit starkem Besitzspiel.', '2024-08-30'),
        (6, 6, 'Donnerbären', 'Physikalisch starkes Team, das auf Zweikämpfe setzt.', '2024-10-12'),
        (7, 7, 'Sonnenfalken', 'Offensiv ausgerichtete Truppe mit kreativem Offensivspiel.', '2024-09-25'),
        (8, 8, 'Mondwölfe', 'Taktisch variabel, oft in defensiver Grundordnung.', '2024-08-15'),
        (9, 9, 'Gletscherfüchse', 'Geduldiges Aufbauspiel und präzise Flanken.', '2024-10-08'),
        (10, 10, 'Wüstenfalken', 'Ermüdet Gegner durch hohes Laufpensum und Ausdauer.', '2024-09-12'),
        (11, 11, 'Blitzbiber', 'Schnelle Kurzpasskombinationen und technische Überlegenheit.', '2024-08-28'),
        (12, 12, 'Felsadler', 'Unbezwingbare Defensive und starke Kopfballstärke.', '2024-10-19'),
        (13, 13, 'Sturmgeister', 'Aggressives Gegenpressing und schnelle Spielverlagerung.', '2024-09-05'),
        (14, 14, 'Flussotter', 'Flüssiges Kombinationsspiel mit vielen Spielverlagerungen.', '2024-08-18'),
        (15, 15, 'Vulkanechsen', 'Unvorhersehbares Offensivspiel mit vielen Distanzschüssen.', '2024-10-22'),
        (16, 16, 'Nordlichter', 'Junge, talentierte Mannschaft mit mutigem Offensivfußball.', '2024-09-15'),
        (17, 17, 'Klippenreiher', 'Organisierte Abwehrkette und effektive Konter.', '2024-08-25'),
        (18, 18, 'Sumpfalligatoren', 'Kampfbetontes Spiel im Mittelfeld und hohe Aggressivität.', '2024-10-14'),
        (19, 19, 'Savannengleiter', 'Extrem schnelle Flügelspieler und frühe Flanken.', '2024-09-28'),
        (20, 20, 'Grottenbären', 'Defensiv kompakt und stark in Standardsituationen.', '2024-08-12'),
        (21, 21, 'Wirbelstürme', 'Hohes Tempo und konstanter Druck auf den Gegner.', '2024-10-25'),
        (22, 22, 'Eichenhüter', 'Erfahrenes Team mit taktischer Disziplin und Ruhe.', '2024-09-08'),
        (23, 23, 'Kometenjäger', 'Risikoreiches Offensivspiel mit spektakulären Aktionen.', '2024-08-20'),
        (24, 24, 'Frostfüchse', 'Kaltblütige Chancenverwertung und effizientes Spiel.', '2024-10-29'),
        (25, 25, 'Dünenläufer', 'Anpassungsfähig an verschiedene Spielsysteme und Gegner.', '2024-09-20'),
        (26, 1, 'Gipfelstürmer', 'Ambitionierte Mannschaft, die stets nach vorne spielt.', '2024-08-08'),
        (27, 2, 'Nachtschwalben', 'Besonders stark in Abendspielen und unter Flutlicht.', '2024-11-01'),
        (28, 3, 'Morgensterne', 'Starker Start in Spiele und frühe Führungstorjäger.', '2024-09-22'),
        (29, 4, 'Lawinen', 'Überrollt Gegner in kurzen, intensiven Spielphasen.', '2024-08-05'),
        (30, 5, 'Canyon-Geister', 'Nutzt die Spielfeldbreite und tiefe Pässe effektiv.', '2024-11-05'),
        (31, 6, 'Schattenwölfe', 'Tückisches Defensivverhalten und blitzschnelle Konter.', '2024-09-30'),
        (32, 7, 'Phönixe', 'Kann aus Rückständen zurückkommen, nie aufgegeben.', '2024-08-02'),
        (33, 8, 'Eisvögel', 'Eleganter Spielstil mit hoher technischer Fertigkeit.', '2024-11-10'),
        (34, 9, 'Steppenfalken', 'Weite Räume nutzend und aus der Distanz gefährlich.', '2024-10-02'),
        (35, 10, 'Gewitterwölfe', 'Unberechenbar in der Offensive mit vielen Torchancen.', '2024-08-28'),
        (36, 11, 'Berglöwen', 'Dominant in der Heimat und schwer zu besiegen.', '2024-11-12'),
        (37, 12, 'Sternschnuppen', 'Jugendliche Mannschaft mit unkonventionellen Ideen.', '2024-10-04'),
        (38, 13, 'Gletscherbären', 'Körperlich robust und unempfindlich gegen Druck.', '2024-09-14'),
        (39, 14, 'Wüstenfüchse', 'Ausdauernd und hartnäckig, auch bei Hitze stark.', '2024-11-15'),
        (40, 15, 'Waldgeister', 'Überrascht Gegner mit unerwarteten taktischen Wendungen.', '2024-10-08'),
        (41, 16, 'Sturmböen', 'Überwältigende erste Halbzeit, hohe Laufleistung.', '2024-09-17'),
        (42, 17, 'Korallenriffe', 'Solidarische Defensive und gutes Mannschaftsgefüge.', '2024-11-18'),
        (43, 18, 'Polarlichter', 'Spektakuläre Einzelleistungen und kreative Spielzüge.', '2024-10-11'),
        (44, 19, 'Felsenfalken', 'Starke Heimperformance und fanunterstützt.', '2024-09-19'),
        (45, 20, 'Nachtfalken', 'Konterstark und effektiv in entscheidenden Momenten.', '2024-11-20'),
        (46, 21, 'Morgennebel', 'Schwer zu durchschauen, taktisch vielseitig.', '2024-10-14'),
        (47, 22, 'Klippenadler', 'Starke Flügelspieler und präzise Hereingaben.', '2024-09-24'),
        (48, 23, 'Grottenlöwen', 'Defensiv kompakt und gefährlich aus Standards.', '2024-11-22'),
        (49, 24, 'Sumpfdrachen', 'Unbequemer Gegner, der jeden Kampf sucht.', '2024-10-17'),
        (50, 25, 'Himmelsstürmer', 'Optimistisches Offensivspiel, viele Tore.', '2024-09-27')
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query("DELETE FROM squad");
  }
}
