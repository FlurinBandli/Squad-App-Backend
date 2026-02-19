import { MigrationInterface, QueryRunner } from "typeorm";

export class CreateTables1764664743288 implements MigrationInterface {
    name = 'CreateTables1764664743288'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`player\` (\`id\` int NOT NULL AUTO_INCREMENT, \`firstName\` varchar(255) NOT NULL, \`lastName\` varchar(255) NOT NULL, \`gender\` enum ('Male', 'Female', 'Other') NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`squad_player\` (\`id\` int NOT NULL AUTO_INCREMENT, \`position\` enum ('Goalkeeper', 'Defender', 'Midfielder', 'Striker', 'Backup') NOT NULL, \`playerId\` int NULL, \`squadId\` int NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`squad\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, \`description\` varchar(255) NOT NULL, \`date\` datetime NOT NULL, \`trainerId\` int NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`trainer\` (\`id\` int NOT NULL AUTO_INCREMENT, \`firstName\` varchar(255) NOT NULL, \`lastName\` varchar(255) NOT NULL, \`gender\` enum ('Male', 'Female', 'Other') NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad\` ADD CONSTRAINT \`FK_e3e831acb9addfea720fe1ee4ea\` FOREIGN KEY (\`trainerId\`) REFERENCES \`trainer\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad\` DROP FOREIGN KEY \`FK_e3e831acb9addfea720fe1ee4ea\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`DROP TABLE \`trainer\``);
        await queryRunner.query(`DROP TABLE \`squad\``);
        await queryRunner.query(`DROP TABLE \`squad_player\``);
        await queryRunner.query(`DROP TABLE \`player\``);
    }

}
