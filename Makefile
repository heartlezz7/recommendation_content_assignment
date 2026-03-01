run:
	go run cmd/server/*.go

migrate-db-up:
	migrate -source file:./cmd/migration/database -database "postgres://postgres:postgres@localhost:5432/content_assignment?sslmode=disable" up

migrate-db-down:
	migrate -source file:./cmd/migration/database -database "postgres://postgres:postgres@localhost:5432/content_assignment?sslmode=disable" down

migrate-db-status:
	migrate -source file:/cmd/migration/database -database "$(DB_URL)" version

# migration for fix dirty state example run -> make migrate-force version=5
migrate-db-force:
	migrate -source file:/cmd/migration/database -database "$(DB_URL)" force $(version)