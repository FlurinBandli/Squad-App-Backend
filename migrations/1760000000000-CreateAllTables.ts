import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateAllTables1760000000000 implements MigrationInterface {
    name = 'CreateAllTables1760000000000'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`trainer\` (\`id\` int NOT NULL AUTO_INCREMENT, \`firstName\` varchar(255) NOT NULL, \`lastName\` varchar(255) NOT NULL, \`gender\` enum ('Male', 'Female', 'Other') NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`player\` (\`id\` int NOT NULL AUTO_INCREMENT, \`firstName\` varchar(255) NOT NULL, \`lastName\` varchar(255) NOT NULL, \`gender\` enum ('Male', 'Female', 'Other') NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`squad\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, \`description\` varchar(255) NOT NULL, \`date\` datetime NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`squad_player\` (\`id\` int NOT NULL AUTO_INCREMENT, \`position\` enum ('Goalkeeper', 'Defender', 'Midfielder', 'Striker', 'Backup') NOT NULL, \`playerId\` int NOT NULL, \`squadId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`squad_trainer\` (\`squadId\` int NOT NULL, \`trainerId\` int NOT NULL, INDEX \`IDX_2eed9d9322ea09ac6e70e8eb6f\` (\`squadId\`), INDEX \`IDX_f468b71f8ccc0bb36243a8adc0\` (\`trainerId\`), PRIMARY KEY (\`squadId\`, \`trainerId\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_trainer\` ADD CONSTRAINT \`FK_2eed9d9322ea09ac6e70e8eb6fd\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_trainer\` ADD CONSTRAINT \`FK_f468b71f8ccc0bb36243a8adc07\` FOREIGN KEY (\`trainerId\`) REFERENCES \`trainer\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad_trainer\` DROP FOREIGN KEY \`FK_f468b71f8ccc0bb36243a8adc07\``);
        await queryRunner.query(`ALTER TABLE \`squad_trainer\` DROP FOREIGN KEY \`FK_2eed9d9322ea09ac6e70e8eb6fd\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`DROP INDEX \`IDX_f468b71f8ccc0bb36243a8adc0\` ON \`squad_trainer\``);
        await queryRunner.query(`DROP INDEX \`IDX_2eed9d9322ea09ac6e70e8eb6f\` ON \`squad_trainer\``);
        await queryRunner.query(`DROP TABLE \`squad_trainer\``);
        await queryRunner.query(`DROP TABLE \`squad_player\``);
        await queryRunner.query(`DROP TABLE \`squad\``);
        await queryRunner.query(`DROP TABLE \`player\``);
        await queryRunner.query(`DROP TABLE \`trainer\``);
    }

}
