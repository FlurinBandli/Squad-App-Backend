import { MigrationInterface, QueryRunner } from "typeorm";

export class ManyTrainersForSquad1765277461203 implements MigrationInterface {
    name = 'ManyTrainersForSquad1765277461203'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`squad_trainer_trainer\` (\`squadId\` int NOT NULL, \`trainerId\` int NOT NULL, INDEX \`IDX_851e262470b205ac0567ee5128\` (\`squadId\`), INDEX \`IDX_eab0ad878f872b38d29b5865a3\` (\`trainerId\`), PRIMARY KEY (\`squadId\`, \`trainerId\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`trainer\` DROP COLUMN \`gender\``);
        await queryRunner.query(`ALTER TABLE \`trainer\` ADD \`gender\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`player\` DROP COLUMN \`gender\``);
        await queryRunner.query(`ALTER TABLE \`player\` ADD \`gender\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP COLUMN \`position\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD \`position\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_trainer_trainer\` ADD CONSTRAINT \`FK_851e262470b205ac0567ee51285\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_trainer_trainer\` ADD CONSTRAINT \`FK_eab0ad878f872b38d29b5865a36\` FOREIGN KEY (\`trainerId\`) REFERENCES \`trainer\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad_trainer_trainer\` DROP FOREIGN KEY \`FK_eab0ad878f872b38d29b5865a36\``);
        await queryRunner.query(`ALTER TABLE \`squad_trainer_trainer\` DROP FOREIGN KEY \`FK_851e262470b205ac0567ee51285\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP COLUMN \`position\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD \`position\` enum ('Goalkeeper', 'Defender', 'Midfielder', 'Striker', 'Backup') NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`player\` DROP COLUMN \`gender\``);
        await queryRunner.query(`ALTER TABLE \`player\` ADD \`gender\` enum ('Male', 'Female', 'Other') NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`trainer\` DROP COLUMN \`gender\``);
        await queryRunner.query(`ALTER TABLE \`trainer\` ADD \`gender\` enum ('Male', 'Female', 'Other') NOT NULL`);
        await queryRunner.query(`DROP INDEX \`IDX_eab0ad878f872b38d29b5865a3\` ON \`squad_trainer_trainer\``);
        await queryRunner.query(`DROP INDEX \`IDX_851e262470b205ac0567ee5128\` ON \`squad_trainer_trainer\``);
        await queryRunner.query(`DROP TABLE \`squad_trainer_trainer\``);
    }

}
