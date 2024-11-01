#!/bin/bash

command=$1
param=$2
directory=$(realpath "$3")

sudo docker "$command" -it --rm -v "$directory:/root" "$param" sh -c "cd ~ && exec sh"
