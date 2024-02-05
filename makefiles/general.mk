.PHONY: setup
setup: ## [General] Setup the project configuration
	@git init\
	&& pip install -U pip poetry poetry-plugin-up pre-commit\
	&& poetry install --no-root \
	&& pre-commit install \
	&& curl https://raw.githubusercontent.com/PixelFlowMX/branch-color/master/install.sh --output /tmp/install-branch-color.sh
	/bin/bash /tmp/install-branch-color.sh

# Pre commit
.PHONY: validate
validate: ## [General] Run precommit for all files
	@pre-commit run --all-files

# UPDATE
.PHONY: update
update: ## [General] Update all dependencies
	@echo "Updating pre-commit plugins ..." \
	&& pre-commit autoupdate \
	&& echo "Updating pip and poetry ..." \
	&& pip install -U pip poetry \
	&& echo "Updating poetry dependencies ..." \
	&& poetry up
