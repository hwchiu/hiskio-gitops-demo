.PHONY: build-image push-image

SERVER  =
REPO    ?=hwchiu/hiskio-gitops
COMMIT  =${shell git rev-parse --short HEAD}
LOG     ="${shell git log -1 --pretty=%B}"
VERSION ?=${COMMIT}
TYPE    ?=KIND

build:
	docker build --build-arg HASH=${COMMIT} --build-arg LOG=${LOG} --tag ${SERVER}${REPO}:${VERSION} .
	docker image tag ${SERVER}${REPO}:${VERSION} ${SERVER}${REPO}:latest

push: build-image
	docker image push ${SERVER}${REPO}:${VERSION}
	docker image push ${SERVER}${REPO}:latest
