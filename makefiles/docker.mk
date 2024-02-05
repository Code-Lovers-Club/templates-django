.PHONY: build
build: ## [Docker] Build or rebuild project
	@docker compose -f ${DOCKER_COMPOSE_FILE} build

.PHONY: rebuild
rebuild: ## [Docker] Build with no cache option
	@docker compose -f ${DOCKER_COMPOSE_FILE} build --no-cache

.PHONY: down
down: ## [Docker] Delete all images
	@docker compose -f ${DOCKER_COMPOSE_FILE} down
