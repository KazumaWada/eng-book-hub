FROM ruby:3.2.2

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       postgresql-client \
                       yarn

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install

# アプリケーションのコピー
COPY . /app/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# bundle execを使用
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]




#  これが.shの "$@" に渡される ここでは実行されない。柔軟性を保つためにCMDは変数的に使用されている
