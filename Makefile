all: push

.PHONY: lint build tag push

PKG  = bookdown
REPO = ${USER}/${PKG}

lint: Dockerfile
	hadolint $<

build: Dockerfile
	docker buildx build -t ${REPO} .

DATE := $(shell date -u +%Y%m%d)
VER  := $(shell docker run --rm ${REPO} \
	Rscript -e "packageVersion('${PKG}')" | cut -d' ' -f2 | sed "s/‘//;s/’//")

tag: build
	docker tag ${REPO} ${REPO}:${DATE}
	docker tag ${REPO} ${REPO}:v${VER}

push: tag
	docker push -a ${REPO}
