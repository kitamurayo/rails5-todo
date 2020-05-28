FROM ruby:2.4.0

RUN mkdir /myapp
WORKDIR /myapp

ENV LANG=C.UTF-8 BUNDLE_GEMFILE=/myapp/Gemfile BUNDLE_JOBS=2 BUNDLE_PATH=/bundle

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev mysql-client nodejs npm

ADD Gemfile Gemfile.lock /myapp/
RUN gem install bundler
RUN bundle install

ADD . /myapp