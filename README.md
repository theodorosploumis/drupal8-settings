### Drupal 8.x custom settings files

## About

A collection of Drupal settings related files to use within your settings.php.


## Usage

```
// On a fresh Drupal installation
// go to the drupal root folder
cd [drupal-root]

// Clone this repo
git clone git@github.com:theodorosploumis/drupal8-settigns.git settings

// Allow the project settings.php file to be editable
chmod 777 /path/to/settings.php

// Append the settings.local.php file to the site settings.php
cat settings/add-to-settings.txt >> sites/default/settings.php

// Reset the settings.php file permissions
chmod 444 /path/to/settings.php

// Clear Drupal caches
drush cr

```