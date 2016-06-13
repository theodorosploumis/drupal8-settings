#!/usr/bin/env bash

SCRIPT_DIR="$(dirname $0)"

# Get Drupal root
echo -n "Enter Drupal root absolute path (current: $(pwd)): "
read -r DRUPAL_ROOT

if [[ -z "${DRUPAL_ROOT}" ]]
then
  echo -n "No Drupal root provided, abording.\n"
  exit;
fi

# Get Development mode
echo -n "Enter development mode (local/live): "
read -r MODE

if [[ -z "${MODE}" ]]
then
  echo -n "No mode provided, using local.\n"
  exit;
fi

chmod 777 "${DRUPAL_ROOT}"/sites/default
chmod 777 "${DRUPAL_ROOT}"/sites/default/settings.php

cat "${SCRIPT_DIR}"/add-to-settings.txt  >> "${DRUPAL_ROOT}"/sites/default/settings.php

sudo sed -i "s|SETTINGS_DIR|${SCRIPT_DIR}|g" "${DRUPAL_ROOT}"/sites/default/settings.php

chmod 444 "${DRUPAL_ROOT}"/sites/default/settings.php
chmod 755 "${DRUPAL_ROOT}"/sites/default


# Config files manipulations
mkdir -p "${DRUPAL_ROOT}"/../config/staging/
mkdir -p "${DRUPAL_ROOT}"/../config/sync/
chmod 755 -R "${DRUPAL_ROOT}"/../config/
chown -R www-data:www-data "${DRUPAL_ROOT}"/../config/

# Public files manipulations
mkdir "${DRUPAL_ROOT}"/../files
chown www-data:www-data -R "${DRUPAL_ROOT}"/sites/default/files
chown www-data:www-data -R "${DRUPAL_ROOT}"/../files

cd ${DRUPAL_ROOT} && drush cr
