#!/usr/bin/env bash

## This script is used to list all the includes used in a particular
## into a file named includes.txt.
## The list be used in the vscode c_cpp settings for intellicode search.

if [ -z $1 ]; then
    proj="nucleof439zi_blinky"
else
    proj=$1
fi

 newt clean $proj
 newt build -p $proj > build.log
 grep '^arm-none-eabi-gcc' build.log | grep -oE '\-I\S+\b' | \
      sort -u | sed 's/^-I/"\${workspaceFolder}\/..\/..\//' | \
      sed 's/$/",/' > includes.txt

