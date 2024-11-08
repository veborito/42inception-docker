#!/bin/bash

sleep 5

if [ -f "/var/www/wordpress/wp-config.php" ]
then
  echo "Wordpress already configured !"
else
  ./wp-cli.phar config create  --allow-root --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$(< $MARIADB_PASSWORD) --dbhost=mariadb:3306 --path='/var/www/wordpress'

  ./wp-cli.phar core install --allow-root --url=$DOMAIN --title=MyWordpressSite --admin_user=$WP_ADMIN_USER --admin_password=$(< $WP_ADMIN_PASS) --admin_email=$WP_ADMIN_EMAIL --path='/var/www/wordpress'

  ./wp-cli.phar user create --allow-root $WP_USER $WP_EMAIL --role=author --user_pass=$(< $WP_USER_PASS) --path='/var/www/wordpress'
fi

/usr/sbin/php-fpm8.2 -F
