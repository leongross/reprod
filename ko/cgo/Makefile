cgo-docker:
	docker run --rm -it \
	  -v examplecgo:/work \
	  --workdir=/work \
	  -e KO_DOCKER_REPO=example.com \
	  -e CGO_ENABLED=1 \
	  cgr.dev/chainguard/ko build ./ \
		--push=false \
		--preserve-import-paths

build-containerfile:
	podman build . -t rootless
