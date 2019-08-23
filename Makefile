.DEFAULT_GOAL := help

DOCKER = "docker-compose.override.yml"

$(DOCKER):
	cp docker-compose.override.example.yml $(DOCKER) && $(EDITOR) $(DOCKER)

.PHONY: bootstrap
bootstrap: setup-data setup-plone
	@echo "bootstraping"

.PHONY: setup-data
setup-data:		## Setup the datastorage for Zeo
	mkdir -p data/filestorage
	mkdir -p data/zeoserver
	@echo "Setting data permission to uid 500"
	sudo chown -R 500 data

.PHONY: setup-plone
setup-plone:	$(DOCKER)		## Setup products folder and Plone user
	docker-compose up -d
	docker-compose exec plone bin/develop rb
	docker-compose exec plone bin/plonectl adduser admin admin
	sudo chown -R `whoami` src/

.PHONY: start-plone
start-plone:		## Start the plone process
	docker-compose up -d zeo shell
	docker-compose up plone

.PHONY: start-shell
start-shell:		## Start the shell
	docker-compose up -d zeo shell msdb
	docker-compose exec shell bash

.PHONY: build-plone
build-plone:		## Build the Plone docker image
	docker-compose stop plone
	docker-compose rm -f plone
	docker-compose build plone
	docker-compose up -d plone

.PHONY: plone-shell
plone-shell:		## Run a shell on the Plone docker image
	docker-compose up -d plone
	docker-compose exec plone bash

.PHONY: release-plone
release-plone:		## Make a Docker Hub release for the Plone backend
	sh -c "cd plone; make all"

.PHONY: help
help:		## Show this help.
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

# .PHONY: init
# init: $(DOCKER)
# 	git submodule init
# 	git submodule update
# 	sh -c "cd frontend && git submodule init && git submodule update"

