#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING NODE 9                     *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Preparing .npmrc files..."
echo "registry = https://registry.npmjs.org/" >> /root/.npmrc

echo " * Removing old node_modules..."
rm -rf /usr/lib/node_modules

echo " * Downloading setup_9.sh script..."
curl -sL https://deb.nodesource.com/setup_9.x > /tmp/setup_9.sh

echo " * Running setup_9.sh script..."
bash /tmp/setup_9.sh

echo " * Running apt-get install nodejs..."
apt-get install -y \
    nodejs \
    ruby-full

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***            NODE 9 INSTALLATION COMPLETE              *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
