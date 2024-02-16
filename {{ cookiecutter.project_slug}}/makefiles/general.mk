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
