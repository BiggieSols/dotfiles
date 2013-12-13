#!/bin/sh

blob=$1
echo "Finding commit for blob $1."
echo "Warning: this can take a long time on large repos."
echo "This script brute-force checks the recursive tree for every commit."

git rev-list --all |
while read commit; do
    if git ls-tree -r $commit | grep -q $blob; then
        echo $commit
    fi
done
