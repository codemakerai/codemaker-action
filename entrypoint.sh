api_key=$1
mode=$2
path=$3

# TODO: install codemaker cli

printf $api_key | codemaker configure

codemaker generate $mode $path