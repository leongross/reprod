#!/usr/bin/env bash

export KO_DOCKER_REPO=leongross
#./ko build hello.go --image-label foo=bar -L –image-label org.opencontainers.image.source=https://repo.mycorp.com/superteam/hello

# works
./ko build hello.go

# does not works
#KO_CONFIG_PATH=$(realpath ./.ko.yaml) ./ko build hello.go
