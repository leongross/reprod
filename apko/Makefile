CONTAINER=docker
OUT=out

all: alpine-base

alpine-base: alpine-base.yaml
	mkdir -p ${OUT}
	${CONTAINER} run -v ${PWD}:/work cgr.dev/chainguard/apko build $@.yaml leongross/$@:base ${OUT}/$@.tar
	${CONTAINER} load < ${OUT}/$@.tar

alpine-libcryptsetup: alpine-libcryptsetup.yaml
	mkdir -p ${OUT}
	${CONTAINER} run -v ${PWD}:/work cgr.dev/chainguard/apko build $@.yaml leongross/$@:base ${OUT}/$@.tar
	${CONTAINER} load < ${OUT}/$@.tar

