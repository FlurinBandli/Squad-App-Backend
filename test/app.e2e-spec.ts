import { Test, TestingModule } from "@nestjs/testing";
import { INestApplication, Type, ValidationPipe } from "@nestjs/common";
import request from "supertest";
import { App } from "supertest/types";
import { PlayerModule } from "../src/player/player.module";
import { JwtGuard } from "../src/auth/jwt.guard";
import { Player } from "../src/player/entities/player.entity";
import { Gender, Position } from "../src/types";
import { getRepositoryToken } from "@nestjs/typeorm";
import { EntityClassOrSchema } from "@nestjs/typeorm/dist/interfaces/entity-class-or-schema.type";
import { Trainer } from "../src/trainer/entities/trainer.entity";
import { TrainerModule } from "../src/trainer/trainer.module";
import { Squad } from "../src/squad/entities/squad.entity";
import { SquadModule } from "../src/squad/squad.module";
import { SquadPlayer } from "../src/squad-player/entities/squad-player.entity";
import { SquadPlayerModule } from "../src/squad-player/squad-player.module";

/** `expect(<left>).toBe(<right>)` that does deep comparisons so that Objects can be compared.
 * The equality isn't communinicative, meaning that switching the inputs doesn't always give the same result.
 * The first input may be "equal" to the second but the second might not be "equal" to the first.
 * Instead equality means equality from the perspective of the first input.
 */
function expectObjectEq(a: unknown, b: unknown) {
  if (a instanceof Date) {
    // Special handling for Date.
    // A Date is an Object but it doesn't have any keys so it always gives false positives.
    // Instead we compare them as ISO date strings.
    // JSON can't store dates and Nest serializes them into ISO date strings.
    // If something isn't a date then we assume it's an ISO date string.
    if (b instanceof Date) {
      expect(a.toISOString()).toBe(b.toISOString());
    } else {
      expect(a.toISOString()).toBe(b);
    }
  } else if (a instanceof Object && a != null) {
    for (const key in a) {
      // @ts-expect-error object indexing
      expectObjectEq(a[key], b[key]);
    }
  } else {
    expect(a).toBe(b);
  }
}
function urlWithId(url: string, id: string | number): string {
  return `${url}/${id}`;
}

function newMockRepository() {
  return {
    save: jest.fn((a): unknown => a),
    find: jest.fn((): unknown[] => []),
    findOneBy: jest.fn((): unknown => null),
    existsBy: jest.fn(() => false),
    update: jest.fn((a): unknown => a),
    delete: jest.fn(() => false),
    merge: jest.fn((a, b): unknown => ({ ...a, ...b })),
  };
}

type MockEntity = { [key: string]: unknown; id: number };
type MockTest<T = MockEntity> = {
  /** Name and url of test
   * @example "player"
   */
  name: string;
  /** Entity class
   * @example Player
   */
  entityClass: EntityClassOrSchema;
  /** Entity classes that the entityClass depends on for its repository.
   * @example [SquadPlayer]
   * @default []
   */
  entityClassDepenedencies?: EntityClassOrSchema[];
  /** Entity module class
   * @example [PlayerModule]
   */
  entityModules: Type[];
  /** Valid entities */
  entities: T[];
  /** Valid entities but only for updating */
  partialEntities: Partial<T>[];
  /** Invalid entities but only for creating */
  invalidForCreateEntities: {
    entity: Partial<T>;
    err: string;
  }[];
  /** Invalid entities */
  invalidEntities: {
    entity: Partial<T>;
    err: string;
  }[];
  /** If the `GET /<path>/:id` endpoint requires authentication
   * @default true
   */
  getOneHasGuard?: boolean;
};

const playerTests: MockTest<Player> = {
  name: "player",
  entityClass: Player,
  entityModules: [PlayerModule],

  entities: [
    { id: 1, firstName: "Karl", lastName: "Marx", gender: Gender.Other },
    { id: 2, firstName: "Vladimir", lastName: "Lenin", gender: Gender.Male },
    { id: 3, firstName: "Rosa", lastName: "Luxemburg", gender: Gender.Female },
    { id: 4, firstName: "Patrice", lastName: "Lmumba", gender: Gender.Other },
    { id: 5, firstName: "Fred", lastName: "Hampton", gender: Gender.Male },
    { id: 5, firstName: "Thomas", lastName: "Sankara", gender: Gender.Male },
  ],
  partialEntities: [
    { firstName: "Vladimir", lastName: "Lenin" },
    { firstName: "Vladimir", gender: Gender.Male },
    { lastName: "Lenin", gender: Gender.Male },
    { firstName: "Rosa", lastName: "Luxemburg" },
    { firstName: "Rosa", gender: Gender.Female },
    { lastName: "Luxemburg", gender: Gender.Female },
  ],

  invalidForCreateEntities: [
    { entity: { firstName: "Test" }, err: "missing last name and gender" },
    { entity: {}, err: "missing all properties" },
  ],
  invalidEntities: [
    {
      entity: { firstName: "", lastName: "Test", gender: Gender.Male },
      err: "empty first name",
    },
    {
      entity: { firstName: "Test", lastName: "", gender: Gender.Male },
      err: "empty last name",
    },
    {
      entity: {
        firstName: "Test",
        lastName: "Player",
        gender: "INVALID" as Gender,
      },
      err: "invalid gender value",
    },
    {
      entity: { firstName: "Test", lastName: "Player", gender: "" as Gender },
      err: "invalid gender value",
    },
  ],
};

