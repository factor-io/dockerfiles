FROM ubuntu
MAINTAINER Maciej Skierkowski, maciej@factor.io
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libmysqlclient-dev nodejs
# RUN apt-get -y install git libxml2

# Factor.io specific dependencies
RUN apt-get -y install zip unzip ssh-client

# RBENV dependencies
RUN apt-get -y install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

# Install rbenv to install ruby
RUN git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# Install rbenv plugin: ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# Let's not copy gem package documentation
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

ENV RBENV_ROOT /usr/local/rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN rbenv install 2.1.3
RUN rbenv local 2.1.3
RUN rbenv global 2.1.3

RUN gem install bundler
RUN gem install factor
ENTRYPOINT ["factor", "cloud"]
