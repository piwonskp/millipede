FROM elixir

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN mix local.hex --force
RUN mix deps.get

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs

# Unicode characters in output causes docker-compose to fail so we redirect it to /dev/null
RUN cd assets && \
    npm install 2> /dev/null

RUN cd assets && \
    node node_modules/brunch/bin/brunch build
