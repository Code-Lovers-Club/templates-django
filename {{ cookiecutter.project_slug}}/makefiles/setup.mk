.PHONY: init
setup: ## [SetUp] Setup the project configuration
	@git init -b main\
	&& mv .env.example .env \
	&& mv ./environments/admin/{{ cookiecutter.admin_environment }}/.env-django.example ./environments/admin/{{ cookiecutter.admin_environment }}/.env-django \
	&& mv ./environments/admin/{{ cookiecutter.admin_environment }}/.env-postgres.example ./environments/admin/{{ cookiecutter.admin_environment }}/.env-postgres \
	&& mv ./environments/api/{{ cookiecutter.api_environment }}/.env-django.example ./environments/api/{{ cookiecutter.api_environment }}/.env-django \
	&& mv ./environments/api/{{ cookiecutter.api_environment }}/.env-postgres.example ./environments/api/{{ cookiecutter.api_environment }}/.env-postgres \
	&& pip install -U pip poetry poetry-plugin-up pre-commit\
	&& poetry install --no-root \
	&& pre-commit install \
	&& curl https://raw.githubusercontent.com/PixelFlowMX/branch-color/master/install.sh --output /tmp/install-branch-color.sh
	/bin/bash /tmp/install-branch-color.sh
