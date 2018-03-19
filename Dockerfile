FROM ruby:2.4.2-alpine

ENV RAILS_ENV=production
ENV APP_HOME=/app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Install gems
COPY Gemfile* $APP_HOME/
RUN apk --no-cache add tzdata nodejs postgresql-dev && \
    apk --no-cache add --virtual build-dependencies build-base libxml2-dev libxslt-dev && \
    gem install bundler && \
    bundle install && \
    apk del build-dependencies

COPY config/database.sample.yml config/database.yml

COPY . $APP_HOME

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
