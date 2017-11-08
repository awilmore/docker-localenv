#!/bin/sh

set -e

LOCALENV="awilmore/localenv"

if [ $# != 1 ]; then
  echo "usage: $0 container_name"
  exit 1
fi

NAME=$1

# Convert local path to container path
CPATH=$( echo $PWD | sed "s#${HOME}#/root#" )

echo " "
echo " *** Running $LOCALENV ..."

docker run -it \
  --privileged \
  --name $NAME \
  --hostname $NAME \
  -p 8000 \
  -p 8080 \
  -p 9000 \
  -v ${HOME}/git:/root/git \
  -v ${HOME}/work:/root/work \
  -v ${HOME}/sbin:/root/sbin \
  -v ${HOME}/.ssh_local_env:/root/.ssh \
  -v ${HOME}/go:/root/go \
  -v /tmp:/tmp \
  $LOCALENV \
  bash -c "cd ${CPATH} && /root/startup.sh"
