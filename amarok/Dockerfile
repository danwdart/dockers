FROM ubuntu:devel
RUN apt update && \
    apt install -y amarok && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
ENV QT_X11_NO_MITSHM=1
CMD ["dbus-launch", "amarok"]