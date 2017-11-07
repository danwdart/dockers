FROM debian:jessie

ENV LC_ALL=en_GB.UTF-8

RUN apt update && \
apt -y install locales software-properties-common && \
locale-gen && \
apt-key adv --keyserver keyserver.quickbuild.io --recv-keys F5CFC95C && \
apt-add-repository -y "deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-r14.0.0/debian jessie main" && \
apt-add-repository -y "deb http://mirror.ppa.trinitydesktop.org/trinity/trinity-builddeps-r14.0.0/debian jessie main" && \
apt -y update && \
DEBIAN_FRONTEND=noninteractive apt -y install tdebase-trinity && \
rm -rf /var/lib/apt/lists /var/cache/apt/archives

CMD ["/opt/trinity/bin/starttde"]
