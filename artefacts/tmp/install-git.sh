#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING GIT 2.8                    *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Adding ppa..."
add-apt-repository ppa:git-core/ppa
echo " "

echo " * Updating apt..."
apt-get update 
echo " "

echo " * Installing git..."
apt-get install -y git

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***           GIT 2.8 INSTALLATION COMPLETE              *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
