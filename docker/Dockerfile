  
FROM golang:alpine AS builder

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64
WORKDIR /build
COPY ./HTTPserver.go .

# Build the application
RUN go build -o HTTPserver ./HTTPserver.go
WORKDIR /dist
RUN cp /build/HTTPserver .

# Build a small image
FROM scratch
COPY --from=builder /dist/HTTPserver /
EXPOSE 5000
ENTRYPOINT ["/HTTPserver"]