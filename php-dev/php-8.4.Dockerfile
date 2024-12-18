# DOCKERFILE DEVELOPMENT
FROM php:8.4-fpm

RUN apt-get install debian-archive-keyring
RUN apt-get update \
    && apt-get install -y git sqlite3 mariadb-client libicu-dev libjpeg-dev libpng-dev libfreetype6-dev libpq-dev libzip-dev libwebp-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install bcmath gd intl opcache pcntl sockets pdo_mysql pdo_pgsql zip \
    && pecl install redis pcov xdebug \
    && docker-php-source delete \
    && apt-get autoclean -y \
    && apt-get autoremove -y

COPY ./php-dev/files/php-8.4.ini /usr/local/etc/php/conf.d/docker-fpm.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir /app
WORKDIR /app
