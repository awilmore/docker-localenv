#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING NODE TOOLS                 *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Installing grunt, gulp, bower, etc. ..."
npm install -g grunt-cli gulp bower node-gyp http-server
echo " "

echo " * Linking grunt to /usr/local/bin..."
ln -s /usr/bin/grunt /usr/local/bin/grunt

echo " * Linking gulp to /usr/local/bin..."
ln -s /usr/bin/gulp /usr/local/bin/gulp

echo " * Linking bower to /usr/local/bin..."
ln -s /usr/bin/bower /usr/local/bin/bower

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***          NODE TOOLS INSTALLATION COMPLETE            *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
