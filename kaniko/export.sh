#!/usr/bin/env bash

set -x
BASE_IMAGE=leongross/test-kaniko
BASE_TAG=nfd
RANGE=2
OUT=$(realpath ./tar/)

if [[ $# -ge 1 ]];then
    BASE_IMAGE=$1
fi

if [[ $# -ge 2 ]];then
    BASE_TAG=$2
fi

if [[ $# -ge 3 ]];then
    RANGE=$3
fi

for i in $(seq 0 $((RANGE-1)));do
    docker save "$BASE_IMAGE":"$BASE_TAG"-"$i" | gzip > "$OUT"/"$(echo "$BASE_IMAGE" | sed -e"s#/#_#g")"_"$BASE_TAG"-"$i".tar.gz
done
