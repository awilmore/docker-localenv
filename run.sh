#!/bin/sh

set -e

LOCALENV="awilmore/localenv"

if [ $# -lt 1 ]; then
  echo "usage: $0 container_name mount_host_paths_flag"
  echo "   eg: $0 frontend 1"
  exit 1
fi

NAME=$1
FLAG=$2

# Convert local path to container path
CPATH=$( echo $PWD | sed "s#${HOME}#/root#" )

echo " "
echo " *** Running $LOCALENV ..."

if [ -z "$FLAG" ]; then
  # Run simple container
  docker run -it \
    --privileged \
    --name $NAME \
    --hostname $NAME \
    -p 8000 \
    -p 8080 \
    -p 9000 \
    -v /tmp:/tmp \
    $LOCALENV \
    bash -c "/root/startup.sh"
else
  # Run with mounts, start in corresponding starting directory
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
fi
