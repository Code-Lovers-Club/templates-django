.PHONY: db
db: ## [Database] Run postgres
	@docker compose -f ${DOCKER_COMPOSE_FILE} up postgres

.PHONY: db-recreate
db-recreate: ## [Database] Delete and recreate postgres image
	@docker compose -f ${DOCKER_COMPOSE_FILE} stop postgres \
	&& docker compose -f ${DOCKER_COMPOSE_FILE} rm -sf postgres \
	&& docker compose -f ${DOCKER_COMPOSE_FILE} down -v \
	&& docker compose -f ${DOCKER_COMPOSE_FILE} up -d postgres

.PHONY: dumpdata
dumpdata: ## [Database] Dumpdata for fixtures
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py dumpdata users --format=json) > ./src/fixtures/users.json

.PHONY: loaddata
loaddata: ## [Database] Load for fixtures
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py loaddata --format=json fixtures/users.json)
