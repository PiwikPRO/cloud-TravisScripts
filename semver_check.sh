#!/bin/bash

# https://semver.org/#is-there-a-suggested-regular-expression-regex-to-check-a-semver-string
PATTERN='^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$'
STRING=$1

MATCH=$( echo $STRING | egrep $PATTERN )

if [ -z $MATCH ]; then
  echo "'$STRING' is not a valid semver version"
  exit 1
fi

