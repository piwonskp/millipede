FROM python:stretch

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt update
RUN apt install --assume-yes libgtk-3-dev python3-gi

COPY . /usr/src/app

ENV PYTHONPATH=${PYTHONPATH}:/usr/local/lib/python3.6/site-packages
RUN python3.5 /usr/local/bin/pip install -r requirements.txt
