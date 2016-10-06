FROM ubuntu:16.04
MAINTAINER Adam Wilmore adam.wilmore@gmail.com

###
# INSTALL SOFTWARE
###

# Get packages first, including locales
COPY artefacts/etc/apt/sources.list /etc/apt/sources.list 

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      software-properties-common \
      apt-transport-https \
      build-essential \
      bash-completion \
      openssh-client \
      iputils-ping \
      libjson-perl \
      net-tools \
      dnsutils \
      ack-grep \
      apparmor \
      locales \
      python \
      netcat \
      unzip \
      htop \
      curl \
      wget \
      less \
      zip \
      vim 

# Set TZ and Locale stuff
RUN cp -p /usr/share/zoneinfo/Australia/Sydney /etc/localtime && \
  locale-gen en_US en_US.UTF-8 en_AU en_AU.UTF-8 && \
  dpkg-reconfigure locales

# Install git
COPY artefacts/tmp/install-git.sh /tmp/install-git.sh
RUN /tmp/install-git.sh

# Install node
COPY artefacts/tmp/install-node.sh /tmp/install-node.sh
RUN /tmp/install-node.sh
COPY artefacts/tmp/install-node-tools.sh /tmp/install-node-tools.sh
RUN /tmp/install-node-tools.sh

# Install gem tools
COPY artefacts/tmp/install-gem-tools.sh /tmp/install-gem-tools.sh
RUN /tmp/install-gem-tools.sh

# Install docker
COPY artefacts/tmp/install-docker.sh /tmp/install-docker.sh
RUN /tmp/install-docker.sh

# Install rancher tools
COPY artefacts/tmp/install-rancher-tools.sh /tmp/install-rancher-tools.sh
RUN /tmp/install-rancher-tools.sh

# Install java
COPY artefacts/tmp/install-jvm-packages.sh /tmp/install-jvm-packages.sh
RUN /tmp/install-jvm-packages.sh

# Prepare useful env vars
COPY artefacts/tmp/prepare-env.sh /tmp/prepare-env.sh
RUN /tmp/prepare-env.sh

# Copy remaining artefacts
COPY artefacts/ /

# Update config
RUN cat /tmp/bashrc-additions.txt >> /root/.bashrc

# Clean up
RUN rm -rf /tmp/* && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

# Default work dir
WORKDIR /root/git

# Container initialiser
CMD bash
