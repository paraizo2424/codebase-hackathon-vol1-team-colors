.DEFAULT_GOAL := help

build: ## build develoment environment
	cp .env.sample .env
	docker-compose run --rm ruby bundle install
	docker-compose run --rm ruby bundle exec rails db:create
	docker-compose run --rm ruby bundle exec rails db:migrate

serve: up attach ## Run Serve

up: ## Run web container
	docker-compose up -d ruby

console: ## Run Rails Console
	docker-compose run --rm ruby bundle exec rails c

bundle: ## Run bundle install
	docker-compose run --rm ruby bundle install --without production

migrate: ## Run rails db:migrate
	docker-compose run --rm ruby bundle exec rails db:migrate

reset: ## Run rails db:migrate:reset
	docker-compose run --rm ruby bundle exec rails db:migrate:reset

seed: ## Run rails db:seed
	docker-compose run --rm ruby bundle exec rails db:seed

rspec: ## Run rspec
	docker-compose run --rm ruby bundle exec rspec

attach: ## Attach running web container for binding.pry
	docker attach `docker ps -f name=backend_ruby_1 -f status=running --format "{{.ID}}"`

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'