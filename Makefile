include .env
export

DB_URL=postgres://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/$(DB_NAME)?sslmode=$(DB_SSLMODE)


run:
	go run cmd/server/*.go

migrate-db-up:
	migrate -source file:./cmd/migration/database -database "$(DB_URL)" up

migrate-db-down:
	migrate -source file:./cmd/migration/database -database "$(DB_URL)" down

migrate-db-status:
	migrate -source file:/cmd/migration/database -database "$(DB_URL)" version

# migration for fix dirty state example run -> make migrate-force version=5
migrate-db-force:
	migrate -source file:/cmd/migration/database -database "$(DB_URL)" force $(version)