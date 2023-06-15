include .envrc

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

# ==================================================================================== #
# Docker
# ==================================================================================== #

## cntr/build: build the Docker container
.PHONY: cntr/build
cntr/build:
	@$(shell ./${DOCKER_SRC}/create_templates.sh ${BIN_NAME} ${API_DIR} ${TAG} ${REPO_URL})
	@$(shell ./${DOCKER_SRC}/config.sh)
	@$(shell cd ./${DOCKER_BUILD} && ./build.sh)
	@echo "Docker image built successfully"

## cntr/run: run the container on the background
.PHONY: cntr/run
cntr/run:
	@./docker/executables/cntr/run.sh \
		${CPUS} \
		${MEMORY} \
		${BIN_NAME} \
		${HOST_SECRETS_DIR} \
		${CNTR_SECRETS_DIR} \
		${HOST_API_PORT} \
		${CNTR_API_PORT} \
		${BIN_IMAGE_TAG} \
		${CNTR_SECRETS_DIR} \
		${CONFIG_FILE_NAME}

## cntr/attach: attach to the container
.PHONY: cntr/attach
cntr/attach:
	@./docker/executables/cntr/attach.sh ${BIN_NAME}

## cntr/stop: stop the container
.PHONY: cntr/stop
cntr/stop:
	@./docker/executables/cntr/stop.sh ${BIN_NAME}

## cntr/delete: delete the container image
.PHONY: cntr/delete
cntr/delete:
	@./docker/executables/cntr/delete.sh ${BIN_IMAGE_TAG}
# ==============================================================================
