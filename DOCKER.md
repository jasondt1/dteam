Docker Setup

- Image runs PHP-FPM + Nginx under Supervisor
- Nginx listens on port 8080, serving `public/`
- PHP extensions: `pdo_mysql`, `zip`

Requirements

- Docker Desktop with Compose v2

Build and Run

- Build: `docker compose build app`
- Start: `docker compose up -d app`
- Open: `http://localhost:8080`

Common Tasks

- Logs: `docker compose logs -f app`
- Shell: `docker compose exec app sh`
- Artisan: `docker compose exec app php artisan <command>`

Notes

- Compose includes environment variables inline. Consider moving secrets to `.env` and referencing via `env_file`.
- `.dockerignore` excludes `vendor` and `storage`; the image recreates `storage/` and installs Composer deps during build.
- For local dev with live code edits, you can mount the app dir as a volume and skip installing deps in the image. Ask if you want that variant.
