currentepoch := $(shell date +%s)
# Latest EPOCK based on cka_ng_lab, ttyd is along for the rid
latestepoch := $(shell docker image ls | grep cka_ng_lab | grep -v latest | awk ' { print $$2; } ' | sort -n | tail -n 1)



.PHONY: build

# Rebuild/tag the container image
.PHONY: build
build:
	docker build -t ssmiller25/cka_ng_lab:${currentepoch} lab/
	docker build -t ssmiller25/cka_ng_lab_ttyd:${currentepoch} ttyd/

# Test run the container
#  the local dir will be mounted under /src read-only
.PHONY: run
run:
	docker run -d --rm -p 80:80 --name cka_ng_lab ssmiller25/cka_ng_lab:${latestepoch}
	docker run -d --rm -p 7681:7681 --name cka_ng_lab_ttyd ssmiller25/cka_ng_lab_ttyd:${latestepoch}

.PHONY: push
push:
	docker tag ssmiller25/cka_ng_lab:${latestepoch} ssmiller25/cka_ng_lab:latest
	docker tag ssmiller25/cka_ng_lab:${latestepoch} ssmiller25/cka_ng_lab_ttyd:latest
	docker push ssmiller25/cka_ng_lab:latest
	docker push ssmiller25/cka_ng_lab_ttyd:latest

# Connect inside the already running container for debugging
.PHONY: shell
shell:
	docker exec -it cka_ng_lab bash

stop:
	docker stop cka_ng_lab cka_ng_lab_ttyd

.PHONY: clean
clean:
	true

.PHONY: extra-clean
extra-clean:
	docker rmi ssmiller25/cka_ng_lab:${latestepoch}
	docker rmi ssmiller25/cka_ng_lab_ttyd:${latestepoch}
	docker image prune -f
