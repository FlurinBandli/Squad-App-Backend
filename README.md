# Squad App Backend (PIPA)

## 📌 About

This project was originally created as part of an IPA (Individuelle Praktische Arbeit) by another developer.

It has been extended and adapted by **Flurin Bandli** to support:

- Deployment on **Vercel**
- Integration with a **Neon (PostgreSQL) database**
- Production-ready configuration without Docker

---

## 🚀 Tech Stack

- NestJS
- TypeORM
- PostgreSQL (Neon)
- Vercel (Deployment)

---

## ⚙️ Setup

### 1. Install dependencies

```bash
npm install
```

### 2. Environment variables

Create a .env file in the root directory:

```env
DATABASE_URL=

PORT=3000

AUTH_USERNAME=
AUTH_PASSWORD=
```

### 3. Run migrations

```bash
npm run build
npm run migration:run
```

### 4. Start backend

```bash
npm run start
```

## 🌐 API

All endpoints are prefixed with:

`/api`

Example:

POST /api/auth/login
GET /api/squad

## 🔐 Authentication

Login via:

POST /api/auth/login

Body:

{
"username": "...",
"password": "..."
}

Use the returned token:

Authorization: Bearer <token>
