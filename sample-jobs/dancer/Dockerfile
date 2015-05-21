FROM ruby:2.2.2

MAINTAINER Yongmin Xia <yongmin.xia@rea-rea-group.com>

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

CMD ["/app/run"]
