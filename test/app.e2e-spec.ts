/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
// test/player.e2e-spec.ts
import { Test, TestingModule } from "@nestjs/testing";
import { INestApplication, ValidationPipe } from "@nestjs/common";
import request from "supertest";
import { App } from "supertest/types";
import { PlayerModule } from "../src/player/player.module";
import { JwtGuard } from "../src/auth/jwt.guard";
import { Player } from "../src/player/entities/player.entity";
import { Gender } from "../src/types";
import { getRepositoryToken } from "@nestjs/typeorm";

function expectObjectEq(a: unknown, b: unknown) {
  if (a instanceof Object && a != null) {
    for (const key in a) {
      // @ts-expect-error object indexing
      expectObjectEq(a[key], b[key]);
    }
  } else {
    expect(a).toBe(b);
  }
}

const mockJwtGuard = {
  canActivate: jest.fn(() => true),
};

const mockPlayerRepository = {
  save: jest.fn((a): unknown => a),
  find: jest.fn((): unknown[] => []),
  findOneBy: jest.fn((): unknown => null),
  existsBy: jest.fn(() => false),
  update: jest.fn((a): unknown => a),
  delete: jest.fn(() => false),
  merge: jest.fn((a, b): unknown => ({ ...a, ...b })),
};

describe("PlayerController (e2e)", () => {
  let app: INestApplication<App>;
  const mockEntity0: Player = {
    id: 1,
    firstName: "Vladimir",
    lastName: "Lenin",
    gender: Gender.Male,
  };
  const mockEntity1: Player = {
    id: 2,
    firstName: "Rosa",
    lastName: "Luxemburg",
    gender: Gender.Female,
  };
  const mockEntity2: Player = {
    id: 3,
    firstName: "Karl",
    lastName: "Marx",
    gender: Gender.Other,
  };
  const mockEntityUpdate: Player = {
    id: 4,
    firstName: "Karl",
    lastName: "Liebknecht",
    gender: Gender.Male,
  };

  beforeAll(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [PlayerModule],
    })
      .overrideProvider(getRepositoryToken(Player))
      .useValue(mockPlayerRepository)
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

  describe("POST /player", () => {
    it("should create a new male player", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send(mockEntity0)
        .expect(201)
        .then((response) => expectObjectEq(mockEntity0, response.body));
    });
    it("should create a new female player", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send(mockEntity1)
        .expect(201)
        .then((response) => expectObjectEq(mockEntity1, response.body));
    });
    it("should create a new player with other/unknown gender", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send(mockEntity2)
        .expect(201)
        .then((response) => expectObjectEq(mockEntity2, response.body));
    });
    it("should fail with missing last name and gender", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send({ firstName: "Test" })
        .expect(400);
    });
    it("should fail with empty first name", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send({ firstName: "", lastName: "Test", gender: Gender.Male })
        .expect(400);
    });
    it("should fail with empty last name", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send({ firstName: "Test", lastName: "", gender: Gender.Male })
        .expect(400);
    });
    it("should fail with invalid gender value", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send({ firstName: "Test", lastName: "Player", gender: "INVALID" })
        .expect(400);
    });
  });

  describe("GET /player", () => {
    it("should return all players", () => {
      const mockData = [mockEntity0, mockEntity1, mockEntity2];
      mockPlayerRepository.find.mockReturnValueOnce(mockData);
      return request(app.getHttpServer())
        .get("/player")
        .expect(200)
        .then((response) => {
          const players = response.body;
          expect(players).toBeInstanceOf(Array);
          expect(players.length).toBe(mockData.length);
          expectObjectEq(players, mockData);
        });
    });
  });

  describe("GET /player/:id", () => {
    it("should return a specific player", () => {
      mockPlayerRepository.findOneBy.mockReturnValueOnce(mockEntity0);
      return request(app.getHttpServer())
        .get(`/player/${mockEntity0.id}`)
        .expect(200)
        .then((response) => expectObjectEq(mockEntity0, response.body));
    });
    it("should return 404 for non-existent player", () => {
      return request(app.getHttpServer()).get(`/player/2`).expect(404);
    });
    it("should return 404 for non-numeric ID", () => {
      return request(app.getHttpServer()).get("/player/abc").expect(404);
    });
    it("should return 404 for negative ID", () => {
      return request(app.getHttpServer()).get("/player/-1").expect(404);
    });
    it("should return 404 for decimal ID", () => {
      return request(app.getHttpServer()).get("/player/1.5").expect(404);
    });
  });

  describe("PATCH /player/:id", () => {
    it("should update", () => {
      mockPlayerRepository.findOneBy.mockReturnValueOnce({});
      return request(app.getHttpServer())
        .patch(`/player/${mockEntityUpdate.id}`)
        .send(mockEntityUpdate)
        .expect(200)
        .then((response) => expectObjectEq(mockEntityUpdate, response.body));
    });
    it("should update only first name", () => {
      const partialUpdate = {
        firstName: "NewFirstNameOnly",
      };
      mockPlayerRepository.findOneBy.mockReturnValueOnce(mockEntityUpdate);
      return request(app.getHttpServer())
        .patch(`/player/${mockEntityUpdate.id}`)
        .send(partialUpdate)
        .expect(200)
        .then((response) => {
          expectObjectEq(
            {
              ...mockEntityUpdate,
              ...partialUpdate,
            },
            response.body,
          );
        });
    });
    it("should update only last name", () => {
      const partialUpdate = {
        lastName: "NewLastNameOnly",
      };
      mockPlayerRepository.findOneBy.mockReturnValueOnce(mockEntityUpdate);
      return request(app.getHttpServer())
        .patch(`/player/${mockEntityUpdate.id}`)
        .send(partialUpdate)
        .expect(200)
        .then((response) => {
          expectObjectEq(
            {
              ...mockEntityUpdate,
              ...partialUpdate,
            },
            response.body,
          );
        });
    });
    it("should update only gender", () => {
      const partialUpdate = {
        gender: Gender.Other,
      };
      mockPlayerRepository.findOneBy.mockReturnValueOnce(mockEntityUpdate);
      return request(app.getHttpServer())
        .patch(`/player/${mockEntityUpdate.id}`)
        .send(partialUpdate)
        .expect(200)
        .then((response) => {
          expectObjectEq(
            {
              ...mockEntityUpdate,
              ...partialUpdate,
            },
            response.body,
          );
        });
    });
    it("should return 404 when updating non-existent player", () => {
      mockPlayerRepository.findOneBy.mockReturnValueOnce(null);
      return request(app.getHttpServer())
        .patch(`/player/99`)
        .send({ firstName: "NewName" })
        .expect(404);
    });
    it("should return 400 for invalid gender", () => {
      return request(app.getHttpServer())
        .patch(`/player/1`)
        .send({ gender: "INVALID_GENDER_VALUE" })
        .expect(400);
    });
    it("should return 400 for empty first name", () => {
      return request(app.getHttpServer())
        .patch(`/player/1`)
        .send({ firstName: "" })
        .expect(400);
    });
  });

  describe("DELETE /player/:id", () => {
    it("should delete a player successfully", () => {
      mockPlayerRepository.existsBy.mockReturnValueOnce(true);
      return request(app.getHttpServer()).delete(`/player/1`).expect(200);
    });

    it("should return 404 when deleting non-existent player", () => {
      mockPlayerRepository.existsBy.mockReturnValueOnce(false);
      return request(app.getHttpServer()).delete(`/player/1`).expect(404);
    });
  });

  describe("auth", () => {
    it("should protect all endpoints with JWT", async () => {
      mockJwtGuard.canActivate.mockReturnValue(false);
      const endpoints = [
        { method: "get", path: "/player" },
        { method: "get", path: "/player/1" },
        { method: "post", path: "/player" },
        { method: "patch", path: "/player/1" },
        { method: "delete", path: "/player/1" },
      ] as const;
      const appServer = app.getHttpServer();
      for (const endpoint of endpoints) {
        await request(appServer)[endpoint.method](endpoint.path).expect(403);
      }
    });
  });
});
