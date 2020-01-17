import os
import subprocess
from subprocess import PIPE, DEVNULL


def check_if_pull_request():
    try:
        # if build is a pull request TRAVIS_PULL_REQUEST holds PR number otherwise "false"
        int(os.getenv('TRAVIS_PULL_REQUEST', ""))
    except ValueError:
        print("This is not a PR, skipping")
        exit(0)


def check_if_forced_skipping():
    commit_msg = subprocess.run(["git", "log", "-2", "--pretty=%B"], stdout=PIPE).stdout.decode('ascii')
    if "[skip cl]" in commit_msg:
        print("Skipping changelog checking")
        exit(0)


def check_changelog():
    if subprocess.run(
            ["git", "diff", "--diff-filter=AM", "HEAD..${TRAVIS_BRANCH}", "--exit-code", "-s", "--", "CHANGELOG.md"],
            stdout=DEVNULL, stderr=DEVNULL
    ).returncode:
        print("FAILED! Please update ./CHANGELOG.md file")
        exit(1)

    print("SUCCESS!")


check_if_pull_request()
check_if_forced_skipping()
check_changelog()
