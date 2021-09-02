# SPDX-FileCopyrightText: 2021 Xiaodong Xu <xuxiaodong@pm.me>
#
# SPDX-License-Identifier: MIT

PKG  = bookdown
REPO = ${USER}/${PKG}

.PHONY: all lint

all: build tag push

lint: Dockerfile
	hadolint $<

build: Dockerfile
	docker buildx build -t ${REPO} .

tag: build
	docker tag ${REPO} ${REPO}:$(shell date -u +%Y%m%d)
	docker tag ${REPO} ${REPO}:v$(shell docker run --rm ${REPO} \
		Rscript -e "packageVersion('${PKG}')" | cut -d' ' -f2 | sed "s/‘//;s/’//")

push: tag
	docker push -a ${REPO}
