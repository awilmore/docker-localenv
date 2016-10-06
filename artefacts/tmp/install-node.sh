#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING NODE 6                     *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Preparing .npmrc files..."
echo "registry = https://registry.npmjs.org/" >> /root/.npmrc

echo " * Removing old node_modules..."
rm -rf /usr/lib/node_modules

echo " * Downloading setup_6.sh script..."
curl -sL https://deb.nodesource.com/setup_6.x > /tmp/setup_6.sh

echo " * Running setup_6.sh script..."
bash /tmp/setup_6.sh

echo " * Running apt-get install nodejs..."
apt-get install -y \
    nodejs \
    ruby-full

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***            NODE 6 INSTALLATION COMPLETE              *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
