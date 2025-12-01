FROM ruby:3.2.2

# Install OS deps
RUN apt-get update -qq && apt-get install -y nodejs build-essential libpq-dev

WORKDIR /usr/src/app

COPY backend/Gemfile backend/Gemfile.lock ./
RUN gem install bundler -v 2.4.13
RUN bundle install

COPY backend ./

# Precompile assets if needed (not required for API-only)
EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]