const trainerTests: MockTest<Trainer> = {
  name: "trainer",
  entityClass: Trainer,
  entityModules: [TrainerModule],

  entities: [
    { id: 1, firstName: "Yahya", lastName: "Sinwar", gender: Gender.Other },
    { id: 2, firstName: "Mohammed", lastName: "Deif", gender: Gender.Male },
    { id: 3, firstName: "Leila", lastName: "Khaled", gender: Gender.Female },
    { id: 4, firstName: "Hassan", lastName: "Nasrallah", gender: Gender.Male },
    { id: 5, firstName: "George", lastName: "Habash", gender: Gender.Male },
  ],
  partialEntities: [
    { firstName: "Yahya", lastName: "Sinwar" },
    { firstName: "Yahya", gender: Gender.Male },
    { lastName: "Sinwar", gender: Gender.Male },
    { firstName: "Mohammed", lastName: "Deif" },
    { firstName: "Mohammed", gender: Gender.Male },
    { lastName: "Deif", gender: Gender.Male },
  ],

  invalidForCreateEntities: [
    { entity: { firstName: "Test" }, err: "missing last name and gender" },
    { entity: {}, err: "missing all properties" },
  ],
  invalidEntities: [
    {
      entity: { firstName: "", lastName: "Test", gender: Gender.Male },
      err: "empty first name",
    },
    {
      entity: { firstName: "Test", lastName: "", gender: Gender.Female },
      err: "empty last name",
    },
    {
      entity: {
        firstName: "Test",
        lastName: "Player",
        gender: "INVALID" as Gender,
      },
      err: "invalid gender value",
    },
    {
      entity: { firstName: "Test", lastName: "Player", gender: "" as Gender },
      err: "invalid gender value",
    },
  ],
};

const squadTests: MockTest<
  Omit<Squad, "squadPlayers"> & { squadPlayers: Omit<SquadPlayer, "squad">[] }
> = {
  name: "squad",
  entityClass: Squad,
  entityClassDepenedencies: [SquadPlayer],
  entityModules: [SquadModule, SquadPlayerModule],
  entities: [
    {
      id: 1,
      name: "Squad",
      description: "Desc",
      date: new Date(),
      trainers: trainerTests.entities,
      squadPlayers: [
        {
          id: 1,
          player: playerTests.entities[0],
          position: Position.Defender,
        },
        {
          id: 2,
          player: playerTests.entities[1],
          position: Position.Goalkeeper,
        },
      ],
    },
  ],
  partialEntities: [
    { name: "Abc", trainers: trainerTests.entities },
    { description: "Desc" },
    { date: new Date(2025, 11, 13) },
    {
      squadPlayers: [
        {
          id: 1,
          player: playerTests.entities[0],
          position: Position.Defender,
        },
      ],
    },
  ],
  invalidForCreateEntities: [
    { entity: {}, err: "missing fields" },
    {
      entity: {
        name: "Name",
        description: "Desc",
        trainers: [],
        date: new Date(),
      },
      err: "missing squad players",
    },
  ],
  invalidEntities: [{ entity: { name: "" }, err: "empty name" }],
  getOneHasGuard: false,
};

const tests: MockTest[] = [
  playerTests as unknown as MockTest,
  trainerTests as unknown as MockTest,
  squadTests as unknown as MockTest,
];

