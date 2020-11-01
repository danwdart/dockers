FROM haskell:8.6
WORKDIR /src
RUN git clone https://github.com/ghcjs/ghcjs.git --branch=ghc-8.8 --depth=1
WORKDIR /src/ghcjs
RUN git submodule update --init --recursive
RUN ./utils/makePackages.sh
RUN stack build
RUN ghcjs-boot