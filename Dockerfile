FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler

RUN mkdir /trips
WORKDIR /trips

COPY Gemfile /trips/Gemfile
COPY Gemfile.lock /trips/Gemfile.lock
RUN bundle install

COPY . /trips


