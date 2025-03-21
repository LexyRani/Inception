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
    wp config create --dbname=$BDD_NAME --dbuser=$BDD_USER --dbpass=$BDD_USER_PASSWORD --dbhost=$BDD_HOST --allow-root 
    sleep 5

    wp core install --url=aceralin.42.fr --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root  
    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_USER_ROLE --allow-root 
    echo "END" 
fi

/usr/sbin/php-fpm7.4 -F
