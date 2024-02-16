.PHONY: init
init: ## Start the project configuration
	@git init -b main \
	&& mv .env.example .env \
	&& mv ./environments/admin/local/.env-django.example ./environments/admin/local/.env-django \
	&& mv ./environments/admin/local/.env-postgres.example ./environments/admin/local/.env-postgres \
	&& mv ./environments/api/local/.env-django.example ./environments/api/local/.env-django \
	&& mv ./environments/api/local/.env-postgres.example ./environments/api/local/.env-postgres \
	&& pip install -U pip poetry poetry-plugin-up pre-commit\
	&& poetry install --no-root \
	&& pre-commit install \
	&& curl https://raw.githubusercontent.com/PixelFlowMX/branch-color/master/install.sh --output /tmp/install-branch-color.sh
	/bin/bash /tmp/install-branch-color.sh \
	&& make db && make migrate && make loaddata \
	&& clear && echo "Your email for django admin access is: {{ cookiecutter.email }} and password: admin123"
