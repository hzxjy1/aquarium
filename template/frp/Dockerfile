FROM golang:1.23.2-alpine AS builder

RUN apk --no-cache add make && \
    wget https://github.com/fatedier/frp/archive/refs/heads/dev.zip && \
    unzip dev.zip && \
    rm dev.zip && \
    cd frp-dev/ && \
    make frpc

# FROM alpine:latest
FROM scratch
COPY --from=builder /go/frp-dev/bin/frpc /frpc

CMD ["/frpc", "-c", "/frpc.toml"]
