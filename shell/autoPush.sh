#!/bin/sh
# 30 */4 * * * sh /Applications/acquia-drupal/python/cs/torrent/autoPush.sh

# Go to 'downloads'
cd /Applications/acquia-drupal/python/cs/torrent/downloads

# Git: add and commit changes
git pull
git add .
git commit -am "Add torrents on `date`"

# Send data to Github
git push

