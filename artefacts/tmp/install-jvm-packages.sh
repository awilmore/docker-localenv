#!/bin/bash

set -e

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***                  INSTALLING JAVA 8                   *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "

echo " * Setting up jvm directory..."
mkdir -p /usr/lib/jvm

echo " * Installing java8..."
wget -nv -c -O /tmp/java8.tgz \
    --no-check-certificate \
    --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz && \
  mkdir -p /usr/lib/jvm && \
  tar -zxf /tmp/java8.tgz -C /usr/lib/jvm && \
  ln -s /usr/lib/jvm/jdk1.8* /usr/lib/jvm/java-8-oracle && \
  rm /tmp/java8.tgz

# Set java8 as default for command and JAVA_HOME
echo " * Configuring java8 as default jdk..."
update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/bin/java 1 && \
  update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-8-oracle/bin/javac 1 && \
  update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/java-8-oracle/bin/javaws 1 && \
  echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment && \
  echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/profile && \
  echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /root/.bashrc

echo " "
echo " ************************************************************ "
echo " ***                                                      *** "
echo " ***           JAVA 8 INSTALLATION COMPLETE               *** "
echo " ***                                                      *** "
echo " ************************************************************ "
echo " "
