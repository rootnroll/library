#!/bin/bash

/opt/fish_init.fish

# Print the greeting
cat /.greeting 2> /dev/null

while true; do
    /usr/bin/fish
done
