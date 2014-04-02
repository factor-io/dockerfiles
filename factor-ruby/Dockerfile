FROM ubuntu
MAINTAINER Maciej Skierkowski, maciej@factor.io
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev libxml2 libxml2-dev libxslt-dev zip unzip libmysqlclient-dev nodejs ssh-client git libsqlite3-dev
RUN gem install bundler
