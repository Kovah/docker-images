FROM php:8.4-fpm

RUN apt-get install debian-archive-keyring
RUN apt-get update \
    && apt-get install -y git libavif-bin libavif-dev libbrotli-dev libcurl4-openssl-dev libfreetype6-dev libicu-dev libjpeg-dev libpng-dev libpq-dev libtidy-dev libwebp-dev libzip-dev mariadb-client postgresql-client pngquant sqlite3 webp-pixbuf-loader \
    && pecl install redis \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-avif \
    && docker-php-ext-install -j"$(nproc)" bcmath bz2 calendar exif ftp gettext gd gmp intl opcache pcntl pdo_mysql pdo_pgsql sockets tidy zip \
    && docker-php-ext-enable intl pcntl zip bcmath redis \
    && docker-php-source delete \
    && apt-get autoclean -y \
    && apt-get autoremove -y

COPY ./php-prod/files/php-8.4.ini /usr/local/etc/php/conf.d/docker-fpm.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir /app
WORKDIR /app
