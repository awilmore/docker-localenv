#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                INSTALLING KUBECTL                    *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

# Download binary
echo " * Download and execute install script..."
curl -s -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

# Make executable
chmod +x ./kubectl

# Move to PATH
mv ./kubectl /usr/local/bin/kubectl

# Display version
kubectl version --client

echo " "

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***            KUBECTL INSTALLATION COMPLETE             *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
