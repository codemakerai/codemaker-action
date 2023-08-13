#!/bin/sh -l

api_key=$1
mode=$2
path=$3

apt-get install wget uzip
wget https://github.com/codemakerai/codemaker-cli/releases/download/v0.0.12/linux-amd64.zip -P /usr/local/bin/codemaker-cli
uzip /usr/local/bin/codemaker-cli/linux-amd64.zip
export PATH=$PATH:/usr/local/bin/codemaker-cli/linux-amd64/bin

printf $api_key | codemaker configure

codemaker generate $mode $path
