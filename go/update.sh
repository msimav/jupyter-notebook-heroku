#!/bin/sh

docker run --rm -v $PWD:/data \
  -e VERSION=1.0.0-RC1 \
  -e CGO_LDFLAGS="-lstdc++ -lm -lsodium" \
  -e CGO_ENABLED=1 \
  -e GOOS=linux \
  golang:1.13-alpine sh -c "
apk add --no-cache git build-base zeromq-dev musl-dev pkgconfig alpine-sdk libsodium-dev libsodium-static
go get -d -u github.com/gopherdata/gophernotes
cd /go/src/github.com/gopherdata/gophernotes

go build -a --ldflags '-extldflags "-static" -v' -o /data/gophernotes
"
