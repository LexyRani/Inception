#Image de base
FROM alpine:3.21.2

#Ajoute les dependances ou outils necessaires (commandes shell)
RUN apk update && apk upgrade && apk add --no-cache nginx
RUN apk add --no-cache nginx openssl

#expose des ports pour acceder au conteneur
EXPOSE 443

#copie des fichiers et repetoires dans l'image construite
COPY requirements/nginx/conf/nginx.conf /etc/nginx/http.d/nginx.conf

#Modifie les droits en permettant la lecture et l'execution des fichiers de configuration
RUN chmod -R 755 /etc/nginx/http.d/nginx.conf

#Creation d un repertoire pour stocker les certificats SSL utilises par NGINX
RUN mkdir -p /etc/nginx/SSL

#Generation de certificars SSL auto-signes
    #genere un certificat auto-signe au format X.509 avec une cle privee qui ne sera pas chiffree avec un mot de passe
    #out specifie le chemin ou sera sauvegardee le certificat
    #keyout: specifie le chemin ou sera sauvegardee la clee privee
    #subj : Fournit les informations necessaires pour generer le certificat
RUN openssl req -x509 - nodes\ 
    -out /etc/nginx/ssl/ssl_certif.crt\
    -keyout /etc/nginx/ssl/ssl_key.key\
    -subj "C=FR/ST=IDF/L=Paris/O=School/OU=42Paris/CN=aceralin.42.fr"

#Modifier les permissions pour le repertoire web
RUN chmod -R 755 /var/www/
#Change le proprietaire en nobody pour des raisons de securites ( utilisateur sans privilege)
RUN chmod -R nobody /var/www/

#commande a executer lors de la construction : 
CMD ["nginx", "-g","daemon off;"]