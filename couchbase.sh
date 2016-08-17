#!/usr/bin/env bash

# http://developer.couchbase.com/documentation/server/current/sdk/php/start-using-sdk.html

set -e

mkdir -p /tmp/couchbase
cd /tmp/couchbase

wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-2-amd64.deb
sudo dpkg -i couchbase-release-1.0-2-amd64.deb
# Will install or upgrade packages
sudo apt-get update
sudo apt-get install libcouchbase-dev build-essential php-dev
sudo pecl install couchbase

echo 'extension=couchbase.so' | sudo tee /etc/php/7.0/mods-available/couchbase.ini
sudo ln -s /etc/php/7.0/mods-available/couchbase.ini /etc/php/7.0/cli/conf.d/20-couchbase.ini
