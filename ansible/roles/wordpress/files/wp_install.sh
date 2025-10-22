#!/bin/bash
set -eo pipefail

echo "Starting WordPress installation script..."

required_vars=("WP_ADMIN_PASSWORD" "WP_ADMIN_USERNAME" "WP_ADMIN_EMAIL" "WP_USER_USERNAME"
                "WP_USER_PASSWORD" "WP_USER_EMAIL" "WP_TITLE" "MARIADB_DATABASE"
                "MARIADB_USER" "MARIADB_USER_PASSWORD" "MARIADB_HOST" "MARIADB_PORT"
                "WEBSITE_URL" "WP_BACKEND_USER" "WP_BACKEND_GROUP" "WP_PATH")

for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "Undefined var: $var" >&2
        exit 1
    fi
    echo "$var is set to '${!var}'"
done

run_as__wp_user() {
    su -s /bin/bash -c "$*" $WP_BACKEND_USER
}

if [ ! -f $WP_PATH/wp-settings.php ]; then
    echo "Download WordPress core files"
    run_as__wp_user "wp core download --path=$WP_PATH"
fi

sleep 5

if [ ! -f $WP_PATH/wp-config.php ]; then
    echo "Creating wp-config.php"
    run_as__wp_user "wp config create \
        --path=$WP_PATH \
        --dbname=\"$MARIADB_DATABASE\" \
        --dbuser=\"$MARIADB_USER\" \
        --dbpass=\"$MARIADB_USER_PASSWORD\" \
        --dbhost=\"$MARIADB_HOST:$MARIADB_PORT\""

    echo "Install wordpress"
    run_as__wp_user "wp core install \
        --path=$WP_PATH \
        --url=\"$WEBSITE_URL\" \
        --title=\"$WP_TITLE\" \
        --admin_user=\"$WP_ADMIN_USERNAME\" \
        --admin_password=\"$WP_ADMIN_PASSWORD\" \
        --admin_email=\"$WP_ADMIN_EMAIL\" \
        --skip-email"

    echo "Creating additional user"
    run_as__wp_user "wp user create \
        --path=$WP_PATH \
        \"$WP_USER_USERNAME\" \
        \"$WP_USER_EMAIL\" \
        --role=author \
        --user_pass=\"$WP_USER_PASSWORD\""

    echo "Updating plugins and themes"
    run_as__wp_user "wp plugin update --all --path=$WP_PATH"
    run_as__wp_user "wp theme update --all --path=$WP_PATH"
fi

chown -R $WP_BACKEND_USER:$WP_BACKEND_GROUP $WP_PATH
find $WP_PATH -type d -exec chmod 755 {} \;
find $WP_PATH -type f -exec chmod 644 {} \;
chmod 600 $WP_PATH/wp-config.php

# Create marker file to indicate configuration is complete
touch $WP_PATH/.configured

echo "Configuration completed successfully"