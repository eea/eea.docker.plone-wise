all: help

.PHONY: bootstrap
bootstrap:
	cp docker-compose.override.example.yml docker-compose.override.yml

.PHONY: start-plone
start-plone:		## Start the plone process
	docker-compose up -d zeo shell msdb
	docker-compose exec shell bin/zeo_client fg

.PHONY: start-shell
start-shell:		## Start the shell
	docker-compose up -d zeo shell msdb
	docker-compose exec shell bash

.PHONY: help
help:		## Show this help.
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"
