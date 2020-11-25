FROM ubuntu:devel

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install wget software-properties-common apt-transport-https && \
    wget -O- https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
    apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/ eoan main' && \
    apt-get update && \
    apt-get -y install --install-recommends winehq-staging && \
    apt-get clean

RUN useradd -ms /bin/bash wine

USER wine
WORKDIR /home/wine
CMD ["wine"]
