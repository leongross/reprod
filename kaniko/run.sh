#!/usr/bin/env bash

# prepare password
DOCKER_CREDS_B64=""
DOCKER_USERNAME="leongross"

sed -i "s/PASSWORD/$DOCKER_CREDS_B64/g" config.json

docker run \
        -v "$(pwd)":/workspace \
        -v "$(pwd)"/config.json:/kaniko/.docker/config.json:ro  
        gcr.io/kaniko-project/executor:latest \
        --dockerfile Dockerfile \
        --context dir:///workspace/ \
        --destination $DOCKER_USERNAME/test-kaniko \
        --cache
