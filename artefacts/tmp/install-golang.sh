#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING GO 1.8                     *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Adding ppa..."
add-apt-repository ppa:longsleep/golang-backports
echo " "

echo " * Updating apt..."
apt-get update 
echo " "

echo " * Installing go..."
apt-get install -y golang-go

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***            GO 1.8 INSTALLATION COMPLETE              *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
