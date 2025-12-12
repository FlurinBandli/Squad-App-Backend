import { NestFactory } from "@nestjs/core";
import { AppModule } from "./app.module";
import { ValidationPipe } from "@nestjs/common";
import { SwaggerModule, DocumentBuilder } from "@nestjs/swagger";

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix("/api");
  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
      skipMissingProperties: false,
      skipNullProperties: false,
      skipUndefinedProperties: false,
      stopAtFirstError: true,
      always: true,
      transformOptions: {
        enableCircularCheck: true,
      },
    }),
  );

  const port = process.env.PORT ?? 3000;
  const config = new DocumentBuilder()
    .setTitle("Teamkader App")
    .setDescription(
      "Der Fussballverein des VfB Zürich-Leutschenbach verschickt zu jedem Spieltag seiner Jugendmannschaften eine Email an die Spieler/-innen und deren Eltern, in der der jeweilige Mannschaftskader bekannt gegeben wird.",
    )
    .setVersion("1.0")
    .addBearerAuth({ type: "http" })
    .setBasePath(`http://localhost:${port}`)
    .build();
  const documentFactory = () => SwaggerModule.createDocument(app, config);
  SwaggerModule.setup("api", app, documentFactory, {
    raw: ["json", "yaml"],
    jsonDocumentUrl: "api.json",
    yamlDocumentUrl: "api.yaml",
  });

  await app.listen(port);
}
void bootstrap();
