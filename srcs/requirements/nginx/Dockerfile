# Base de l'image
FROM debian:bullseye                            

# Mise à jour, mise a niveau et installation des paquets nécessaires
RUN apt update -y && apt upgrade -y

# Installation des logiciels essentiels:
    # Nginx (Serveur web)
    # Vim (editeur de texte)
    # Curl (outil de requetes HTTP)
    # OpenSSL (gestion des certificats SSL/TLS)
RUN apt-get install nginx -y

RUN apt-get install vim -y    

RUN apt-get install curl -y

RUN apt-get install openssl -y

# Creation du dossier SSL pour Nginx et Attribution des droits pour permettre l'acces aux fichiers
RUN mkdir -p /etc/nginx/ssl && chmod -R 755 /etc/nginx/ssl

# Generation du certificat SSL auto-signe valable 365 jours avec une cle RSA 2048 qui remplie automatiquement les informations du certificats
# Utile pour activer le HPPTS dans le serveur Nginx 
RUN openssl req \ 
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/nginx/ssl/inception.key \
            -out /etc/nginx/ssl/inception.crt \
            -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42Paris/CN=aceralin.42.fr/UID=aceralin'

# Création du dossier nécessaire au bon fonctionnement de Nginx.
RUN mkdir -p /var/run/nginx

COPY ./conf/default /etc/nginx/sites-available/default

# Ce fichier définit la manière dont Nginx va servir les requêtes
# Si d'autres services interagissent avec ce dossier, 
# ils peuvent lire et exécuter, mais pas modifier. 
RUN chmod 755 /var/www/html

# Lance le serveur web Nginx en mode "daemon off" pour qu'il s'exécute au premier plan
# et ne se termine pas immédiatement après le démarrage du conteneur
ENTRYPOINT ["nginx", "-g", "daemon off;"]