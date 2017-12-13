Travis Scripts
=============

Goal of this project is to share simple bash scripts that could used directly in the build process.

## How to use the script in .travis.yml ?

Go to the github and open you specific script that you would like to use in raw mode. Copy URL and past to your .travis.yml file in the following way:

```
curl -s https://raw.githubusercontent.com/PiwikPRO/cloud-TravisScripts/master/docker_login_ecr.sh | bash
```

## Scripts

### Login using docker tool to AWS ECR private registry

This script requires following ENV VARS:

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION

All this data is available in AWS panel.

This script configures aws cli tool with given credentials and requests docker's login command with username and password that allows to login.

## Change-log

* __0.1.1__
  - Added `--no-include-email` in docker_login_ecr.sh

* __0.1.0__
  - initial version
