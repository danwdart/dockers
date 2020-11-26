FROM dandart/xorg

ENV LC_ALL=en_GB.UTF-8

RUN apt update && \
    apt -y install locales software-properties-common wget && \
    locale-gen && \
    wget http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-keyring.deb && \
    dpkg -i trinity-keyring.deb && \
    apt-add-repository -y "deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-sb groovy deps-r14 main-r14" && \
    apt -y update && \
    DEBIAN_FRONTEND=noninteractive apt -y install tdebase-trinity && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

CMD ["/opt/trinity/bin/starttde"]
