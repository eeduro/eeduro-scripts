#!/bin/bash
echo -e "\e[92m+++++++++++++++Starting eeduro-delta application++++++++++++++++"

mouse="/dev/input/event1"

sleep 20

if [ -c "$mouse" ]
then
        echo "mouse found"
        sudo screen -dmS mouse cat /dev/input/event1
else
        echo "no mouse connected"
fi

sudo /home/ost/bin/delta-ntb -c /home/ost/bin/HwConfigBBBlue.json

sleep 30

/usr/bin/sudo /sbin/halt

