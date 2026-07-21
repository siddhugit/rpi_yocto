#!/bin/sh
	
DOCKER_IMAGE=$1

if [ -z "$DOCKER_IMAGE" ]; then
    echo "Must spcify docker image"
    echo "Usage: $0 <image>"
fi

docker run --network=host --rm -it -u $(id -u):$(id -g) -v /workplace:/workplace -v $HOME:$HOME --workdir $(pwd) $DOCKER_IMAGE