# ------------------------------------------- Django commands -------------------------------------------
.PHONY: admin
admin: ## [Django] Start admin project
	@docker compose -f ${DOCKER_COMPOSE_FILE} up admin

.PHONY: api
api: ## [Django] Start api project
	@docker compose -f ${DOCKER_COMPOSE_FILE} up api

.PHONY: migrations
migrations: ## [Django] Create migrations
	@docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py makemigrations

.PHONY: migrate
migrate: ## [Django] Excecute migrations
	@docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py migrate

.PHONY: showmigrations
showmigrations: ## [Django] Show migrations
	@docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py showmigrations

.PHONY: shell
shell: ## [Django] Init bash terminal
	@docker compose -f ${DOCKER_COMPOSE_FILE} exec admin sh

.PHONY: shell_plus
shell_plus: ## [Django] Init shell with superpowers
	@docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py shell_plus

.PHONY: reset-migrations
reset-migrations: ## [Django] Delete all migrations files and create new one
	@docker compose -f ${DOCKER_COMPOSE_FILE} run admin find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
	@docker compose -f ${DOCKER_COMPOSE_FILE} run admin find . -path "*/migrations/*.pyc"  -delete
	@ migrations

# ------------------------------------------- Application commands -------------------------------------------

.PHONY: superadmin
superadmin: ## Create super user into the app
	@docker compose -f ${DOCKER_COMPOSE_FILE} run admin python manage.py createsuperuser
