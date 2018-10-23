#!/bin/bash

/opt/fish_init.fish

# Print the greeting
cat /.greeting 2> /dev/null

while command -v /usr/bin/fish >/dev/null; do  # a user may delete the executable
    /usr/bin/fish
done
