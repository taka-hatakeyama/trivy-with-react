.PHONY: build all

TAG := $(shell git rev-parse HEAD)

# if you want to rebuild image same commit hash
# make build TAG=$(shell date "+%Y%m%d_%H%M%S")

all: build
build:
	docker build . -f Dockerfile.builder -t local-builder:$(TAG)
	docker build . --build-arg tag=$(TAG) -f Dockerfile.prod -t built:$(TAG)

ci-scan:
	# if only want scan set --exit-code 0
	trivy --exit-code 1 --quiet --auto-refresh local-builder:$(TAG)
	trivy --exit-code 0 --quiet --auto-refresh built:$(TAG)
