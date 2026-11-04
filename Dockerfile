FROM golang:1.26-alpine

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    gcc \
    geos \
    git \
    gdal \
    libc-dev \
    libxml2-utils \
    make \
    musl-dev \
    openssh \
    postgis \
    postgresql-client \
    proj \
    tzdata \
    && xmllint --version \
    && go install github.com/go-delve/delve/cmd/dlv@v1.26.3

ENV CGO_ENABLED=1 \
    GOOS=linux \
    GOARCH=amd64 \
    GOMAXPROCS=4

RUN go install github.com/air-verse/air@latest

ARG TASK_VERSION=3.40.1
RUN curl -fsSL "https://github.com/go-task/task/releases/download/v${TASK_VERSION}/task_linux_amd64.tar.gz" \
	| tar -xz -C /usr/local/bin task \
	&& chmod +x /usr/local/bin/task

RUN adduser -D -s /bin/bash vscode && \
    mkdir -p /app && \
    mkdir -p /home/vscode/.ssh && \
    chown -R vscode:vscode /app

RUN chmod -R 777 /go/pkg

EXPOSE 8000 6060

USER vscode

WORKDIR /app

CMD ["sh", "-c", "echo 'Development container ready. Run your Go commands here.' && sleep infinity"]
