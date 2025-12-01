# FullStackRubyApp

Production-ready full-stack web application (Ruby API + HTML/CSS/JS frontend)

Features
- User registration & login with JWT
- CRUD for Posts (create / update / delete)
- Comments on posts
- API with error handling & authorization
- Frontend: Login/Register, Dashboard, responsive design (vanilla JS)
- Postgres DB, Docker, Nginx reverse proxy
- Scripts for setup, run, deploy, backup
- Full docs and API spec

Quickstart (development)
1. Copy `.env.example` -> `.env` and set environment variables.
2. Run:
   ./scripts/setup.sh
   ./scripts/run.sh

Production (example)
- Build images: docker compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
- nginx is configured as reverse proxy (see `nginx/nginx.conf`)

Architecture
- backend/ : Rails API app
- frontend/ : static SPA (HTML/CSS/JS)
- nginx/ : production nginx config
- scripts/ : automation scripts
- docker-compose.yml : local development compose
- docker-compose.prod.yml : production compose (example)

API Documentation
- POST /api/auth/register
- POST /api/auth/login
- GET /api/posts
- GET /api/posts/:id
- POST /api/posts
- PATCH /api/posts/:id
- DELETE /api/posts/:id
- POST /api/posts/:post_id/comments
- GET /api/posts/:post_id/comments

See docs/API.md for full request/response examples.

Security notes
- Uses JWT (HS256) — set a strong JWT_SECRET in environment
- Passwords hashed with bcrypt
- Use HTTPS in production and keep secrets in env/vault

Support
If you'd like, I can:
- Create a full Rails app from these scaffolds and push to your repo
- Add tests (RSpec), CI (GitHub Actions), and monitoring hooks
- Add OAuth/social login