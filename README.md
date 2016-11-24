Travis Scripts
=============

Goal of this project is to share simple bash scripts that could used directly in the build process.

## Scripts

### Login using docker tool to AWS ECR private registry

This script requires following ENV VARS:

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION

All this data is available in AWS panel.

This script configures aws cli tool with given credentials and requests docker's login command with username and password that allows to login.

## Change-log

* __0.1.0__
  - initial version
