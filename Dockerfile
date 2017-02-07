FROM debian:jessie
MAINTAINER Salim Ibrahim <salim.31@gmail.com>

RUN apt-get update && \
    apt-get install -y python python-pip cron awscli && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli

ENV ACCESS_KEY
ENV SECRET_KEY
ENV S3_PATH
ENV REGION

# ADD s3cfg /root/.s3cfg
# ADD sync.sh /sync.sh
# RUN chmod +x /sync.sh

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# CMD [""]
