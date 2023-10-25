FROM golang:1.21 AS builder

WORKDIR /usr/src/app
COPY hello.go .
RUN go build -v -o /app hello.go

FROM scratch
COPY --from=builder /app /app

CMD ["/app"]