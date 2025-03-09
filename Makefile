all:
	@sudo mkdir -p /home/aceralin/data/db /home/aceralin/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

install :
	@sudo apt-get update
	@sudo apt-get upgrade -y
	@sudo apt-get apt-utils
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker
	@sudo mkdir -p /home/aceralin/data/db /home/aceralin/data/wordpress
	
reboot :
	@sudo reboot
	@sleep 60 
	
CONTAINERS = wordpress mariadb nginx

pause:
	@echo "Pause des conteneurs wordpress, mariadb et nginx..."
	@docker pause $(CONTAINERS)

unpause:
	@echo "Relance des conteneurs wordpress, mariadb et nginx..."
	@docker unpause $(CONTAINERS)

restart:
	@echo "Redémarrage des conteneurs wordpress, mariadb et nginx..."
	@docker restart $(CONTAINERS)

status:
	@echo "Vérification du statut des conteneurs wordpress, mariadb et nginx..."
	@docker ps --filter "name=wordpress" --filter "name=mariadb" --filter "name=nginx" --format "table {{.Names}}\t{{.Status}}"

pause_and_restart:
	@$(MAKE) pause
	@sleep 2
	@$(MAKE) unpause
	@sleep 2
	@$(MAKE) status
	
check_db:
	@docker exec -it mariadb mysql -u root -p

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker system prune -a
	@sudo rm -rf /home/aceralin/data



.PHONY: all clean install restart down
