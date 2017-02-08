FROM debian:jessie
MAINTAINER Salim Ibrahim <salim.31@gmail.com>

RUN apt-get update && \
    apt-get install -y python python-pip cron awscli && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli

# Prepare directory
RUN mkdir -p /var/www
RUN usermod -u 1000 www-data
RUN usermod -a -G users www-data
RUN chown -R www-data:www-data /var/www

RUN mkdir -p /var/artifacts
RUN usermod -u 1000 www-data
RUN usermod -a -G users www-data
RUN chown -R www-data:www-data /var/artifacts

EXPOSE 80
EXPOSE 443
WORKDIR /var/www

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
