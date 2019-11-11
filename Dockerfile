FROM debian:buster
MAINTAINER yohan <783b8c87@scimetis.net>
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list
RUN apt update && apt -y install php-fpm php-gd php-mysql
COPY php-fpm.conf /etc/php/7.3/fpm/
ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F", "--force-stderr", "--fpm-config", "/etc/php/7.3/fpm/php-fpm.conf"]
#ENTRYPOINT ["/bin/bash"]
