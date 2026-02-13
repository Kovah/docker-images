# Docker Images

Included packages/modules:

- SQLite, MariaDB Client, PostgreSQL Client
- Composer, Git
- PHP
  - PDO: SQLite, MySQL, Postgres
  - Redis
  - GD with JPEG, PNG, Webp, Avif
  - non-standard modules: Intl, Pcntl, BCMath, Zip

## Available Images

- PHP 8 Development (including xDebug, PCov)
  - v8.3 (ghcr.io/kovah/docker-images/php:8.3-dev)
  - v8.4 (ghcr.io/kovah/docker-images/php:8.4-dev)
  - v8.5 (ghcr.io/kovah/docker-images/php:8.5-dev)
- PHP 8 Development
  - v8.3 (ghcr.io/kovah/docker-images/php:8.3)
  - v8.4 (ghcr.io/kovah/docker-images/php:8.4)
  - v8.5 (ghcr.io/kovah/docker-images/php:8.5)

## Build steps

### Prod Images

```bash
docker buildx build --push --platform "linux/amd64,linux/arm64" -f php-prod/8.3.Dockerfile -t ghcr.io/kovah/docker-images/php:8.3 .
docker buildx build --push --platform "linux/amd64,linux/arm64" -f php-prod/8.4.Dockerfile -t ghcr.io/kovah/docker-images/php:8.4 .
docker buildx build --push --platform "linux/amd64,linux/arm64" -f php-prod/8.5.Dockerfile -t ghcr.io/kovah/docker-images/php:8.5 .
```

### Dev Images

```bash
docker buildx build --push --platform "linux/amd64,linux/arm64" -f php-dev/8.3.Dockerfile -t ghcr.io/kovah/docker-images/php:8.3-dev .
docker buildx build --push --platform "linux/amd64,linux/arm64" -f php-dev/8.4.Dockerfile -t ghcr.io/kovah/docker-images/php:8.4-dev .
docker buildx build --push --platform "linux/amd64,linux/arm64" -f php-dev/8.5.Dockerfile -t ghcr.io/kovah/docker-images/php:8.5-dev .
```
