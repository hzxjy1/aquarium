# stage: build code
FROM node:22-alpine AS NODE_IMAGE
WORKDIR /app

RUN wget https://github.com/foamzou/melody/archive/refs/heads/main.zip && \
    unzip main.zip && \
    cd melody-main/ && \
    export MELODY_IN_DOCKER=1 && npm run init && \
    rm -rf frontend

# stage: copy
FROM node:22-alpine
WORKDIR /app

COPY --from=pldin601/static-ffmpeg:22.04.061404-87ac0d7 /ffmpeg /ffprobe /usr/local/bin/

COPY --from=NODE_IMAGE /app/ .

EXPOSE 5566

CMD ["node", "backend/src/index.js"]
