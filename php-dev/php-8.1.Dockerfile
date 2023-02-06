# DOCKERFILE DEVELOPMENT
FROM bitnami/php-fpm:8.1

RUN install_packages autoconf build-essential php-pear \
  && pear update-channels \
  && pecl install redis xdebug pcov

COPY --from=composer:latest /usr/bin/composer /opt/bitnami/php/bin/composer
