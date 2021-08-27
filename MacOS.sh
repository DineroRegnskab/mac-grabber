#!/bin/bash

LAN=$(networksetup -getmacaddress "USB 10/100/1000 LAN" | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}');
WIFI=$(networksetup -getmacaddress "Wi-Fi" | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}');

echo "👋 Hej og velkommen til! Vi validerer nu dit setup..."
sleep 1

if [ -z "$LAN" ] 
then
    echo -e "\033[1;31m❌ LAN adresse ikke fundet. Forbind din Mac til kabel eller skærm.\033[0m"
    sleep 0.5
    # exit
else
    echo -e "\033[1;32m✅ LAN adresse fundet: $LAN\033[0m"
    sleep 0.5
fi

if [ -z "$WIFI" ] 
then
    echo -e "\033[1;31m❌ Wi-Fi adresse ikke fundet. Forbind din Mac til Wi-Fi.\033[0m"
    sleep 0.5
    # exit
else
    echo -e "\033[1;32m✅ Wi-Fi adresse fundet: $WIFI\033[0m"
    sleep 0.5
fi

