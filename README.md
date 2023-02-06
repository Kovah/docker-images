# Docker Images

## Available Images

- PHP 8.0 Development (Redis, xDebug, PCov)
- PHP 8.1 Development (Redis, xDebug, PCov)
- PHP 8.2 Development (Redis, xDebug, PCov)

## Build Instructions

```bash
docker buildx build --push --platform "linux/amd64" -f php-dev/php-8.2.Dockerfile -t git.kvh.cloud/kovah/docker-images/php-dev/8.2 .
```
