FROM debian:jessie

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt -y install xserver-xorg && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

CMD ["startx"]
