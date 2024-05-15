.PHONY: env
env: ./.env.tmpl
	@cp .env.tmpl .env

.PHONY: run
run: env
	@docker compose up