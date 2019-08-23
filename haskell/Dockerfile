FROM ubuntu:latest

# Prerequisites
RUN apt update && \
    apt -y install curl ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs git git-man gnu-efi less libcurl3-gnutls libedit2 liberror-perl libffi-dev libssl1.0.0 libxext6 libxmuu1 openssh-client xauth libgmp-dev libgd-dev libpq-dev default-libmysqlclient-dev libsqlite3-dev libmongo-client-dev libssl-dev libavahi-compat-libdnssd-dev build-essential autoconf libncurses-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# ghcup
RUN mkdir -p ~/.ghcup/bin && \
    curl https://gitlab.haskell.org/haskell/ghcup/raw/master/ghcup > ~/.ghcup/bin/ghcup && \
    chmod +x ~/.ghcup/bin/ghcup

ENV PATH=/root/.cabal/bin:/root/.ghcup/bin:/root/.local/bin:$PATH

# GHC
RUN ghcup install
RUN ghcup set

# Cabal
RUN ghcup install-cabal
RUN cabal new-update
RUN cabal new-install cabal-install

# Stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# More and prerequisites for GHCJS
RUN stack install ghcid hlint alex happy hoogle

# GHCJS
RUN git clone --branch ghc-8.6 https://github.com/ghcjs/ghcjs.git
WORKDIR /ghcjs
RUN git submodule update --init --recursive
RUN ./utils/makePackages.sh
RUN stack build
RUN stack install
RUN ghcjs-boot
RUN cabal new-sdist

WORKDIR /