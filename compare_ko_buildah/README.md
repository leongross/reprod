# Comparisson

## Building
As the base image we have to choose an image that contains all necessary dependencies.
This image is defined with the Containerfile `Containerfile.build`.

Get the containers with buildah:
```
buildah from docker.io/leongross/reprod:build
```

### ko
```
$ KO_CONFIG_PATH=$(realpath .ko.yaml) ko build ./ko/cmd
```

#### Import path:
> String used to import a package. A package's import path is its module path joined with its subdirectory within the module [src](https://go.dev/doc/code)
Module: `github.com/google/go-cmp`
Package: `cmp/`
Import Path: `github.com/google/go-cmp/cmp`

