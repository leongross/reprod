BASE=leongross/reprod
#BASE=reprod
TAG=build
IMAGE=${BASE}:${TAG}

all: build buildah ko

build:
	docker build . -t ${IMAGE} -f Containerfile.build
	-docker push ${IMAGE}

buildah: build
	$(MAKE) -C $@

ko: build
	$(MAKE) -C $@

clean:
	-make -C buildah clean
	-make -C ko clean
	-docker image rm ${IMAGE}
