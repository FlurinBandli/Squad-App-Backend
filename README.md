# Squad App Backend PIPA

## Installation

```bash
git clone https://git.twofold.dev/sventoye/squad-app-backend-pipa.git
```

## Requirements

### Production Requirements

- [docker](https://docs.docker.com/desktop/)

### Development Requirements

- [docker](https://docs.docker.com/desktop/)
- [node](https://nodejs.org/en/download)
- npm

## Setup

### Production Setup

```bash
docker compose build
```

### Development Setup

```bash
npm install
```

## Usage

### Production

```bash
docker compose up --build
```

### Development

```bash
# Run the database Docker container
docker compose up db --build
# Run the database dashboard Docker container (optional)
docker compose up db_dashboard --build

# Development mode
npm run start

# Development watch mode
npm run start:dev

# Production mode
npm run start:prod
```

### Run migrations

```bash
# Run
npm run migration:run

# Revert
npm run migration:revert
```

### Run tests

```bash
# Unit tests
npm run test

# E2E tests
npm run test:e2e

# Test coverage
npm run test:cov
```
