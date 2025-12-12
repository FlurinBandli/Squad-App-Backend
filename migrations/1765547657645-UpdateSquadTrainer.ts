import { MigrationInterface, QueryRunner } from "typeorm";

export class UpdateSquadTrainer1765547657645 implements MigrationInterface {
    name = 'UpdateSquadTrainer1765547657645'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad\` DROP FOREIGN KEY \`FK_e3e831acb9addfea720fe1ee4ea\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`CREATE TABLE \`squad_trainers_trainer\` (\`squadId\` int NOT NULL, \`trainerId\` int NOT NULL, INDEX \`IDX_377ad1fa689c9081daa19232eb\` (\`squadId\`), INDEX \`IDX_c4c48c6d822c25c89ef5397ddf\` (\`trainerId\`), PRIMARY KEY (\`squadId\`, \`trainerId\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`squad\` DROP COLUMN \`trainerId\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`playerId\` \`playerId\` int NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`squadId\` \`squadId\` int NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_trainers_trainer\` ADD CONSTRAINT \`FK_377ad1fa689c9081daa19232eb1\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`squad_trainers_trainer\` ADD CONSTRAINT \`FK_c4c48c6d822c25c89ef5397ddfb\` FOREIGN KEY (\`trainerId\`) REFERENCES \`trainer\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`squad_trainers_trainer\` DROP FOREIGN KEY \`FK_c4c48c6d822c25c89ef5397ddfb\``);
        await queryRunner.query(`ALTER TABLE \`squad_trainers_trainer\` DROP FOREIGN KEY \`FK_377ad1fa689c9081daa19232eb1\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_7b057c95526d65d6e6aad55b64e\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` DROP FOREIGN KEY \`FK_b30bce6da6a7af3ec6166d94a8c\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`squadId\` \`squadId\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` CHANGE \`playerId\` \`playerId\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`squad\` ADD \`trainerId\` int NULL`);
        await queryRunner.query(`DROP INDEX \`IDX_c4c48c6d822c25c89ef5397ddf\` ON \`squad_trainers_trainer\``);
        await queryRunner.query(`DROP INDEX \`IDX_377ad1fa689c9081daa19232eb\` ON \`squad_trainers_trainer\``);
        await queryRunner.query(`DROP TABLE \`squad_trainers_trainer\``);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_b30bce6da6a7af3ec6166d94a8c\` FOREIGN KEY (\`playerId\`) REFERENCES \`player\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad_player\` ADD CONSTRAINT \`FK_7b057c95526d65d6e6aad55b64e\` FOREIGN KEY (\`squadId\`) REFERENCES \`squad\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`squad\` ADD CONSTRAINT \`FK_e3e831acb9addfea720fe1ee4ea\` FOREIGN KEY (\`trainerId\`) REFERENCES \`trainer\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

}
