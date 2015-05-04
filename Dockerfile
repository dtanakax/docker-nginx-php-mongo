# Set the base image
FROM tanaka0323/nginx-php

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

ENV DEBIAN_FRONTEND noninteractive

COPY mongo /usr/lib/php5/20131226/mongo.so
RUN chmod 777 /usr/lib/php5/20131226/mongo.so

RUN touch /etc/php5/fpm/conf.d/20-mongo.ini
RUN chmod 777 /etc/php5/fpm/conf.d/20-mongo.ini
RUN echo "extension=mongo.so" >> /etc/php5/fpm/conf.d/20-mongo.ini

ENTRYPOINT ["./start.sh"]

# Set the port to 80
EXPOSE 80 443

# Executing sh
CMD ["supervisord", "-n"]