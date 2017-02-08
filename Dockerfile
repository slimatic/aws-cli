FROM debian:jessie
MAINTAINER Salim Ibrahim <salim.31@gmail.com>

RUN apt-get update && \
    apt-get install -y python python-pip cron awscli && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /var/www

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
