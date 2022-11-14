#!/usr/bin/env bash
BUILDS=2

for i in $(seq $BUILDS); do
    CGO_ENABLED=0 go build -o main_"$i" -buildvcs=false -trimpath -ldflags "-s -w -buildid=''"
done

sha256sum main_*
