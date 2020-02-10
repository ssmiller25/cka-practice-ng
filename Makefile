.PHONY: build run

# Rebuild the container image
build:
	docker build -t cka_ng_lab:latest lab/
	docker build -t cka_ng_lab_ttyd:latest ttyd/

# Test run the container
#  the local dir will be mounted under /src read-only
run:
	docker run cka_ng_lab:latest
	docker run cka_ng_lab_ttyd:latest

# Connect inside the running container for debugging
shell:
	docker exec -it cka_ng_lab:latest bash

clean:
	true

extra-clean:
	docker rmi cka_ng_lab:latest
	docker rmi cka_ng_lab_ttyd:latest
	docker image prune -f
