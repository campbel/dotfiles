#!/bin/bash

if [[ ! -d .git ]]; then
    echo "Not a git repository."
    return 1
fi
CHANGES=$(git diff --staged --ignore-all-space)
echo "
The following is a diff of the changes you are about to commit.
Please write a commit message that describes the changes you are making.
The commit message should be written in the imperative mood, as if you were
telling someone to do something. For example, \"Fix bug\" and not \"Fixed bug\"
or \"Fixes bug.\" It should also be less than 70 characters long. 
Include just the message, no labels or other text.

$CHANGES
" | openai.complete --tokens 100
