#!/usr/bin/env bash

set -x
DOCKER_REG="leongross/test-buildah"
AUTH_FILE=$(realpath "$HOME"/.docker/config.json)
IMAGE_NAME="buildah-dockerfile"
IMAGE_TAG="go-repro-1"

# build OCI image
#buildah build \
#    --omit-history \
#    --timestamp 0 \
#    -t $IMAGE_NAME

buildah build \
    --timestamp 0 \
    -t $IMAGE_NAME

# push image to (docker) registry
buildah push \
    --authfile "$AUTH_FILE" \
    --digestfile "$IMAGE_NAME"_"$IMAGE_TAG".sha256 \
    $IMAGE_NAME \
    docker://"$DOCKER_REG":"$IMAGE_TAG"
