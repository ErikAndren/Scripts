#!/bin/bash
# Purpose of this script is to check whether my external ip has changed
# Should live in a cronjob

# Check external ip
NEW_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)" 

echo $NEW_IP

if [ -e /tmp/external_ip ]; then
	OLD_IP=$(</tmp/external_ip)
fi

if [ "$NEW_IP" != "$OLD_IP" ]; then
	echo "Ip address of home updated to $NEW_IP" | mail -s "Ip address of home updated!" erik.andren@gmail.com
	echo $NEW_IP > /tmp/external_ip
fi



