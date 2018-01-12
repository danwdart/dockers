FROM ubuntu

RUN dpkg --add-architecture i386
RUN apt-get update && \
    apt-get -y install wget software-properties-common apt-transport-https
RUN wget -O- https://dl.winehq.org/wine-builds/Release.key | apt-key add -
RUN apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
RUN apt-get update && \
    apt-get -y install --install-recommends winehq-staging && \
    apt-get clean

RUN useradd -ms /bin/bash wine

USER wine
WORKDIR /home/wine
CMD ["wine"]
