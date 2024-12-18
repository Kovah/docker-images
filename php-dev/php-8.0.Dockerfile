# DOCKERFILE DEVELOPMENT
FROM php:8.0-fpm

RUN apt-get update \
    && apt-get install -y sqlite3 mariadb-client libicu-dev libjpeg-dev libpng-dev libfreetype6-dev libpq-dev libzip-dev libwebp-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install bcmath gd intl opcache pcntl pdo_mysql pdo_pgsql sockets zip \
    && pecl install pcov redis xdebug \
    && docker-php-source delete \
    && apt-get autoclean -y \
    && apt-get autoremove -y

COPY ./php-dev/files/php-8.1.ini /usr/local/etc/php/conf.d/docker-fpm.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir /app
WORKDIR /app
