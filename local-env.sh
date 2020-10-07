#!/bin/sh

set -e

LOCALENV="awilmore/localenv:0.0.6"

if [ $# -lt 1 ]; then
  echo "usage: $0 container_name (ext_port int_port)";
  exit 1
fi

NAME=$1
EXT=$2
INT=$3

PORTS="-p 8000 -p 8080 -p 9000"

if [ ! -z "$EXT" ]; then
  PORTS="$PORTS -p $EXT:$INT"
fi

# Convert local path to container path
CPATH=$( echo $PWD | sed "s#${HOME}#/root#" )

echo " "
echo " *** Running $LOCALENV ..."

docker run -it \
  --privileged \
  --name $NAME \
  --hostname $NAME \
  $PORTS \
  -v ${HOME}/git:/root/git:cached \
  -v ${HOME}/work:/root/work:cached \
  -v ${HOME}/sbin:/root/sbin:cached \
  -v ${HOME}/.ssh_local_env:/root/.ssh:cached \
  -v ${HOME}/go:/root/go:cached \
  -v ${HOME}/.aws:/root/.aws:cached \
  -v ${HOME}/.kube:/root/.kube:cached \
  -v /tmp:/tmp:cached \
  $LOCALENV \
  bash -c "cd ${CPATH} && /root/startup.sh"
