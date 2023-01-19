#!/bin/bash

if [[ ! -d .git ]]; then
    echo "Not a git repository."
    return 1
fi
CHANGES=$(git diff --staged --ignore-all-space)
echo "
The following is a diff of the changes you are about to commit.
Please write a commit message that describes the changes you are making.
Include just the message, no labels or other text.

$CHANGES
" | openai.complete --tokens 100
