ARG ALPINE_RUBY_VERSION=3.11
ARG RAILS_VERSION=5.2.6

FROM ruby:alpine${ALPINE_RUBY_VERSION}

RUN apk add --update --no-cache \
  bash \
  build-base \
  git \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  shared-mime-info \
  sqlite-dev \
  tzdata

RUN mkdir /app
WORKDIR /app

RUN gem update --system && \
  gem install bundler && \
  bundle config build.nokogiri --use-system-libraries

COPY Gemfile warclight.gemspec template.rb ./

RUN gem install rails --version 5.2.6

RUN rails new warclight -m template.rb

WORKDIR /app/warclight

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

