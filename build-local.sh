#!/bin/sh

set -e

# Source env vars
source .env

# Check for command-line flag to do full build
if [ ! -z "$1" ]; then
  echo " "
  echo "Pulling base image $DOCKER_IMAGE_BASE ..."
  docker pull $DOCKER_IMAGE_BASE
  echo "Done. "
fi

echo " "
echo "Building $DOCKER_IMAGE_NAME ... "
docker-compose build localenv
echo " "
echo "Done."
