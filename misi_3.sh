#!/bin/sh
. ./config.sh

iptables -A INPUT -s 192.222.1.192/29 -j DROP
iptables -A OUTPUT -d 192.222.1.192/29 -j DROP
iptables -A FORWARD -s 192.222.1.192/29 -j DROP
iptables -A FORWARD -d 192.222.1.192/29 -j DROP
