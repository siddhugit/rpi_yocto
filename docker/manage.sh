#!/bin/bash
	
	COMMAND=$1
	EXEC=$2
	
	TAGNAME="jw_yocto"
	
	# Function to build the Docker image
	docker_image() {
	    echo "Building the Docker image $TAGNAME"
	    cd $(dirname $0)
	    docker build --network=host -t "$TAGNAME" \
	        --build-arg MY_USER=$(id -un) \
		    --build-arg MY_GROUP=$(id -gn) \
		    --build-arg MY_UID=$(id -u) \
		    --build-arg MY_GID=$(id -g) \
		    --build-arg MY_HOME=$HOME \
	        .
	    if [[ $? -ne 0 ]]; then
	        echo "Docker image build unsuccessful"
	    else
	        echo "Docker image built successfully."
	    fi
	}
	
	# Function to run the Docker container
	docker_run() {
	    echo "Running Docker container ....."
	    docker run --rm -it --network=host -u $(id -u):$(id -g) -v $HOME:$HOME -v /workplace:/workplace --workdir $(pwd) "$TAGNAME"
	}
	
	docker_exec() {
	    DOCKER_COMMAND=$EXEC
	    echo "Running \"$DOCKER_COMMAND\" in Docker container ....."
	    docker run --rm --network=host -u $(id -u):$(id -g) -v $HOME:$HOME -v /workplace:/workplace --workdir $(pwd) "$TAGNAME" /bin/sh -c "$DOCKER_COMMAND"
	}
	
	case "$COMMAND" in
	    build)  
	        docker_image ;;
	    exec)
	        docker_exec ;;
	    run)
	        docker_run ;;
	    *) echo "Usage: {build|exec|run} <image_tag> " && exit 1 ;;
	esac