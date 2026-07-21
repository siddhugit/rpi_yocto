FROM public.ecr.aws/ubuntu/ubuntu:24.04
	
	ENV container=docker
	
	# These variables are set in the build.sh script
	ARG MY_USER
	ARG MY_GROUP
	ARG MY_UID
	ARG MY_GID
	ARG MY_HOME
	
	RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y \
	gawk \
	wget \
	git-core \
	diffstat \
	unzip \
	texinfo \
	gcc-multilib \
	build-essential \
	chrpath \
	socat \
	cpio \
	file \
	python3 \
	python3-pip \
	python3-pexpect \
	python3-venv \
	debianutils \
	xz-utils \
	iputils-ping \
	python3-git \
	python3-jinja2 \
	libreadline-dev \
	libsdl1.2-dev \
	lz4 \
	zstd \
	xterm \
	python3-subunit \
	mesa-common-dev \
	locales \
	vim \
	curl \
	jq \
	pipx \
	flex \
	bison \
	libncurses5-dev \
	libncursesw5-dev \
	ncurses-term \
	sudo \
	tmux \
	&& rm -rf /var/lib/apt/lists/*
	
	# Ensure pipx is in the PATH
	ENV PIPX_HOME="/usr/local"
	ENV PIPX_BIN_DIR="/usr/local/bin"
	ENV PIPX_MAN_DIR="/usr/local/share/man"
	RUN pipx ensurepath
	
	# Install kas
	RUN pipx install kas
	
	# Yocto requires a locale to be set for builds
	RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
	ENV LANG=en_US.UTF-8a
	
	# Add local user to the image
	RUN groupadd -f --gid ${MY_GID} ${MY_GROUP} && \
	    useradd --uid ${MY_UID} --gid ${MY_GID} -d ${MY_HOME} -o -m ${MY_USER} && \
	    echo "${MY_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
	
	USER ${MY_USER}
	WORKDIR ${MY_HOME}