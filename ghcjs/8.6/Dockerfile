FROM fpco/stack-build:lts-14.27
ENV STACK_ROOT=/home/stackage/.stack
WORKDIR /src
RUN git clone https://github.com/ghcjs/ghcjs.git --branch=ghc-8.6 --depth=1
WORKDIR /src/ghcjs
RUN git submodule update --init --recursive --depth=1
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
# RUN apt update
RUN apt -y install nodejs python3 build-essential autoconf ca-certificates alex happy
RUN apt clean
WORKDIR /src/ghcjs
RUN ./utils/makePackages.sh
RUN stack upgrade
RUN stack install
RUN ghcjs-boot
