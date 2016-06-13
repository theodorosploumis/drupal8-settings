### Drupal 8.x custom settings files

## About

A collection of Drupal settings related files to use within your settings.php.

This script is making a project structure like this:

```
PARENT/
  // Configuration folders
  config/
  // Public files
  files/
  // Custom settings (this repo)
  settings/
  // Drupal files
  your-drupal-folder/

```

## Requirements

- Apache2
- (drush)
- git
- bash (or sh)

## Usage

1) Clone this repo out of your Drupal root into folder "settings"

```
git clone git@github.com:theodorosploumis/drupal8-settings.git settings

```

2) Initially, run the script. By default you will get a local (dev) environment (no cache, free update access etc)

```
(sudo) bash settings/enable-settings.sh

```

3) To enable live/local mode you need to change variable $mode on settings.php. For example run:

```
(sudo) sed -i "s|\$mode = 'local'|\$mode = 'live'|" PATH/TO/sites/default/settings.php

```
