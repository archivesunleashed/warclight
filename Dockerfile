ARG ALPINE_RUBY_VERSION=3.14

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

RUN gem install rails

COPY template.rb .

RUN rails new warclight -m template.rb

WORKDIR /app/warclight

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

