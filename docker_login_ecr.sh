#!/bin/bash

aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID?"empty aws_access_key"};
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY?"empty secret_access_key"};
DOCKER_LOGIN_CMD=`aws ecr get-login --region ${AWS_REGION?"empty region"} --no-include-email`;

eval $DOCKER_LOGIN_CMD
