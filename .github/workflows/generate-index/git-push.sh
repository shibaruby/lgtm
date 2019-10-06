#!/bin/bash

set -eu


# Configure SSH

mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
echo "${DEPLOY_KEY}" > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa


# Configure Git

git config user.name $(git log -1 --pretty=format:"%cn")
git config user.email $(git log -1 --pretty=format:"%ce")
git remote rm origin
git remote add origin git@github.com:${GITHUB_REPOSITORY}.git


# Push

branch=${GITHUB_REF#refs/heads/}
git checkout -b $branch
git add docs
git commit -m ":bookmark_tabs: Automated index generation at $(date --iso-8601=seconds)"
git push -u origin $branch
