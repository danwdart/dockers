FROM ubuntu:latest
ENV LC_ALL=en_GB.UTF-8
ENV LANG=en_GB.UTF-8
RUN locale-gen en_GB.UTF-8
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:ondrej/php
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libapache2-mod-php apache2 php php-mysql mysql-server php-cli php-mcrypt php-curl git
