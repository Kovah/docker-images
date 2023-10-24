# DOCKERFILE DEVELOPMENT
FROM php:8.2-fpm

RUN apt-get update \
    && apt-get install -y libicu-dev libjpeg-dev libpng-dev libfreetype6-dev libpq-dev libzip-dev \
    && docker-php-ext-install bcmath intl opcache pcntl pdo_mysql pdo_pgsql sockets zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && pecl install pcov redis xdebug \
    && apt-get autoclean -y \
    && apt-get autoremove -y

COPY ./php-dev/files/php-8.1.ini /usr/local/etc/php/conf.d/docker-fpm.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir /app
WORKDIR /app
