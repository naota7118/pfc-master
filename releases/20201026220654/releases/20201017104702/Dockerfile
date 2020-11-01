FROM ruby:2.5.1

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

WORKDIR /pfc-master
COPY ./Gemfile Gemfile.lock /pfc-master/

RUN gem install bundler
RUN bundle install
