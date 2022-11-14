# Comparisson

## Building
As the base image we have to choose an image that contains all necessary dependencies.
This image is defined with the Containerfile `Containerfile.build`.

### buildah
Get the containers with buildah:
```
buildah from docker.io/leongross/reprod:build
```

Run locally build container using podman, i.e.
```
podman run --rm -it localhost/leongross/reprod:buildah-cgo-distroless
```

For `cgo` with missing libraries, it could look like this:
```json
{"msg":"exec container process (missing dynamic library?) `/main`: No such file or directory","level":"error","time":"2022-11-14T15:43:58.000468412Z"}
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

