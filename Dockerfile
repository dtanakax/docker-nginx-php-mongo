# Set the base image
FROM tanaka0323/nginx-php

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y php5-dev php5-cli php-pear && \
    rm -rf /var/lib/apt/lists/*

RUN pecl install mongo
RUN touch /etc/php5/fpm/conf.d/20-mongo.ini
RUN chmod 777 /etc/php5/fpm/conf.d/20-mongo.ini
RUN echo "extension=mongo.so" >> /etc/php5/fpm/conf.d/20-mongo.ini

RUN apt-get clean all

# Executing sh
CMD ["supervisord", "-n"]