# This doesn't work due to a PIC error
FROM alpine as build
WORKDIR /wine
RUN apk add bison ccache cups-dev dbus-dev flex fontconfig-dev freeglut-dev freetype-dev gcc g++ git glib-dev \
    glu-dev gnutls-dev gsm-dev gst-plugins-base-dev gstreamer-dev jpeg-dev \
    krb5-dev lcms2-dev libgphoto2-dev libpcap-dev libx11-dev libxcomposite-dev libxcursor-dev \
    libxfixes-dev libxi-dev libxinerama-dev libxml2-dev libxrandr-dev \
    libxshmfence-dev libxslt-dev libxxf86vm-dev make mesa-dev mesa-osmesa \
    mingw-w64-gcc mpg123-dev ncurses-dev openal-soft-dev opencl-icd-loader-dev openldap-dev \
    pulseaudio-dev sane-dev sdl2-dev tiff-dev v4l-utils-dev vkd3d-dev vulkan-loader-dev && \
    git clone git://source.winehq.org/git/wine.git --depth=1 --branch wine-5.5 && \
    cd wine && \
    ./configure --enable-win64 --options --disable-tests --prefix=/usr && \
    CC="ccache gcc" \
    CFLAGS="-m64 -fPIC -fPIE -static" \
    CROSSCFLAGS="-m64 -fPIC -fPIE -static" \
    CPPFLAGS="-m64 -fPIC -fPIE -static" \
    LDFLAGS="-fPIC -fPIE -static" \
    make -j16 && \
    make install

FROM build
    COPY /usr/share /usr
    COPY /usr/lib /usr
    COPY /usr/bin /usr

RUN useradd -ms /bin/bash wine

USER wine
ENTRYPOINT [ "wine" ]