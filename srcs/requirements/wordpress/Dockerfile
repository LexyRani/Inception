FROM debian:bullseye

# Mise à jour et installation des dépendances PHP et MySQL :
# Installation de PHP et des extensions nécessaires à WordPress.
# Installation du client MySQL pour interagir avec MariaDB.

RUN apt update && apt upgrade -y 
RUN apt-get install php curl wget php-mysqli php-fpm php-cgi php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
RUN apt-get install default-mysql-client -y 

# Copie d’un fichier de configuration www.conf pour PHP-FPM (FastCGI Process Manager),
# qui est utilisé pour exécuter les scripts PHP en arrière-plan.
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Création du répertoire de socket PHP-FPM 
# necessaire pour stocker les sockets utilisees par PHP-FPM
RUN mkdir /run/php

# Installation d'outils supplementaites
# (VIM et inputils-ping pour tester la connectivite reseau entre les conteneurs)
RUN apt-get install iputils-ping -y
RUN apt-get install vim -y

# Copie d’un script install.sh qui sera exécuté à l’entrée du conteneur
# Modification des permissions pour rendre le script exécutable
COPY tools/install.sh /home/
RUN chmod 755 /home/install.sh

# PHP-FPM écoute généralement sur le port 9000,
# qui sera utilisé par Nginx pour traiter les requêtes PHP.
EXPOSE 9000

# Le script install.sh est exécuté au lancement du conteneur,
# pour configurer WordPress et démarrer PHP-FPM.

ENTRYPOINT ["/home/install.sh" ] 

# Ce Dockerfile est utilisé pour construire le conteneur PHP-FPM qui exécutera WordPress.
# Il sera associé à un conteneur Nginx (pour servir les pages web) 
# et un conteneur MariaDB (base de données WordPress).

# En résumé, ce conteneur :

# Fournit un environnement PHP-FPM avec les extensions nécessaires.
# Configure PHP pour fonctionner avec WordPress.
# Lance un script d’installation pour finaliser la configuration.