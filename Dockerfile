FROM ubuntu:20.04
MAINTAINER Adam Wilmore adam.wilmore@gmail.com

###
# INSTALL SOFTWARE
###

# Get packages first, including locales
#COPY artefacts/etc/apt/sources.list.au /etc/apt/sources.list 

RUN apt-get update && \
    apt-get upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" \
    TZ="Australia/Sydney" \
    apt-get install -y \
      software-properties-common \
      apt-transport-https \
      build-essential \
      bash-completion \
      openssh-client \
      iputils-ping \
      libjson-perl \
      python3-pip \
      net-tools \
      dnsutils \
      ack-grep \
      apparmor \
      locales \
      python3 \
      netcat \
      unzip \
      htop \
      curl \
      wget \
      less \
      zip \
      vim \
      jq

# Set TZ and Locale stuff
RUN locale-gen en_US en_US.UTF-8 en_AU en_AU.UTF-8 && \
  dpkg-reconfigure locales

# Install go
COPY artefacts/tmp/install-golang.sh /tmp/install-golang.sh
RUN /tmp/install-golang.sh

# Install git
COPY artefacts/tmp/install-git.sh /tmp/install-git.sh
RUN /tmp/install-git.sh

# Install docker
COPY artefacts/tmp/install-docker.sh /tmp/install-docker.sh
RUN /tmp/install-docker.sh

# Install kubectl
COPY artefacts/tmp/install-kubectl.sh /tmp/install-kubectl.sh
RUN /tmp/install-kubectl.sh

# Install rancher tools
#COPY artefacts/tmp/install-rancher-tools.sh /tmp/install-rancher-tools.sh
#RUN /tmp/install-rancher-tools.sh

# Install node
#COPY artefacts/tmp/install-node.sh /tmp/install-node.sh
#RUN /tmp/install-node.sh
#COPY artefacts/tmp/install-node-tools.sh /tmp/install-node-tools.sh
#RUN /tmp/install-node-tools.sh

## Install gem tools
#COPY artefacts/tmp/install-gem-tools.sh /tmp/install-gem-tools.sh
#RUN /tmp/install-gem-tools.sh

# Install java
#COPY artefacts/tmp/install-jvm-packages.sh /tmp/install-jvm-packages.sh
#RUN /tmp/install-jvm-packages.sh

# Install latest python3
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && \
    apt-get install -y python3.8

# Install latest python3 packages
RUN pip3 install --upgrade pip awscli==1.18.154 && \
    pip3 install --user boto3 pyyaml jinja2


###
# CONFIGURE
###

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

# Required for python3 terminal unicode issue
ENV PYTHONIOENCODING UTF-8

# Container initialiser
CMD /root/startup.sh
