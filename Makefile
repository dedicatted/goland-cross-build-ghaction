SUFFIX ?= linux
ENV ?= development

GOPATH=$(shell go env GOPATH)/bin

xgo:
	go install src.techknowlogick.com/xgo@latest
	mkdir -p bin/

build-xgo: xgo
	$(GOPATH)/bin/xgo -out="./bin/example-app-$(ENV)-$(SUFFIX)" -ldflags="-s -w" --targets=windows/amd64,linux/amd64,darwin/amd64,darwin/arm64 ./cmd
build-ci:
	go build -mod mod -o="./bin/example-app-$(ENV)-$(SUFFIX)" -ldflags="-s -w" ./cmd
