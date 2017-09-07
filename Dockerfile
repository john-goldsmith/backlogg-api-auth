FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /backlogg/backlogg-api-auth
WORKDIR /backlogg/backlogg-api-auth
COPY . ./
RUN gem install bundler --no-document
RUN bundle install
EXPOSE 3003
# ENTRYPOINT ["bundle", "exec"]
ENTRYPOINT ["./docker-entry.sh"]
CMD ["rails", "server", "-p", "3003", "-b", "0.0.0.0"]