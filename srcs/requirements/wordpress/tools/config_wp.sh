#!/bin/sh

# while ! mariadb -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME &>/dev/null; do
#     echo test
#     sleep 5
# done
echo "Waiting for mysql"
sleep 5
mariadb -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME

if [ ! -f "wp-config.php" ]; then
    echo "Configuring wordpress"
	#intsall wordpress with wp-cli
    wp core download --allow-root
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_NAME --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root

fi

echo "Wordpress started on :9000"
exec /usr/sbin/php-fpm7.3 -F -R