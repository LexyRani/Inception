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

RUN mkdir /run/php

RUN apt-get install iputils-ping -y
RUN apt-get install vim -y


COPY tools/install.sh /home/
RUN chmod 755 /home/install.sh

EXPOSE 9000

ENTRYPOINT ["/home/install.sh" ] 