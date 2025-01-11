#variables
DOCKER_COMPOSE = docker=compose
DOCKER_COMPOSE_FILE = docker-compose.yml

build: ##Build les images dockers via docker-compose
	@echo "Building Docker images"
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build