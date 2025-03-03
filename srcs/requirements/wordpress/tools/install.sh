#!/bin/sh

FILE=wordpress
cd /var/www/html

if [ -d "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE not exists." 
    mkdir -p wordpress
    cd wordpress/
    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root 
    
    sleep 5
    wp config create --dbname=$MDB_NAME --dbuser=$MDB_USER --dbpass=$MDB_USER_PASSWORD --dbhost=$MDB_HOST --allow-root 
    sleep 5

    wp core install --url=aceralin.42.fr --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root  
    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_USER_ROLE --allow-root 
    echo "END" 
fi

/usr/sbin/php-fpm7.4 -F


# Vérifie si WordPress est déjà installé (évite les installations multiples)
# Télécharge WP-CLI (outils en ligne de commande) pour gérer WordPress grace a curl -0 ""
# Installe WordPress et configure la base de données
# Crée un utilisateur administrateur et un utilisateur supplémentaire
# Démarre PHP-FPM pour que WordPress puisse fonctionner
