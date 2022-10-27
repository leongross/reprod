#!/usr/bin/env bash

# prepare password
DOCKER_CREDS_B64=""
DOCKER_USERNAME="leongross"
CONTAINER_TAG="0"

# to change the correct field in the json file
# sed -i "s/PASSWORD/$DOCKER_CREDS_B64/g" config.json

docker run \
    -v "$(pwd)"/context/:/workspace \
    -v "$(pwd)"/config.json:/kaniko/.docker/config.json:ro \
    gcr.io/kaniko-project/executor:latest \
    --reproducible \
    --dockerfile Dockerfile \
    --context dir:///workspace/ \
    --destination $DOCKER_USERNAME/test-kaniko:$CONTAINER_TAG \
    --cache
