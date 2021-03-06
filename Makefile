IMAGE_NAME = treasure-hunt
BUILDKITE_BRANCH ?= $(shell git rev-parse --abbrev-ref HEAD)
BUILDKITE_BUILD_NUMBER ?= 0

.PHONY: all help trigger-deploy clean publish

help:
	@printf "\n\033[32mEnvironment Variables\033[0m\n"
	@cat $(MAKEFILE_LIST) | egrep -o "\\$$\{[a-zA-Z0-9_]*\}" | sort | uniq | \
		sed -E 's/^[\$$\{]*|\}$$//g' | xargs -I % echo % % | \
		xargs printf "echo \"\033[93m%-30s\033[0m \$$(printenv %s)\n\"" | bash | sed "s/echo //"
	@printf "\n\033[32mMake Targets\033[0m\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""

build: ## Build the gem.
	@echo "--- :wind_chime: Building :wind_chime:"
	docker run --rm --workdir=/app -v `pwd`:/app ruby:2.3 gem build fluent-plugin-append-kubernetes-labels-to-tag.gemspec

test: ## Run the tests.
	@echo "--- :fire: Testing :fire:"
	docker run --rm --workdir=/app -v `pwd`:/app -e BUNDLE_PATH=/app/.gems ruby:2.3 script/docker-rspec.sh

clean: ## Clean up artifacts generated by build.
	@echo "--- :shower: Cleaning up :shower:"
	-rm *.gem

all: test build
