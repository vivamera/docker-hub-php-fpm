NAME = php-fpm

VERSIONS = 7.2

.PHONY: build
build: ${VERSIONS}

.PHONY: ${VERSIONS}
${VERSIONS}:
	@echo "Build ${@}"

	@docker run \
		--rm \
		--volume "$(shell pwd)":/app \
		finalgene/hadolint \
		${@}/Dockerfile

	@docker build \
		--no-cache \
		--tag vivamera/${NAME}:${@}-dev \
		${@}/

	@docker images vivamera/${NAME}:${@}-dev

.PHONY: clean
clean:
	-@docker rmi \
		--force \
		$(shell docker images vivamera/${NAME}:*-dev -q)
