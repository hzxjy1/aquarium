FROM node:22-alpine

EXPOSE 24444
EXPOSE 25565

WORKDIR /work

RUN apk update && \
    apk add --no-cache bash && \
    wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz && \
    tar -xzf mcsmanager_linux_release.tar.gz --strip-components=1 && \
    rm -rf mcsmanager_linux_release.tar.gz start-daemon.sh start-web.sh usage.txt daemon && \
    mv web/* . && \
    rmdir web/ && \
    npm install

CMD ["node", "app.js"]
