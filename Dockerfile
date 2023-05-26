FROM ruby:3.1.4-slim

RUN apt-get update -qq \
 && apt-get install -y build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN mkdir /app

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development,test
ADD . /app

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT 1
ENV RAILS_SERVE_STATIC_FILES 1

# workaround this issue: https://github.com/rails/rails/issues/32947
ARG SECRET_KEY_BASE hogehoge
RUN bin/rails assets:precompile

EXPOSE 3000
CMD ["sh", "-c", "bin/rails db:migrate && bin/rails s -b 0.0.0.0"]
