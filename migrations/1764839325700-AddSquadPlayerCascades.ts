import { MigrationInterface, QueryRunner } from "typeorm";

export class AddSquadPlayerCascades1764839325700 implements MigrationInterface {
    name = 'AddSquadPlayerCascades1764839325700'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

}
