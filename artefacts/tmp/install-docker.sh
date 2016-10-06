#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING DOCKER                     *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Download and execute install script..."
curl --insecure -sSL https://get.docker.com/ | sh
echo " "

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***            DOCKER INSTALLATION COMPLETE              *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
