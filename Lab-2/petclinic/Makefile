IMAGE_SYSTEM := petclinic-system
IMAGE_BUILD := petclinic-build
IMAGE_RUNTIME := petclinic-runtime
VERSION ?= latest

.PHONY: all build-system build-build build-runtime up down clean rebuild

all: build-runtime up

build-system:
	docker build -t $(IMAGE_SYSTEM):$(VERSION) -f system.Dockerfile .

build-build: build-system
	docker build -t $(IMAGE_BUILD):$(VERSION) \
		--build-arg IMAGE_SYSTEM=$(IMAGE_SYSTEM) \
		--build-arg VERSION=$(VERSION) \
		-f build.Dockerfile .

build-runtime: build-build
	docker build -t $(IMAGE_RUNTIME):$(VERSION) \
		--build-arg IMAGE_BUILD=$(IMAGE_BUILD) \
		--build-arg VERSION=$(VERSION) .

up:
	docker-compose up -d

down:
	docker-compose down

clean:
	docker-compose down -v
	docker rmi -f $(IMAGE_RUNTIME):$(VERSION) $(IMAGE_BUILD):$(VERSION) $(IMAGE_SYSTEM):$(VERSION) || true

rebuild: clean build-runtime up
