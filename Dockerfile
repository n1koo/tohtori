FROM litaio/ruby
MAINTAINER "Niko Kurtti niko@salaliitto.com"
 
RUN apt-get update
RUN apt-get install -y redis-server libssl-dev git
RUN gem install bundler
ADD . /srv/lita-docker/
WORKDIR /srv/lita-docker
RUN bundle install --without development test debug


RUN mv "/srv/lita-docker/config/settings.production.yml" "/srv/lita-docker/config/settings.yml"

CMD service redis-server start && ENV=production bundle exec lita start
