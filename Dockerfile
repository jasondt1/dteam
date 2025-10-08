# Stage 1: Build dependencies
FROM php:8.2-cli-alpine AS vendor
WORKDIR /app
# Install basic tools needed for Composer and copy Composer from official image
RUN apk add --no-cache git zip unzip \
    && true
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --no-interaction --prefer-dist

# Stage 2: Production runtime
FROM php:8.2-fpm-alpine

# Install system deps
RUN set -eux; \
    apk add --no-cache \
        nginx curl zip unzip bash git supervisor \
        libpng-dev libjpeg-turbo-dev libwebp-dev libzip-dev; \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS build-base; \
    docker-php-ext-configure gd --with-jpeg --with-webp; \
    docker-php-ext-install -j"$(nproc)" pdo_mysql gd zip exif; \
    apk del .build-deps

# Set working directory
WORKDIR /var/www/html

# Copy application
COPY . .
COPY --from=vendor /app/vendor ./vendor

# Copy config files
COPY ./docker/nginx/default.conf /etc/nginx/http.d/default.conf
COPY ./docker/supervisord.conf /etc/supervisord.conf

# Ensure required Laravel directories exist, then set permissions
RUN mkdir -p \
        storage/app/public \
        storage/framework/cache \
        storage/framework/sessions \
        storage/framework/views \
        storage/logs \
    && chmod -R 775 storage bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

# Set environment variables for Cloud Run
ENV PORT=8080
EXPOSE 8080

# Start both PHP-FPM & Nginx via Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
