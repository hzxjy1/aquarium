FROM golang:1.23.2-alpine AS go-builder

WORKDIR /go/src/app

RUN apk update && \
    apk add --no-cache gcc build-base && \
    wget https://github.com/gorcon/rcon-cli/archive/refs/heads/master.zip && \
    unzip master.zip && \
    cd rcon-cli-master && \
    CGO_ENABLED=1 go build -ldflags "-s -w -X main.ServiceVersion=${VERSION}" -o gorcon ./cmd/gorcon/main.go

FROM node:22-alpine

EXPOSE 24444
EXPOSE 25565

ARG ZULU_KEY_SHA256=6c6393d4755818a15cf055a5216cffa599f038cd508433faed2226925956509a

WORKDIR /work

VOLUME ["/world"]
VOLUME ["/work/data"]

RUN apk update && \
    apk add --no-cache bash && \
    wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz && \
    tar -xzf mcsmanager_linux_release.tar.gz --strip-components=1 && \
    rm -rf mcsmanager_linux_release.tar.gz start-daemon.sh start-web.sh usage.txt web && \
    mv daemon/* . && \
    rmdir daemon/ && \
    npm install && \
    wget --quiet https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub -P /etc/apk/keys/ && \
    echo "${ZULU_KEY_SHA256}  /etc/apk/keys/alpine-signing@azul.com-5d5dc44c.rsa.pub" | sha256sum -c - && \
    apk --repository https://repos.azul.com/zulu/alpine --no-cache add zulu21-jre-headless~=21.0.5 tzdata

COPY --from=go-builder /go/src/app/rcon-cli-master/gorcon /usr/bin

CMD ["node", "app.js"]
