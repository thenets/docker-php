NAME = thenets/easyphp
TAG = latest
SHELL = /bin/bash

build: pre-build docker-build post-build

pre-build:

post-build:

docker-build:
	docker build -t $(NAME):$(TAG) --rm .

shell:
	docker run -it --rm -p 8888:80 $(NAME):$(TAG) $(SHELL)

build-shell: build shell

build-test: build test

test:
	docker run -it --rm --name debug -p 8888:80 $(NAME):$(TAG)