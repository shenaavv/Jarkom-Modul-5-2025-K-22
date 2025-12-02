#vilya
ip addr add 192.222.1.203/29 dev eth0
ip route add default via 192.222.1.201 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt update
apt-get install isc-dhcp-server -y

 #AnduinBanks, Rivendell, dan Minastir
ip addr add 192.222.1.234/30 dev eth0
ip addr add 192.222.1.201/29 dev eth1
ip route add default via 192.222.1.233 dev eth0

ip route add 192.222.1.232/30 via 192.222.1.233

ip route add 192.222.1.228/30 via 192.222.1.233

ip route add 192.222.1.208/30 via 192.222.1.233

ip route add 192.222.1.212/30 via 192.222.1.233

ip route add 192.222.1.128/26 via 192.222.1.233

ip route add 192.222.1.192/29 via 192.222.1.233

ip route add 192.222.1.236/30 via 192.222.1.233

ip route add 192.222.0.0/24 via 192.222.1.233

ip route add 192.222.1.224/30 via 192.222.1.233
ip route add 192.222.1.216/30 via 192.222.1.233

ip route add 192.222.1.220/30 via 192.222.1.233
ip route add 192.222.1.0/25 via 192.222.1.233

echo "nameserver 192.168.122.1" > /etc/resolv.conf
apt-get update
apt-get install isc-dhcp-relay -y

#narya
ip addr add 192.222.1.202/29 dev eth0
ip route add default via 192.222.1.201 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

#ironhills
ip addr add 192.222.1.210/30 dev eth0
ip route add default via 192.222.1.209 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf
