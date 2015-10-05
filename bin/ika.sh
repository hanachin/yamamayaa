#!/bin/sh

set -e

script_dir=$(cd $(dirname $0) && pwd)
ika_path=$(dirname $script_dir)/tmp/ika

ping_responses=$(ping -c 2 -i 10 -b 255.255.255.255)

wii_u_ip_address=$(arp -e | grep $(cat ~/.wii_u_mac_address) | cut -f 1 -d' ')

wii_u_alive=$(echo $ping_responses | grep -F $wii_u_ip_address | cat)

if [ -z "$wii_u_alive" ]; then
  if [ -f $ika_path ]; then
    rm $ika_path
    echo $(date) ika end
  fi
  exit 0
fi

if [ ! -f $ika_path ]; then
  touch $ika_path
  # TODO yo notification
  echo $(date) ika start
fi
