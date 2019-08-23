# convenience makefile to boostrap & run buildout
version = 2.7
DOCKER_VERSION = $(shell cat docker-image-version.txt)
IMAGE = "tiberiuichim/wise-plone5"

all: build

build:
	docker build . -t $(IMAGE):${DOCKER_VERSION}

push:
	docker push $(IMAGE):${DOCKER_VERSION}
	docker tag $(IMAGE):${DOCKER_VERSION} $(IMAGE):latest
	docker push $(IMAGE):latest

.PHONY: all clean
