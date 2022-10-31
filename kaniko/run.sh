#!/usr/bin/env bash

# prepare password
DOCKER_CREDS_B64=""
DOCKER_USERNAME="leongross"
CONTAINER_TAG="reprod-file-add-0"

DOCKER_FILES=$(realpath ./dockerfiles)
DOCKER_FILE=""
SELECTION=basic

# to change the correct field in the json file
# sed -i "s/PASSWORD/$DOCKER_CREDS_B64/g" config.json

if [[ $# -ge 1 ]];then
    SELECTION=$1
fi

if [[ $# -ge 2 ]];then
    CONTAINER_TAG=$2
fi

for f in $DOCKER_FILES/*; do
    FILE=$(basename "$f")
    EXT=${FILE##*.}
    if [[ "$SELECTION" = $EXT ]];then
        DOCKER_FILE=$f 
        break
    fi
done

if [[ -n $DOCKER_FILE ]];then
    cp $DOCKER_FILE context/Dockerfile
fi

echo "[*] Using Dockerfile type '$EXT' ($(basename $DOCKER_FILE)) and tag '$CONTAINER_TAG'"

docker run \
    -v "$(pwd)"/context/:/workspace \
    -v "$(pwd)"/config.json:/kaniko/.docker/config.json:ro \
    gcr.io/kaniko-project/executor:latest \
    --reproducible \
    --dockerfile Dockerfile \
    --context dir:///workspace/ \
    --destination $DOCKER_USERNAME/test-kaniko:$CONTAINER_TAG \
    --cache
