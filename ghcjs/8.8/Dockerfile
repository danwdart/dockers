FROM haskell:8.8
# RUN apt update
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
# RUN apt update
RUN apt -y install nodejs python
RUN apt clean
WORKDIR /src
RUN git clone https://github.com/emscripten-core/emsdk.git --depth=1
WORKDIR /src/emsdk
RUN ./emsdk install latest
RUN ./emsdk activate latest
SHELL ["/bin/bash", "-c"]
RUN source ./emsdk_env.sh
WORKDIR /src
RUN git clone https://github.com/ghcjs/ghcjs.git --branch=ghc-8.8 --depth=1
WORKDIR /src/ghcjs
RUN git submodule update --init --recursive --depth=1 || echo "Never mind"
WORKDIR /src/ghcjs/ghc
RUN git submodule add -f -b ghc-8.10 https://gitlab.haskell.org/ghc/packages/array.git libraries/array
RUN git submodule add -f -b master https://gitlab.haskell.org/ghc/packages/parallel.git libraries/parallel
RUN git submodule add -f -b ghc-8.8 https://gitlab.haskell.org/ghc/haddock.git utils/haddock
WORKDIR /src/ghcjs
RUN git submodule update --init --recursive --depth=1
RUN stack upgrade
RUN stack setup
RUN stack install
RUN ghcjs-boot -s ./lib/boot