FROM ubuntu:14.04

MAINTAINER Igor Churmeev <ingvarch@gmail.com>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV GRAPHITE_API_CONFIG /opt/graphite/conf/graphite-api.yml

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y build-essential python-dev libffi-dev libcairo2-dev python-pip

RUN pip install graphite-api gunicorn

COPY conf/ /opt/graphite/conf/

VOLUME /opt/graphite/storage/whisper

EXPOSE 8000

CMD gunicorn -b 0.0.0.0:8000 -w 2 --log-level debug graphite_api.app:app
