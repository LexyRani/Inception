FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt-get install nginx -y

RUN apt-get install vim -y    

RUN apt-get install curl -y

RUN mkdir -p /etc/nginx/ssl && chmod -R 755 /etc/nginx/ssl

RUN apt-get install openssl -y

RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/nginx/ssl/inception.key \
            -out /etc/nginx/ssl/inception.crt \
            -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42Paris/CN=aceralin.42.fr/UID=aceralin'


RUN mkdir -p /var/run/nginx

COPY ./conf/default /etc/nginx/sites-available/default


RUN chmod 755 /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]