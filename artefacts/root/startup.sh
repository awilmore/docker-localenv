#!/bin/bash

set -e

# Start docker first
echo "Starting docker..."
sleep 1
service docker start
sleep 1

# Check docker
DOCKERCHECK=$( docker ps )

if [ -z "$DOCKERCHECK" ]; then
  echo "error: could not start docker."
  echo "Aborting."
  exit 1
fi

# Launch bash
echo
echo "Starting bash..."
echo

bash
