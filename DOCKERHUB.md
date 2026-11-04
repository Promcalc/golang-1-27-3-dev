# Go Dev Image

Готовый образ для разработки на Go с предустановленными инструментами:
- Go 1.27.3
- [Air](https://github.com/air-verse/air) — hot-reload
- [Delve](https://github.com/go-delve/delve) — отладчик
- [Task](https://taskfile.dev) — task runner
- PostgreSQL client, PostGIS, GDAL, PROJ и др.

## Быстрый старт

```bash
docker run -d --name go-dev \
  -p 8000:8000 -p 6060:6060 \
  -v "$PWD":/app \
  promcalc/golang-dev-image-1273:latest
```

## Теги

- `latest` — последняя версия
- `X.Y.Z` — точная версия (соответствует git-тегу)
- `X.Y` — мажор.минор

## Ссылки

- [Исходный код на GitHub](https://github.com/Promcalc/golang-1-27-3-dev)

## Дополнения