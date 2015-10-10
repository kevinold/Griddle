#!/bin/bash
rm -rf out || exit 0;
mkdir out;
grunt build
( cd out
 git init
 git config user.name "Travis-CI"
 cp -R ../docs/html/* .
 git add .
 git commit -m "Deployed to Github Pages"
 git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
)
