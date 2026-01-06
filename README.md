# Squad App Backend PIPA

## Installation

```bash
git clone https://git.twofold.dev/sventoye/squad-app-backend.git
```

## Requirements

- [docker](https://docs.docker.com/desktop/)
- [node](https://nodejs.org/en/download) (for local deployment only)
- npm or [pnpm](https://pnpm.io/installation#using-npm) (for local deployment only)

## Setup (for local deployment only)

```bash
npm install
```

## Usage

### Compile and run the project in Docker

```bash
docker compose up db --build
```

### Compile and run the project locally (prefer Docker deployment)

```bash
# Run the database Docker container
docker compose up db --build

# development
npm run start

# watch mode
npm run start:dev

# production mode
npm run start:prod
```

### Run tests

```bash
# unit tests
npm run test

# e2e tests
npm run test:e2e

# test coverage
npm run test:cov
```
