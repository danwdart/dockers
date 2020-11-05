FROM haskell:8.6
WORKDIR /src
RUN git clone https://github.com/ghcjs/ghcjs.git --branch=ghc-8.6 --depth=1
WORKDIR /src/ghcjs
RUN git submodule update --init --recursive --depth=1
RUN apt update
RUN apt -y install python3 build-essential autoconf ca-certificates alex happy
RUN apt clean
WORKDIR /src/ghcjs
RUN ./utils/makePackages.sh
RUN stack upgrade
RUN stack install
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs
RUN ghcjs-boot