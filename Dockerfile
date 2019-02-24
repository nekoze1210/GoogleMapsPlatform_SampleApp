FROM ruby:2.6.1
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y imagemagick && apt-get install -y libmagick++-dev
RUN mkdir /google_maps_platform_sample
WORKDIR /google_maps_platform_sample
ADD Gemfile /google_maps_platform_sample/Gemfile
ADD Gemfile.lock /google_maps_platform_sample/Gemfile.lock
RUN bundle install
ADD . /google_maps_platform_sample
