FROM php:8.2-fpm

# Install system packages: nginx, supervisor, and build deps for PHP extensions
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        nginx \
        supervisor \
        libzip-dev \
        zip \
        unzip \
        git \
        curl; \
    docker-php-ext-install pdo_mysql zip; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

# Configure Nginx
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Configure Supervisor (manages php-fpm + nginx)
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Ensure php-fpm exposes env vars to app
RUN sed -ri -e 's/^;?clear_env = .*/clear_env = no/' /usr/local/etc/php-fpm.d/www.conf

# Application code
WORKDIR /var/www/html

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Copy app source (storage is ignored by .dockerignore; recreate dirs below)
COPY . /var/www/html

# Ensure required Laravel dirs exist when excluded by .dockerignore
RUN mkdir -p storage bootstrap/cache \
 && chown -R www-data:www-data storage bootstrap/cache

# Install PHP dependencies for production
RUN composer install --no-dev --prefer-dist --no-interaction --optimize-autoloader || composer install --no-interaction

# Provide entrypoint to prep app key and clear caches
COPY docker/php/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose Nginx port
EXPOSE 8080

# Run everything via Supervisor (foreground) through entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["supervisord", "-n"]
