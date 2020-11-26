FROM dandart/tdebase

RUN apt -y update && \
    DEBIAN_FRONTEND=noninteractive apt -y install kubuntu-default-settings-trinity kubuntu-desktop-trinity && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives
