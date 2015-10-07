#!/bin/sh

set -e

script_dir=$(cd $(dirname $0) && pwd)
ika_path=$(dirname $script_dir)/tmp/ika

wii_u_alive=$(sudo nmap -sP 192.168.1.1-16 | grep -i -F $(cat ~/.wii_u_mac_address) | cat)

if [ -z $wii_u_alive ]; then
  if [ -f $ika_path ]; then
    rm $ika_path
    echo $(date) ika end
  fi
  exit 0
fi

if [ ! -f $ika_path ]; then
  touch $ika_path
  echo $(date) ika start
  for ika in $(cat config/ika)
  do
    echo ika yo to $ika
    # curl https://api.justyo.co/yo/ -F username=$ika -F api_token=$(cat ~/.yo_api_token)
  done
fi
