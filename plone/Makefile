# convenience makefile to boostrap & run buildout
version = 2.7
IMAGE = "tiberiuichim/wise-plone5"
VERSIONFILE = "docker-image-version.txt"
.DEFAULT_GOAL := build

all: bump build push

bump:
	echo "Bumping version...";
	python ./version_bump.py $(VERSIONFILE);

build:
	$(eval DOCKER_VERSION=$(shell cat $(VERSIONFILE)))
	@echo "Building new docker image: $(DOCKER_VERSION)";
	docker build . -t "$(IMAGE):$(DOCKER_VERSION)";
	@echo "Image built."

push:
	$(eval DOCKER_VERSION=$(shell cat $(VERSIONFILE)))
	docker push $(IMAGE):$(DOCKER_VERSION)
	docker tag $(IMAGE):$(DOCKER_VERSION) $(IMAGE):latest
	docker push $(IMAGE):latest

.PHONY: all build clean
