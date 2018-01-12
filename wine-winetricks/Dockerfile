FROM dandart/wine

USER root

RUN apt-get update && \
    apt-get -y install zenity && \
    apt-get clean

RUN wget -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
RUN chmod +x /usr/bin/winetricks

USER wine
