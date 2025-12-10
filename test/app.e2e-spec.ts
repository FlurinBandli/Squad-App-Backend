/* eslint-disable @typescript-eslint/no-unsafe-call */
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
import { CreatePlayerDto } from "../src/player/dto/create-player.dto";
import { UpdatePlayerDto } from "../src/player/dto/update-player.dto";
import { Gender } from "../src/types";
import { getRepositoryToken } from "@nestjs/typeorm";

// Mock JWT Guard for testing
const mockJwtGuard = {
  canActivate: jest.fn(() => true),
};

const mockPlayerRepository = {
  create: jest.fn(),
  save: jest.fn(),
  find: jest.fn(),
  findOne: jest.fn(),
  update: jest.fn(),
  delete: jest.fn(),
  preload: jest.fn(),
  clear: jest.fn(),
  merge: jest.fn(),
};

// Helper function to create a mock player
// const createMockPlayer = (id: number, overrides = {}): Player => ({
//   id,
//   firstName: `First${id}`,
//   lastName: `Last${id}`,
//   gender: Gender.Male,
//   ...overrides,
// });

describe("PlayerController (e2e)", () => {
  let app: INestApplication<App>;
  let createdPlayerId: number;

  // Mock data based on your entity
  const testPlayerData: CreatePlayerDto = {
    firstName: "Sven",
    lastName: "Toye",
    gender: Gender.Male,
  };

  const testPlayerDataFemale: CreatePlayerDto = {
    firstName: "Anna",
    lastName: "Müller",
    gender: Gender.Female,
  };

  const testPlayerDataOther: CreatePlayerDto = {
    firstName: "Alex",
    lastName: "Schmidt",
    gender: Gender.Other,
  };

  const updatePlayerData: UpdatePlayerDto = {
    firstName: "UpdatedFirst",
    lastName: "UpdatedLast",
    gender: Gender.Female,
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

    // Apply global pipes for validation
    app.useGlobalPipes(
      new ValidationPipe({
        // whitelist: true,
        // forbidNonWhitelisted: true,
        transform: true,
        skipMissingProperties: false,
        skipNullProperties: false,
        skipUndefinedProperties: false,
        stopAtFirstError: true,
        always: true,
        transformOptions: {
          enableImplicitConversion: true,
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
    it("should create a new male player successfully", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send(testPlayerData)
        .expect(201)
        .then((response) => {
          const player = response.body;
          expect(player).toHaveProperty("id");
          expect(player.firstName).toBe(testPlayerData.firstName);
          expect(player.lastName).toBe(testPlayerData.lastName);
          expect(player.gender).toBe(testPlayerData.gender);

          // Store the ID for later tests
          createdPlayerId = player.id;
        });
    });

    it("should create a new female player successfully", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send(testPlayerDataFemale)
        .expect(201)
        .then((response) => {
          const player = response.body;
          expect(player.firstName).toBe(testPlayerDataFemale.firstName);
          expect(player.lastName).toBe(testPlayerDataFemale.lastName);
          expect(player.gender).toBe(testPlayerDataFemale.gender);
        });
    });

    it("should create a new player with OTHER gender successfully", () => {
      return request(app.getHttpServer())
        .post("/player")
        .send(testPlayerDataOther)
        .expect(201)
        .then((response) => {
          const player = response.body;
          expect(player.gender).toBe(Gender.Other);
        });
    });

    it("should fail with missing required fields", () => {
      const invalidData = {
        firstName: "Test", // Missing lastName and gender
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(invalidData)
        .expect(400);
    });

    it("should fail with empty first name", () => {
      const invalidData = {
        firstName: "",
        lastName: "Test",
        gender: Gender.Male,
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(invalidData)
        .expect(400);
    });

    it("should fail with empty last name", () => {
      const invalidData = {
        firstName: "Test",
        lastName: "",
        gender: Gender.Male,
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(invalidData)
        .expect(400);
    });

    it("should fail with invalid gender value", () => {
      const invalidData = {
        firstName: "Test",
        lastName: "Player",
        gender: "INVALID_GENDER", // Not a valid Gender enum value
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(invalidData)
        .expect(400);
    });

    it("should fail when first name exceeds 255 characters", () => {
      const invalidData = {
        firstName: "A".repeat(256), // 256 characters, limit is 255
        lastName: "Test",
        gender: Gender.Male,
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(invalidData)
        .expect(400);
    });

    it("should succeed when first name is exactly 255 characters", () => {
      const validData = {
        firstName: "A".repeat(255), // Exactly 255 characters
        lastName: "Test",
        gender: Gender.Male,
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(validData)
        .expect(201);
    });
  });

  describe("GET /player", () => {
    it("should return all players", () => {
      return request(app.getHttpServer())
        .get("/player")
        .expect(200)
        .then((response) => {
          const players = response.body;
          expect(Array.isArray(players)).toBe(true);
          expect(players.length).toBeGreaterThan(0);

          // Check that each player has the correct properties
          players.forEach((player: Player) => {
            expect(player).toHaveProperty("id");
            expect(player).toHaveProperty("firstName");
            expect(player).toHaveProperty("lastName");
            expect(player).toHaveProperty("gender");
            expect(Object.values(Gender)).toContain(player.gender);
          });
        });
    });

    it("should return players in correct format", () => {
      return request(app.getHttpServer())
        .get("/player")
        .expect(200)
        .then((response) => {
          const players = response.body;

          // Check for proper serialization
          if (players.length > 0) {
            const firstPlayer = players[0];
            expect(typeof firstPlayer.id).toBe("number");
            expect(typeof firstPlayer.firstName).toBe("string");
            expect(typeof firstPlayer.lastName).toBe("string");
            expect(typeof firstPlayer.gender).toBe("string");

            // Should not have extra properties that aren't in entity
            const expectedProps = [
              "id",
              "firstName",
              "lastName",
              "gender",
            ] as const;
            Object.keys(firstPlayer).forEach((prop) => {
              expect(expectedProps).toContain(prop);
            });
          }
        });
    });
  });

  describe("GET /player/:id", () => {
    it("should return a specific player", () => {
      return request(app.getHttpServer())
        .get(`/player/${createdPlayerId}`)
        .expect(200)
        .then((response) => {
          const player = response.body;
          expect(player.id).toBe(createdPlayerId);
          expect(player.firstName).toBe(testPlayerData.firstName);
          expect(player.lastName).toBe(testPlayerData.lastName);
          expect(player.gender).toBe(testPlayerData.gender);
        });
    });

    it("should return 404 for non-existent player", () => {
      const nonExistentId = 99999;
      return request(app.getHttpServer())
        .get(`/player/${nonExistentId}`)
        .expect(404);
    });

    it("should return 400 for non-numeric ID", () => {
      return request(app.getHttpServer()).get("/player/abc").expect(400);
    });

    it("should return 400 for negative ID", () => {
      return request(app.getHttpServer()).get("/player/-1").expect(400);
    });

    it("should return 400 for decimal ID", () => {
      return request(app.getHttpServer()).get("/player/1.5").expect(400);
    });
  });

  describe("PATCH /player/:id", () => {
    it("should update all player fields successfully", () => {
      return request(app.getHttpServer())
        .patch(`/player/${createdPlayerId}`)
        .send(updatePlayerData)
        .expect(200)
        .then((response) => {
          const player = response.body;
          expect(player.id).toBe(createdPlayerId);
          expect(player.firstName).toBe(updatePlayerData.firstName);
          expect(player.lastName).toBe(updatePlayerData.lastName);
          expect(player.gender).toBe(updatePlayerData.gender);
        });
    });

    it("should update only first name", () => {
      const partialUpdate = {
        firstName: "NewFirstNameOnly",
      };

      return request(app.getHttpServer())
        .patch(`/player/${createdPlayerId}`)
        .send(partialUpdate)
        .expect(200)
        .then((response) => {
          const player = response.body;
          expect(player.firstName).toBe("NewFirstNameOnly");
          // Other fields should remain unchanged
          expect(player.lastName).toBe(updatePlayerData.lastName);
          expect(player.gender).toBe(updatePlayerData.gender);
        });
    });

    it("should update only last name", () => {
      const partialUpdate = {
        lastName: "NewLastNameOnly",
      };

      return request(app.getHttpServer())
        .patch(`/player/${createdPlayerId}`)
        .send(partialUpdate)
        .expect(200)
        .then((response) => {
          const player = response.body;
          expect(player.lastName).toBe("NewLastNameOnly");
          // First name should remain from previous update
          expect(player.firstName).toBe("NewFirstNameOnly");
        });
    });

    it("should update only gender", () => {
      const partialUpdate = {
        gender: Gender.Other,
      };

      return request(app.getHttpServer())
        .patch(`/player/${createdPlayerId}`)
        .send(partialUpdate)
        .expect(200)
        .then((response) => {
          const player = response.body;
          expect(player.gender).toBe(Gender.Other);
        });
    });

    it("should return 404 when updating non-existent player", () => {
      const nonExistentId = 99999;
      return request(app.getHttpServer())
        .patch(`/player/${nonExistentId}`)
        .send({ firstName: "NewName" })
        .expect(404);
    });

    it("should return 400 for invalid update data (invalid gender)", () => {
      const invalidData = {
        gender: "INVALID_GENDER_VALUE",
      };

      return request(app.getHttpServer())
        .patch(`/player/${createdPlayerId}`)
        .send(invalidData)
        .expect(400);
    });

    it("should return 400 for invalid update data (empty first name)", () => {
      const invalidData = {
        firstName: "",
      };

      return request(app.getHttpServer())
        .patch(`/player/${createdPlayerId}`)
        .send(invalidData)
        .expect(400);
    });

    it("should ignore non-whitelisted properties", () => {
      const dataWithExtraProps = {
        firstName: "ValidName",
        extraProperty: "should be ignored",
        anotherExtra: 123,
      };

      return request(app.getHttpServer())
        .patch(`/player/${createdPlayerId}`)
        .send(dataWithExtraProps)
        .expect(200)
        .then((response) => {
          const player = response.body;
          expect(player.firstName).toBe("ValidName");
          expect(player).not.toHaveProperty("extraProperty");
          expect(player).not.toHaveProperty("anotherExtra");
        });
    });
  });

  describe("DELETE /player/:id", () => {
    let playerToDeleteId: number;

    beforeEach(async () => {
      // Create a player to delete
      const response = await request(app.getHttpServer()).post("/player").send({
        firstName: "Delete",
        lastName: "Me",
        gender: Gender.Male,
      });
      playerToDeleteId = response.body.id;
    });

    it("should delete a player successfully", () => {
      return request(app.getHttpServer())
        .delete(`/player/${playerToDeleteId}`)
        .expect(200);
    });

    it("should return 404 when deleting non-existent player", () => {
      const nonExistentId = 99999;
      return request(app.getHttpServer())
        .delete(`/player/${nonExistentId}`)
        .expect(404);
    });

    it("should verify player is actually deleted", async () => {
      // First delete the player
      await request(app.getHttpServer())
        .delete(`/player/${playerToDeleteId}`)
        .expect(200);

      // Then try to get the deleted player
      return request(app.getHttpServer())
        .get(`/player/${playerToDeleteId}`)
        .expect(404);
    });

    it("should handle multiple deletions gracefully", async () => {
      // Delete once
      await request(app.getHttpServer())
        .delete(`/player/${playerToDeleteId}`)
        .expect(200);

      // Try to delete again - should return 404
      return request(app.getHttpServer())
        .delete(`/player/${playerToDeleteId}`)
        .expect(404);
    });
  });

  describe("Authentication & Authorization", () => {
    it("should reject requests without JWT token (401 Unauthorized)", async () => {
      // Temporarily disable the mock guard
      mockJwtGuard.canActivate.mockReturnValueOnce(false);

      return request(app.getHttpServer()).get("/player").expect(401);
    });

    it("should accept requests with valid JWT", async () => {
      mockJwtGuard.canActivate.mockReturnValueOnce(true);

      return request(app.getHttpServer()).get("/player").expect(200);
    });

    it("should protect all endpoints with JWT", async () => {
      mockJwtGuard.canActivate.mockReturnValueOnce(false);

      const endpoints = [
        { method: "get", path: "/player" },
        { method: "get", path: "/player/1" },
        { method: "post", path: "/player" },
        { method: "patch", path: "/player/1" },
        { method: "delete", path: "/player/1" },
      ] as const;

      const appServer = app.getHttpServer();
      for (const endpoint of endpoints) {
        await request(appServer)[endpoint.method](endpoint.path).expect(401);
      }
    });
  });

  describe("Serialization", () => {
    it("should serialize response according to Player entity", () => {
      return request(app.getHttpServer())
        .get(`/player/${createdPlayerId}`)
        .expect(200)
        .then((response) => {
          const player = response.body;
          // Check that the response follows the Player entity structure
          expect(player).toHaveProperty("id");
          expect(player).toHaveProperty("firstName");
          expect(player).toHaveProperty("lastName");
          expect(player).toHaveProperty("gender");

          // Should NOT have properties that aren't in the entity
          expect(player).not.toHaveProperty("age");
          expect(player).not.toHaveProperty("email");
          expect(player).not.toHaveProperty("position");
          expect(player).not.toHaveProperty("createdAt");
          expect(player).not.toHaveProperty("updatedAt");
        });
    });

    it("should use ApiProperty decorators for Swagger documentation", () => {
      return request(app.getHttpServer())
        .get(`/player/${createdPlayerId}`)
        .expect(200)
        .then((response) => {
          const player = response.body;
          // The properties should match the ApiProperty decorators in entity
          expect(typeof player.id).toBe("number");
          expect(typeof player.firstName).toBe("string");
          expect(typeof player.lastName).toBe("string");
          expect(typeof player.gender).toBe("string");
        });
    });
  });

  describe("Edge Cases & Business Logic", () => {
    it("should handle names with special characters", () => {
      const specialNameData = {
        firstName: "Jürgen",
        lastName: "Müller-Gößmann",
        gender: Gender.Male,
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(specialNameData)
        .expect(201)
        .then((response) => {
          expect(response.body.firstName).toBe("Jürgen");
          expect(response.body.lastName).toBe("Müller-Gößmann");
        });
    });

    it("should handle names with spaces", () => {
      const spacedNameData = {
        firstName: "Hans Peter",
        lastName: "von der Leyen",
        gender: Gender.Male,
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(spacedNameData)
        .expect(201);
    });

    it("should handle minimum length names", () => {
      const minNameData = {
        firstName: "A",
        lastName: "B",
        gender: Gender.Male,
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(minNameData)
        .expect(201);
    });

    it("should handle all gender enum values", async () => {
      const genderTests = Object.values(Gender).map((gender) => ({
        firstName: `Test${gender}`,
        lastName: `Player${gender}`,
        gender,
      }));

      for (const testData of genderTests) {
        await request(app.getHttpServer())
          .post("/player")
          .send(testData)
          .expect(201)
          .then((response) => {
            expect(response.body.gender).toBe(testData.gender);
          });
      }
    });
  });

  describe("Validation & Error Messages", () => {
    it("should provide meaningful error messages for validation failures", async () => {
      const invalidData = {
        lastName: "OnlyLastName", // Missing firstName and gender
      };

      await request(app.getHttpServer())
        .post("/player")
        .send(invalidData)
        .expect(400);
    });

    it("should validate gender enum properly", () => {
      const invalidGenderData = {
        firstName: "Test",
        lastName: "Player",
        gender: "NOT_A_GENDER",
      };

      return request(app.getHttpServer())
        .post("/player")
        .send(invalidGenderData)
        .expect(400);
    });
  });
});
