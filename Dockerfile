FROM golang:1.24.3-alpine3.21 AS builder

WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 go build -o bonjour .

FROM alpine:3.21

WORKDIR /app
COPY --from=builder /app/bonjour .

EXPOSE 8080/tcp
ENTRYPOINT ["/app/bonjour", "--config", "/app/config/bonjour.yml"]
