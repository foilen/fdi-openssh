#!/bin/bash

set -e

RUN_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $RUN_PATH

echo ----[ Upload docker image ]----
DOCKER_IMAGE=fdi-openssh
DOCKER_IMAGE_VERSION=fdi-openssh:$VERSION
docker login
docker tag $DOCKER_IMAGE_VERSION foilen/$DOCKER_IMAGE_VERSION
docker tag $DOCKER_IMAGE_VERSION foilen/$DOCKER_IMAGE:latest
docker push foilen/$DOCKER_IMAGE_VERSION
docker push foilen/$DOCKER_IMAGE:latest
