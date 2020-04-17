.PHONY: build

# Rebuild the container image
.PHONY: build
build:
	docker build -t ssmiller25/cka_ng_lab:latest lab/
	docker build -t ssmiller25/cka_ng_lab_ttyd:latest ttyd/

# Test run the container
#  the local dir will be mounted under /src read-only
.PHONY: run
run:
	docker run -d --rm -p 80:80 -e TTYD_HTTP_SERVER=localhost:7681 --name cka_ng_lab ssmiller25/cka_ng_lab:latest
	docker run -d --rm --network=container:cka_ng_lab --name cka_ng_lab_ttyd ssmiller25/cka_ng_lab_ttyd:latest

# Connect inside the already running container for debugging
.PHONY: shell
shell:
	docker exec -it cka_ng_lab bash

.PHONY: clean
clean:
	true

.PHONY: extra-clean
extra-clean:
	docker rmi ssmiller25/cka_ng_lab:latest
	docker rmi ssmiller25/cka_ng_lab_ttyd:latest
	docker image prune -f
