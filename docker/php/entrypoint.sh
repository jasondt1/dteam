#!/usr/bin/env sh
set -e

cd /var/www/html

# Ensure environment is loaded
if [ ! -f .env ]; then
  if [ -f .env.example ]; then
    cp .env.example .env
  else
    touch .env
  fi
fi

# Ensure runtime directories exist with correct perms
mkdir -p storage/logs \
         storage/framework/cache \
         storage/framework/sessions \
         storage/framework/views \
         bootstrap/cache
touch storage/logs/laravel.log || true
chown -R www-data:www-data storage bootstrap/cache
chmod -R ug+rwX storage bootstrap/cache

# If APP_KEY missing and not provided via env, generate one
if [ -z "$(php -r "echo getenv('APP_KEY');")" ]; then
  # Only generate if config/app.php has empty key
  if ! grep -q "^APP_KEY=base64:" .env; then
    php artisan key:generate --force || true
  fi
fi

# Clear potential stale caches
php artisan config:clear || true
php artisan route:clear || true
php artisan view:clear || true

# Fix ownership/permissions in case artisan created files as root
chown -R www-data:www-data storage bootstrap/cache || true
chmod -R ug+rwX storage bootstrap/cache || true

exec "$@"
