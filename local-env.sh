#!/bin/sh

set -e

if [ $# != 1 ]; then
  echo "usage: $0 purpose"
  exit 1
fi

NAME=$1

BUILD_IMAGE_NAME="repo.skyops.io/localenv:latest"

# Convert local path to container path
CPATH=$( echo $PWD | sed 's/Users\/adam/root/' )

echo " "
echo " *** Running $BUILD_IMAGE_NAME ..."
docker run -it \
  --name $NAME \
  --hostname $NAME \
  -p 8000 \
  -p 8080 \
  -p 9000 \
  -v /Users/adam/git:/root/git \
  -v /Users/adam/work:/root/work \
  -v /Users/adam/.ssh:/root/.ssh \
  -v /Users/adam/sbin:/root/sbin \
  -v /Users/adam/go:/root/go \
  -v /tmp:/tmp \
  $BUILD_IMAGE_NAME \
  bash -c "cd ${CPATH} && bash"
