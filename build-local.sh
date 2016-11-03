#!/bin/sh

set -e

# Source values from application.conf
CURR_DIR=$( dirname $0 )
. "${CURR_DIR}/application.conf"

NO_CACHE_PARAM_=""

# Check for command-line flag to do full build
if [ ! -z "$1" ]; then
  echo " "
  echo "Pulling base image $DOCKER_IMAGE_BASE ..."
  docker pull $DOCKER_IMAGE_BASE
  echo "Done. "
  NO_CACHE_PARAM="--no-cache=true"
fi

echo " "
echo "Building $DOCKER_IMAGE_NAME ... "
docker build $NO_CACHE_PARAM -t="$DOCKER_IMAGE_NAME" .
echo " "
echo "Done."
