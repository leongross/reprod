DOCKER_REG=leongross/
IMAGE=${DOCKER_REG}
IMAGE=reprod

AUTH_FILE=${HOME}/.docker/config.json
TAG=buildah
BUILD_FLAGS=--timestamp 0
all: scratch distroless

scratch:
	buildah build ${BUILD_FLAGS} -t ${DOCKER_REG}${IMAGE}:${TAG}-$@ -f Containerfile.$@
	buildah build ${BUILD_FLAGS} -t ${DOCKER_REG}${IMAGE}:${TAG}-cgo-$@ -f Containerfile.cgo.$@
	buildah push ${DOCKER_REG}${IMAGE}:${TAG}-$@
	buildah push ${DOCKER_REG}${IMAGE}:${TAG}-cgo-$@

distroless:
	buildah build ${BUILD_FLAGS} -t ${DOCKER_REG}${IMAGE}:${TAG}-$@ -f Containerfile.$@
	buildah build ${BUILD_FLAGS} -t ${DOCKER_REG}${IMAGE}:${TAG}-cgo-$@ -f Containerfile.cgo.$@
	buildah push ${DOCKER_REG}${IMAGE}:${TAG}-$@
	buildah push ${DOCKER_REG}${IMAGE}:${TAG}-cgo-$@

clean:
	-buildah rmi ${DOCKER_REG}${IMAGE}:${TAG}-scratch
	-buildah rmi ${DOCKER_REG}${IMAGE}:${TAG}-cgo-scratch
	-buildah rmi ${DOCKER_REG}${IMAGE}:${TAG}-distroless
	-buildah rmi ${DOCKER_REG}${IMAGE}:${TAG}-cgo-distroless
