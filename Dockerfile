FROM ruby:2.2.2

MAINTAINER Yongmin Xia <yongmin.xia@rea-rea-group.com>

RUN apt-get update && apt-get install -y \
    cron \
    curl

RUN curl -o /usr/local/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.6.0 && \
    chmod +x /usr/local/bin/docker

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 8

ADD . /app

EXPOSE 3000

CMD ["/app/run"]

