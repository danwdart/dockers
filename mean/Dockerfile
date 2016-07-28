FROM ubuntu:latest
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git curl mongodb-server apache2
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN service apache2 restart
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs build-essential
