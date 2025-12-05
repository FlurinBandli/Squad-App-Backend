import { MigrationInterface, QueryRunner } from "typeorm";

export class MakeColumnsNotNull1764837664350 implements MigrationInterface {
    name = 'MakeColumnsNotNull1764837664350'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`playerId\` \`playerId\` int NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`squadId\` \`squadId\` int NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`squad\` DROP FOREIGN KEY \`FK_e3e831acb9addfea720fe1ee4ea\``);
        await queryRunner.query(`ALTER TABLE \`squad\` CHANGE \`trainerId\` \`trainerId\` int NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad\` ADD CONSTRAINT \`FK_e3e831acb9addfea720fe1ee4ea\` FOREIGN KEY (\`trainerId\`) REFERENCES \`trainer\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad\` DROP FOREIGN KEY \`FK_e3e831acb9addfea720fe1ee4ea\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`ALTER TABLE \`squad\` CHANGE \`trainerId\` \`trainerId\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`squad\` ADD CONSTRAINT \`FK_e3e831acb9addfea720fe1ee4ea\` FOREIGN KEY (\`trainerId\`) REFERENCES \`trainer\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`squadId\` \`squadId\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`playerId\` \`playerId\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

}
