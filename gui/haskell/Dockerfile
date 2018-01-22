# Dockerfile containing newest stack for haskell & gtk libs 
## Dockerfile for a haskell environment
FROM       debian:stretch

## ensure locale is set during build
ENV LANG            C.UTF-8

RUN apt update && apt install -y gnupg

RUN echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' > /etc/apt/sources.list.d/ghc.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 && \
    apt-get update && \
    apt-get install -y --no-install-recommends cabal-install-2.0 ghc-8.2.1 happy-1.19.5 alex-3.1.7 \
            zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev ca-certificates g++ git

ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/2.0/bin:/opt/ghc/8.2.1/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.7/bin:$PATH

## run ghci by default unless a command is specified
CMD ["ghci"]

# Install newest stack
RUN apt-get install -y curl && \
    curl -sSL https://get.haskellstack.org/ | sh && \
    apt-get purge -y --auto-remove curl

RUN apt install --assume-yes libgirepository1.0-dev libwebkit2gtk-4.0-dev libgtksourceview-3.0-dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app/haskell

COPY . /usr/src/app

RUN stack install --allow-different-user
RUN stack build --allow-different-user
