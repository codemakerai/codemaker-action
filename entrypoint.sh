#!/bin/sh

api_key=$1
mode=$2
path=$3

printf $PATH
ls /linux-amd64

# configure codemaker cli
printf $api_key | codemaker configure

# run generation
codemaker generate $mode $path
