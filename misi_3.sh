#!/bin/sh
. ./config.sh

iptables -A INPUT -s 10.22.10.0/29 -j DROP
iptables -A OUTPUT -d 10.22.10.0/29 -j DROP
iptables -A FORWARD -s 10.22.10.0/29 -j DROP
iptables -A FORWARD -d 10.22.10.0/29 -j DROP

