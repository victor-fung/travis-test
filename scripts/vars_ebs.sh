#!/bin/bash

#
# Contains variables used by other scripts.
#

IMAGE_NAME="touchcast/docker-nginx-php7"
WEB_CONTAINER_ID=$(docker ps | grep ${IMAGE_NAME} | cut -d" " -f1)

WEB_CONTAINER_PROJECT_DIR="/var/www/html"

SITE_INSTALLATION_CMD="drush si config_installer --account-name=admin --account-pass=password --account-mail=admin@example.com --site-mail=admin@example.com --site-name='Drupal 8' -y && drush cr"
