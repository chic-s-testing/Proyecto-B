FROM ruby:3.0.2
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn
WORKDIR /Proyecto-B
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["rails", "s", "-b", "0.0.0.0"]