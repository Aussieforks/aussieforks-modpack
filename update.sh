#!/bin/sh
#Borrowed from pandorabox-io

# Fetch and merge the remote version of the current branch
branch=$(git branch --show-current)
remote=$(git config --get --local branch."${branch}".remote)
git fetch -a "${remote}"
git merge "${remote}/${branch}"

# sync repo urls
git submodule sync
# initialize new repos
git submodule init
# update commits
git submodule update
