#!/bin/bash

aws configure set aws_access_key_id ${ACCESS_KEY}
aws configure set aws_secret_access_key ${SECRET_KEY}
aws configure set region ${REGION}
# aws s3 sync ${S3_PATH} /var/www

cp -fr /var/artifacts/* /var/www
