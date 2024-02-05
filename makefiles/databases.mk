.PHONY: db
db: ## [Database] Run postgres
	@docker compose -f ${DOCKER_COMPOSE_FILE} up postgres

.PHONY: db-recreate
db-recreate: ## [Database] Delete and recreate postgres image
	@docker compose -f ${DOCKER_COMPOSE_FILE} stop postgres \
	&& docker compose -f ${DOCKER_COMPOSE_FILE} rm -sf postgres \
	&& docker volume rm django-backend-template_local_postgres_data \
	&& docker compose -f ${DOCKER_COMPOSE_FILE} up -d postgres

.PHONY: dumpdata
dumpdata: ## [Database] Dumpdata for fixtures
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py dumpdata auth.Permission --format=json) > ./src/fixtures/auth_permissions.json
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py dumpdata auth.Group --format=json) > ./src/fixtures/auth_groups.json
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py dumpdata users --format=json) > ./src/fixtures/users.json

.PHONY: loaddata
loaddata: ## [Database] Load for fixtures
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py loaddata --format=json fixtures/auth_permissions.json)
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py loaddata --format=json fixtures/auth_groups.json)
	@(docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py loaddata --format=json fixtures/users.json)

.PHONY: db-flush
db-flush: ## [Database] Delete database, create new database, apply migrations and apply fixtures
	db-recreate migrate loaddata
