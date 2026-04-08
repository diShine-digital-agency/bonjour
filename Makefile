.PHONY: build test vet lint run clean help

## Default target
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build the Bonjour binary
	go build -o bonjour .

test: ## Run all tests
	go test -v -race -count=1 ./...

vet: ## Run go vet
	go vet ./...

lint: vet ## Run linters (go vet)

run: build ## Build and run with example config
	./bonjour --config docs/bonjour.yml

validate: build ## Validate the example config file
	./bonjour --config docs/bonjour.yml config:validate

diagnose: build ## Run diagnostics
	./bonjour diagnose

clean: ## Remove build artifacts
	rm -f bonjour

ci: vet test build ## Run all CI checks (vet, test, build)
