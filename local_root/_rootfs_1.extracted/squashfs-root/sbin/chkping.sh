#!/bin/sh

ping -c$1 $2 | grep "packet loss" | awk '{ print $7 }' > /tmp/ping.txt
