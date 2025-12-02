#!/bin/sh
sysctl -w net.ipv4.ip_forward=1
iptables -F
iptables -t nat -F
iptables -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

iptables -A INPUT -s 192.222.1.192/29 -j DROP
iptables -A OUTPUT -d 192.222.1.192/29 -j DROP
iptables -A FORWARD -s 192.222.1.192/29 -j DROP
iptables -A FORWARD -d 192.222.1.192/29 -j DROP
