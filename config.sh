#!/bin/sh
sysctl -w net.ipv4.ip_forward=1
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

