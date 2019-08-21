#!/bin/sh

set -e

commitMessage=$(git log -2 --pretty=%B)
skipCl="skip-cl"

case "$commitMessage" in
    *"$skipCl"*)    echo 'Changelog checking is skipped...'; exit  ;;
    *)              echo 'False' ;;
esac

if [ -z "${TRAVIS_PULL_REQUEST_BRANCH}" ]; then
    echo This is not a PR, skipping

    exit
fi

printf "Checking CHANGELOG.md entries between ${TRAVIS_BRANCH} and ${TRAVIS_PULL_REQUEST_BRANCH}... "

if git diff --diff-filter=AM HEAD..${TRAVIS_BRANCH} --exit-code -s -- CHANGELOG.md > /dev/null 2>&1 ; then
    echo "FAILED!"
    echo "Please update ./CHANGELOG.md file"

    exit 1
fi

echo "SUCCESS!"
