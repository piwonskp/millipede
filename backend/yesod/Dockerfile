FROM haskell

RUN apt update && apt install -y build-essential xz-utils

RUN apt-get install -y curl && \
curl -sSL https://get.haskellstack.org/ | sh -s - -f && \
apt-get purge -y --auto-remove curl

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN stack install yesod-bin --install-ghc
RUN stack build
