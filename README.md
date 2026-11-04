# Dockerfile for golang 1.27.3 with debugger dlv

## Local use 

```
git pull
docker build -t go1273 .
docker run -d --name go-dev-container -p 8000:8000 -p 6060:6060 go1273
docker exec -it go-dev-container bash
```

