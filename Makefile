AUTH_BINARY=../project/authApp
BASE_BINARY=../project/baseApp

up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

up_build: build_auth build_base
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"


down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

build_auth:
	@echo "Building auth binary..."
	cd ../auth-service && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${AUTH_BINARY} ./cmd/app
	@echo "Done!"

build_base:
	@echo "Building base binary..."
	cd ../baseAPI && env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ${BASE_BINARY} ./cmd/app
	@echo "Done!"