#!/bin/bash

# Print the greeting
cat /.greeting 2> /dev/null

while command -v /usr/bin/fish >/dev/null; do  # a user may delete the executable
    gosu box /usr/bin/fish -l
done
