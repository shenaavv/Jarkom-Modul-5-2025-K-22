#!/bin/sh
. ./config.sh

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 203.0.113.22

iptables -A INPUT -s 192.222.0.0/16 -d 192.222.1.20 -p icmp -j DROP

iptables -A INPUT -p tcp --dport 53 ! -s 192.222.1.20 -j DROP
iptables -A INPUT -p udp --dport 53 ! -s 192.222.1.20 -j DROP

iptables -A INPUT -p tcp --dport 80 -m time --weekdays Sat,Sun -s 192.222.40.0/26 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m time --weekdays Sat,Sun -s 192.222.10.0/29 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m time --weekdays Sat,Sun -s 192.222.60.0/24 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m time --weekdays Sat,Sun -s 192.222.30.0/27 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j DROP

iptables -A INPUT -p tcp --dport 80 -s 192.222.50.0/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 192.222.20.0/27 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 192.222.60.0/24 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 192.222.30.0/27 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j DROP

iptables -A INPUT -p tcp --syn -m recent --set --name pscan
iptables -A INPUT -p tcp --syn -m recent --update --seconds 20 --hitcount 15 --name pscan -j LOG --log-prefix "PORT_SCAN"
iptables -A INPUT -p tcp --syn -m recent --update --seconds 20 --hitcount 15 --name pscan -j DROP

iptables -A INPUT -p icmp -m recent --update --seconds 20 --hitcount 15 --name pscan -j DROP
iptables -A INPUT -p tcp --dport 80 -m recent --update --seconds 20 --hitcount 15 --name pscan -j DROP

iptables -A INPUT -p tcp --syn --dport 80 -m connlimit --connlimit-above 3 -j DROP

iptables -t nat -A PREROUTING -s 192.222.1.20 -d 192.222.10.5 -j DNAT --to-destination 192.222.10.6
