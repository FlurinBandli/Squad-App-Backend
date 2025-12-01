# Squad App Backend PIPA

## Installation

```bash
git clone https://git.twofold.dev/sventoye/squad-app-backend.git
```

## Setup

```bash
pnpm install
```

## Requirements

- [docker](https://docs.docker.com/desktop/)
- [node](https://nodejs.org/en/download)
- [pnpm](https://pnpm.io/installation#using-npm)

## Usage

### Compile and run the project

```bash
# development
pnpm run start

# watch mode
pnpm run start:dev

# production mode
pnpm run start:prod
```

### Run the database docker container

```bash
docker compose up --build
```

### Run tests

```bash
# unit tests
pnpm run test

# e2e tests
pnpm run test:e2e

# test coverage
pnpm run test:cov
```
