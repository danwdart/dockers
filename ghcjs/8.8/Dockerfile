FROM haskell:8.8
RUN apt update
RUN apt -y install python
RUN apt clean
WORKDIR /src
RUN git clone https://github.com/emscripten-core/emsdk.git --depth=1
WORKDIR /src/emsdk
RUN ./emsdk install latest
RUN ./emsdk activate latest
SHELL ["/bin/bash", "-c"]
RUN source ./emsdk_env.sh
RUN git clone https://github.com/ghcjs/ghcjs.git --branch=ghc-8.8 --depth=1
WORKDIR /src/ghcjs
RUN git submodule update --init --recursive
RUN stack --system-ghc --skip-ghc-check install --local-bin-dir=inplace/bin
RUN ./inplace/bin/ghcjs-boot -s ./lib/boot