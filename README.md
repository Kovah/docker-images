# Docker Images

## Available Images

- PHP 8.0 Development (including Redis, xDebug, PCov)
  - v8.0 (git.kvh.cloud/kovah/docker-images/php-dev:8.0)
  - v8.1 (git.kvh.cloud/kovah/docker-images/php-dev:8.1)
  - v8.2 (git.kvh.cloud/kovah/docker-images/php-dev:8.2)

## Build Instructions

```bash
docker buildx build --push --platform "linux/amd64,linux/arm64/v8" -f php-dev/php-8.0.Dockerfile -t git.kvh.cloud/kovah/docker-images/php-dev:8.0 .
docker buildx build --push --platform "linux/amd64,linux/arm64/v8" -f php-dev/php-8.1.Dockerfile -t git.kvh.cloud/kovah/docker-images/php-dev:8.1 .
docker buildx build --push --platform "linux/amd64,linux/arm64/v8" -f php-dev/php-8.2.Dockerfile -t git.kvh.cloud/kovah/docker-images/php-dev:8.2 .
```
