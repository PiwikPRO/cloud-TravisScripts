#!/bin/bash

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID;
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY;
DOCKER_LOGIN_CMD=`aws ecr get-login --region $AWS_REGION`;

eval $DOCKER_LOGIN_CMD
