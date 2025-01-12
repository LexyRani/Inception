#variables
DOCKER_COMPOSE = docker=compose
DOCKER_COMPOSE_FILE = docker-compose.yml
NAME = Inception

all: ##Prepare les repertoires, puis lance l application avec les conteneurs definis
build: ##Build les images dockers via docker-compose et relance les conteneurs
	@echo "Building Docker images"
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build
down: ## Arreter et supprimer les conteneurs Docker
re: ## stoppe les conteneurs et reconstruit les images et relance les services
clean: ## Supprimer les conteneurs, les images inutiles et donnees locales
fclean: # Supprime toutes les ressources Docker (conteneurs, images, reseaux  volumes et les donnees locales)

.Phony : all build down re clean fclean