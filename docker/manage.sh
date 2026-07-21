#!/bin/sh
	
TAGNAME=$1

if [ -z "$TAGNAME" ]; then
    echo "Must spcify tag name"
    echo "Usage: $0 <image tag>"
    exit 1
fi

cd $(dirname $0)

docker build --network=host -t $TAGNAME --pull --no-cache \
    --build-arg MY_USER=$(id -un) \
    --build-arg MY_GROUP=$(id -gn) \
    --build-arg MY_UID=$(id -u) \
    --build-arg MY_GID=$(id -g) \
    --build-arg MY_HOME=$HOME \
    .