for (const test of tests) {
  describe(test.name, () => {
    let app: INestApplication<App>;
    const url = `/${test.name}`;

    const mockJwtGuard = {
      canActivate: jest.fn(() => true),
    };

    const mockRepository = newMockRepository();

    beforeAll(async () => {
      const moduleFixture0 = Test.createTestingModule({
        imports: test.entityModules,
      })
        .overrideProvider(getRepositoryToken(test.entityClass))
        .useValue(mockRepository);
      if (test.entityClassDepenedencies) {
        for (const entityClassDepenedency of test.entityClassDepenedencies) {
          moduleFixture0
            .overrideProvider(getRepositoryToken(entityClassDepenedency))
            .useValue(newMockRepository());
        }
      }
      const moduleFixture: TestingModule = await moduleFixture0
        .overrideGuard(JwtGuard)
        .useValue(mockJwtGuard)
        .compile();
      app = moduleFixture.createNestApplication();
      app.useGlobalPipes(
        new ValidationPipe({
          transform: true,
          skipMissingProperties: false,
          stopAtFirstError: true,
          always: true,
          transformOptions: {
            enableCircularCheck: true,
          },
        }),
      );
      await app.init();
    });
    afterAll(async () => {
      await app.close();
    });
    beforeEach(() => {
      jest.clearAllMocks();
    });

    describe(`POST ${url}`, () => {
      for (const entity of test.entities) {
        // OK 201
        it(`should create a ${test.name}`, () => {
          return request(app.getHttpServer())
            .post(url)
            .send(entity)
            .expect(201)
            .then((response) => expectObjectEq(entity, response.body));
        });
      }

      const invalidEntities = [
        ...test.invalidForCreateEntities,
        ...test.invalidEntities,
      ];
      // ERR 400
      for (const { entity, err } of invalidEntities) {
        it(`should fail to create a ${test.name} because of ${err}`, () => {
          return request(app.getHttpServer())
            .post(url)
            .send(entity)
            .expect(400);
        });
      }
    });

    describe(`GET ${url}`, () => {
      // OK 200
      it(`should return all ${test.name}s`, () => {
        mockRepository.find.mockReturnValueOnce(test.entities);
        return request(app.getHttpServer())
          .get(url)
          .expect(200)
          .then((response) => {
            expect(response.body).toBeInstanceOf(Array);
            // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
            expect(response.body.length).toBe(test.entities.length);
            expectObjectEq(test.entities, response.body);
          });
      });
    });

    describe(`GET ${urlWithId(url, ":id")}`, () => {
      // OK 200
      it(`should return a ${test.name}`, () => {
        const entity = test.entities[0];
        mockRepository.findOneBy.mockReturnValueOnce(entity);
        return request(app.getHttpServer())
          .get(urlWithId(url, entity.id))
          .expect(200)
          .then((response) => expectObjectEq(entity, response.body));
      });

      // ERR 404
      it(`should fail to return a ${test.name} with 404 because it does not exist`, () => {
        return request(app.getHttpServer())
          .get(urlWithId(url, 9999))
          .expect(404);
      });
    });

    describe(`PATCH ${urlWithId(url, ":id")}`, () => {
      const entityToUpdate = test.entities[0];

      // OK 200
      it(`should update a ${test.name}`, () => {
        mockRepository.findOneBy.mockReturnValueOnce(entityToUpdate);
        return request(app.getHttpServer())
          .patch(urlWithId(url, entityToUpdate.id))
          .send(entityToUpdate)
          .expect(200)
          .then((response) => expectObjectEq(entityToUpdate, response.body));
      });

      // OK 200
      for (const partialEntity of test.partialEntities) {
        it(`should update select fields of a ${test.name}`, () => {
          mockRepository.findOneBy.mockReturnValueOnce(entityToUpdate);
          return request(app.getHttpServer())
            .patch(urlWithId(url, entityToUpdate.id))
            .send(partialEntity)
            .expect(200)
            .then((response) => {
              expectObjectEq(
                {
                  ...entityToUpdate,
                  ...partialEntity,
                },
                response.body,
              );
            });
        });
      }

      // ERR 400
      for (const { entity, err } of test.invalidEntities) {
        it(`should fail to update a ${test.name} because of ${err}`, () => {
          return request(app.getHttpServer())
            .patch(urlWithId(url, 1))
            .send(entity)
            .expect(400);
        });
      }

      // ERR 404
      it(`should fail to update a ${test.name} with 404 because it does not exist`, () => {
        return request(app.getHttpServer())
          .patch(urlWithId(url, 9999))
          .send(test.partialEntities[0])
          .expect(404);
      });
    });

    describe(`DELETE ${urlWithId(url, ":id")}`, () => {
      // OK 200
      it(`should delete a ${test.name}`, () => {
        mockRepository.existsBy.mockReturnValueOnce(true);
        return request(app.getHttpServer())
          .delete(urlWithId(url, 1))
          .expect(200);
      });

      // ERR 404
      it(`should fail to delete a ${test.name} with 404 because it does not exist`, () => {
        mockRepository.existsBy.mockReturnValueOnce(false);
        return request(app.getHttpServer())
          .delete(urlWithId(url, 1))
          .expect(404);
      });
    });

    describe("auth", () => {
      it("should protect all endpoints with JWT", async () => {
        mockJwtGuard.canActivate.mockReturnValue(false);
        type Endpoint = {
          method: "get" | "post" | "patch" | "delete";
          path: string;
        };
        const endpoints: Endpoint[] = [
          { method: "get", path: url },
          { method: "post", path: url },
          { method: "patch", path: urlWithId(url, 1) },
          { method: "delete", path: urlWithId(url, 1) },
        ];
        if (test.getOneHasGuard ?? true) {
          endpoints.push({ method: "get", path: urlWithId(url, 1) });
        }
        const appServer = app.getHttpServer();
        for (const endpoint of endpoints) {
          await request(appServer)[endpoint.method](endpoint.path).expect(403);
        }
      });
    });
  });
}
