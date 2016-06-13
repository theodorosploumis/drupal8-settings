#!/usr/bin/env bash

DIR=$(dirname -- "$(readlink -e -- "$BASH_SOURCE")")

# User input
echo -n "Enter Drupal root absolute path:"
read -r DRUPAL_ROOT

if [[ -z "${DRUPAL_ROOT}" ]]
then
  echo -n "No Drupal root provided, abording.\n"
  exit;
fi

chmod 777 "${DRUPAL_ROOT}"/sites/default
chmod 777 "${DRUPAL_ROOT}"/sites/default/settings.php

cat add-to-settings.txt >> "${DRUPAL_ROOT}"/sites/default/settings.php

chmod 444 "${DRUPAL_ROOT}"/sites/default/settings.php
chmod 755 "${DRUPAL_ROOT}"/sites/default


# Config files manipulations
mkdir -p "${DIR}"../config/staging/
mkdir -p "${DIR}"../config/sync/
chmod 755 -R "${DIR}"../config/
chown -R www-data:www-data "${DIR}"../config/

# Public files manipulations
mkdir "${DIR}"/../files
chown www-data:www-data -R "${DRUPAL_ROOT}"/sites/default/files
chown www-data:www-data -R "${DIR}"/../files
