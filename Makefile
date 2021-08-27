all: push

lint: Dockerfile
	hadolint $<

build: Dockerfile
	docker buildx build -t ${USER}/bookdown .
tag: build
	docker tag ${USER}/bookdown ${USER}/bookdown:$(shell date +%Y%m%d)
	docker tag ${USER}/bookdown ${USER}/bookdown:v$(shell docker run --rm ${USER}/bookdown Rscript -e "packageVersion('bookdown')" | cut -d' ' -f2 | sed "s/‘//;s/’//")
push: tag
	docker push -a ${USER}/bookdown
