#!/bin/bash
interface=$(ifconfig | grep -oE '^en[0-9]:|^eth[0-9]:|^wlan[0-9]:|^eno[0-9]:|^eno[0-9][a-z]:|^ens[0-9]:|^ens[0-9][a-z]:|^enp[0-9]:|^enp[0-9][a-z]:|^wl[a-z0-9]+:' | grep -v 'lo:' | sed 's/.$//')
ip=$(ifconfig $interface | grep 'inet ' | awk '{print $2}' | grep -v '127.0.0.1')
mac=$(ifconfig $interface | grep 'ether ' | awk '{print $2}')
echo "${ip}-${mac}"

