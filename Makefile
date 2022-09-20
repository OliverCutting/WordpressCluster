default: help

CWD := $(shell cd -P -- '$(shell dirname -- "$0")' && pwd -P)

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":>*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build-image
build-image: ## Build image for use in shell
	@echo "~~~ Building docker image ~~~"
	@docker build -t ghcr.io/olivercutting/wordpresscluster .

.PHONY: launch-shell
launch-shell: ## Create a shell to work locally
	@echo "~~~ Launching interactive shell ~~~"
	@docker run -it --rm -v $(CWD):/opt/wordpress ghcr.io/olivercutting/wordpresscluster

.PHONY: clean
clean: ## Remove any files created during testing process
	@rm -rf .ash_history
	@rm -rf Chart.lock
	@echo "~~~ Cleaned up temporary files ~~~"