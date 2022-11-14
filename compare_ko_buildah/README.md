# Comparisson

## Building
As the base image we have to choose an image that contains all necessary dependencies.
This image is defined with the Containerfile `Containerfile.build`.

Get the containers with buildah:
```
buildah from docker.io/leongross/reprod:build
```
