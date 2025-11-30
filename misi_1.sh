#!/bin/sh
. ./config.sh

ip a add 10.22.1.1/24 dev eth0
ip a add 10.22.2.1/24 dev eth1
ip a add 10.22.3.1/24 dev eth2
ip link set eth0 up
ip link set eth1 up
ip link set eth2 up

ip route add 10.22.10.0/29 via 10.22.1.2
ip route add 10.22.20.0/27 via 10.22.1.2
ip route add 10.22.30.0/27 via 10.22.2.2
ip route add 10.22.40.0/26 via 10.22.2.2
ip route add 10.22.50.0/25 via 10.22.3.2
ip route add 10.22.60.0/24 via 10.22.3.2

apt update
apt install -y dnsmasq apache2

echo "interface=eth0
dhcp-range=10.22.10.10,10.22.10.14,12h
dhcp-range=10.22.20.10,10.22.20.30,12h
dhcp-range=10.22.30.10,10.22.30.40,12h
dhcp-range=10.22.40.10,10.22.40.60,12h
dhcp-range=10.22.50.10,10.22.50.120,12h
dhcp-range=10.22.60.10,10.22.60.210,12h" > /etc/dnsmasq.conf
systemctl restart dnsmasq

echo "nameserver 10.22.1.10" > /etc/resolv.conf

echo "Welcome to $(hostname)" > /var/www/html/index.html
systemctl restart apache2

