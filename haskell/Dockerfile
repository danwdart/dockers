FROM ubuntu:latest

# Prerequisites
RUN apt update && \
    apt -y full-upgrade && \
    apt -y install curl ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt install -y software-properties-common
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get install -y nodejs \
    git \
    git-man \
    gnu-efi \
    less \
    libcurl3-gnutls \
    libedit2 \
    liberror-perl \
    libffi-dev \
    libssl1.0.0 \
    libxext6 \
    libxmuu1 \
    openssh-client \
    xauth \
    libgmp-dev \
    libgd-dev \
    libpq-dev \
    default-libmysqlclient-dev \
    libsqlite3-dev \
    libmongo-client-dev \
    libssl-dev \
    libavahi-compat-libdnssd-dev \
    build-essential \
    autoconf \
    libncurses-dev \
    locales \
    mingw-w64 \
    liblapack-dev \
    libbluetooth-dev \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    docker-ce \
    docker-ce-cli \
    containerd.io && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Locale setup
RUN sed -i 's/# en_GB.UTF-8/en_GB.UTF-8/' /etc/locale.gen
RUN locale-gen
ENV LANG=en_GB.UTF-8
ENV LANGUAGE=en_GB.UTF-8
ENV LC_ALL=en_GB.UTF-8

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

# This is a separate step because it could fail
RUN stack --system-ghc update

# Prerequisites for GHCJS
# Warning: this step takes frickin' ages!
RUN stack --system-ghc install \
    alex \
    happy \
    --no-run-tests --no-rerun-tests

# GHCJS
RUN git clone --branch ghc-8.6 https://github.com/ghcjs/ghcjs.git
WORKDIR /ghcjs
RUN git submodule update --init --recursive
RUN ./utils/makePackages.sh
RUN stack --system-ghc build
RUN stack --system-ghc install
RUN ghcjs-boot
RUN cabal new-sdist


# More
# Separated for rebuild caching
# Warning: this step takes frickin' ages!
RUN stack --system-ghc install \
    haskell-src-exts-1.21.0 \
    apply-refact \
    ghcid \
    hlint \
    hoogle \
    intero \
    stylish-haskell \
    --no-run-tests --no-rerun-tests

WORKDIR /