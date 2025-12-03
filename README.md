# Laporan Resmi Praktikum Komunikasi Data dan Jaringan Komputer Modul 5

# Jarkom K22

## Member

| No  | Nama                   | NRP        |
| --- | ---------------------- | ---------- |
| 1   | Kanafira Vanesha Putri | 5027241010 |
| 2   | Reza Aziz Simatupang   | 5027241051 |

## Reporting

```bash
Base = 192.222
```

## Misi 1
### Identifikasi Perangkat:

Narya: Berfungsi sebagai DNS Server.
Vilya: Berfungsi sebagai DHCP Server.
Web Servers: Palantir  dan IronHills.
Client (Pasukan):
Khamul: 5 host (Target/Burnice).
Cirdan: 20 host (Lycaon).
Isildur: 30 host (Policeboo).
Durin: 50 host (Caesar).
Gilgalad: 100 host (Ellen).
Elendil: 200 host (Jane).

### Menggunakkan Metode VLSM untuk subnetting :


### Detail Subnetting Jaringan (VLSM) :

Tabel berikut merangkum alokasi alamat IP untuk berbagai subnet, termasuk Network ID (NID), Gateway, Broadcast, rentang IP Host yang valid, dan kebutuhan host.

### Detail Subnetting Jaringan (VLSM) :

Tabel berikut merangkum alokasi alamat IP untuk berbagai subnet, termasuk Network ID (NID), Gateway, Broadcast, rentang IP Host yang valid, dan kebutuhan host.

| Subnet | Deskripsi Jaringan | NID/Prefix | Gateway | Broadcast | Rentang IP Host | Kebutuhan Host | Jumlah IP | Netmask |
| :---: | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **A5** | (Elendil, Isildur) > Switch > Minastir | 192.222.0.0/24 | 192.222.0.1 | 192.222.0.255 | 192.222.0.1 - 192.222.0.254 | 231 | 256 | 255.255.255.0 |
| **A6** | (Gilgalad, Cirdan) > Switch > AnduinBanks | 192.222.1.0/25 | 192.222.1.1 | 192.222.1.127 | 192.222.1.1 - 192.222.1.126 | 121 | 128 | 255.255.255.128 |
| **A2** | Durin > Wilderland | 192.222.1.128/26 | 192.222.1.129 | 192.222.1.191 | 192.222.1.129 - 192.222.1.190 | 51 | 64 | 255.255.255.192 |
| **A3** | Khamul > Switch > Wilderland | 192.222.1.192/29 | 192.222.1.193 | 192.222.1.199 | 192.222.1.193 - 192.222.1.198 | 6 | 8 | 255.255.255.248 |
| **A4** | (Vilya, Narya) > switch > Rivendell | 192.222.1.200/29 | 192.222.1.201 | 192.222.1.207 | 192.222.1.201 - 192.222.1.206 | 3 | 8 | 255.255.255.248 |
| **A1** | IronHills > Switch > Moria | 192.222.1.208/30 | 192.222.1.209 | 192.222.1.211 | 192.222.1.209 - 192.222.1.210 | 2 | 4 | 255.255.255.252 |
| **A7** | Wilderland > Moria | 192.222.1.212/30 | 192.222.1.213 | 192.222.1.215 | 192.222.1.213 - 192.222.1.214 | 2 | 4 | 255.255.255.252 |
| **A8** | Palantir > Pelargir | 192.222.1.216/30 | 192.222.1.217 | 192.222.1.219 | 192.222.1.217 - 192.222.1.218 | 2 | 4 | 255.255.255.252 |
| **A9** | AnduinBanks > Pelargir | 192.222.1.220/30 | 192.222.1.221 | 192.222.1.223 | 192.222.1.221 - 192.222.1.222 | 2 | 4 | 255.255.255.252 |
| **A10** | Pelargir > Minastir | 192.222.1.224/30 | 192.222.1.225 | 192.222.1.227 | 192.222.1.225 - 192.222.1.226 | 2 | 4 | 255.255.255.252 |
| **A11** | Moria > Osgiliath | 192.222.1.228/30 | 192.222.1.229 | 192.222.1.231 | 192.222.1.229 - 192.222.1.230 | 2 | 4 | 255.255.255.252 |
| **A12** | Rivendell > Osgiliath | 192.222.1.232/30 | 192.222.1.233 | 192.222.1.235 | 192.222.1.233 - 192.222.1.234 | 2 | 4 | 255.255.255.252 |
| **A13** | Minastir > Osgiliath | 192.222.1.236/30 | 192.222.1.237 | 192.222.1.239 | 192.222.1.237 - 192.222.1.238 | 2 | 4 | 255.255.255.252 |

### Melakukan Konfigurasi Service
- **Vilya** sebagai DHCP Server agar perangkat dalam Khamul, Durin, Gilgalad, Elendil, Cirdan, dan Isildur menerima IP otomatis.
    - update & download
    ```c
    apt update
    apt-get install isc-dhcp-server -y
    ```

    - konfigurasi pada file berikut`nano /etc/default/isc-dhcp-server`

    ```c
    INTERFACESv4="eth0"
    ```

    /etc/dhcp/dhcpd.conf
  
  ```c
  # Konfigurasi Global
  default-lease-time 600;
  max-lease-time 7200;

  # PENTING: Arahkan DNS ke IP Narya
  option domain-name-servers 192.222.1.202;

  # Subnet Vilya (A4) - Harus ada deklarasi ini agar service jalan
  subnet 192.222.1.200 netmask 255.255.255.248 {
  }

  # Subnet A2 (Durin) - via Relay Wilderland
  subnet 192.222.1.128 netmask 255.255.255.192 {
    range 192.222.1.131 192.222.1.190;
    option routers 192.222.1.129;
    option broadcast-address 192.222.1.191;
  }

  # Subnet A3 (Khamul) - via Relay Wilderland
  subnet 192.222.1.192 netmask 255.255.255.248 {
    range 192.222.1.195 192.222.1.198;
    option routers 192.222.1.193;
    option broadcast-address 192.222.1.199;
  }

  # Subnet A5 (Elendil, Isildur) - via Relay Minastir
  subnet 192.222.0.0 netmask 255.255.255.0 {
    range 192.222.0.10 192.222.0.254;
    option routers 192.222.0.1;
    option broadcast-address 192.222.0.255;
  }

  # Subnet A6 (Gilgalad, Cirdan) - via Relay AnduinBanks
  subnet 192.222.1.0 netmask 255.255.255.128 {
    range 192.222.1.10 192.222.1.126;
    option routers 192.222.1.1;
    option broadcast-address 192.222.1.127;
  }
  ```

  - restart service

  ```c 
  service isc-dhcp-server restart
  ```

  - DHCP Relay - Rivendell, AnduinBanks, Minastir, Wilderland**
    - install package
        
        ```c
        apt-get update
        apt-get install isc-dhcp-relay -y
        ```
        
    - Rivendell, AnduinBanks, Minastir nano `nano /etc/default/isc-dhcp-relay`
    
    ```c
    SERVERS="192.222.1.203"
    INTERFACES="eth0 eth1"
    OPTIONS=""
    ```

    - Wilderland nano`nano /etc/default/isc-dhcp-relay`

```bash
SERVERS="192.222.1.203"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""
```

  - IP forwarding (wilderland)

  ```c
  echo 1 > /proc/sys/net/ipv4/ip_forward
  service isc-dhcp-relay restart
  ```

- DHCP CLIENT
    - install package pada client
    
    ```bash
    apt-get update
    apt-get install isc-dhcp-client -y
    ```

  - Wilderland nano`nano /etc/default/isc-dhcp-relay`

  ```c
  SERVERS="192.222.1.203"
  INTERFACES="eth0 eth1 eth2"
  OPTIONS=""
  ```

  - IP forwarding (wilderland)

  ```c
  echo 1 > /proc/sys/net/ipv4/ip_forward
  service isc-dhcp-relay restart
  ```

  - DHCP CLIENT
    - install package pada client
    
    ```c
    apt-get update
    apt-get install isc-dhcp-client -y
    ```

    jika sudah cek dgn
    ```c
    dhclient -V
    ```

    - DNS Server (Narya)
    - install package
    
    ```c
    apt-get update && apt-get install bind9
    ```
    
    - konfig di nano `/etc/bind/named.conf.options`
    
    ```c
    options {
            directory "/var/cache/bind";
            allow-query { any; };
            auth-nxdomain no;    # conform to RFC1035
            listen-on-v6 { any; };
    };
    ```
    
    - konfig di nano `/etc/bind/named.conf.local`
    
    ```c
    zone "k22.local" {
        type master;
        file "/etc/bind/db.k22";
    };
    ```

    - konfig di nano `/etc/bind/db.k22`

    ```c
    ;
    ; BIND data file for local loopback interface
    ;
    $TTL    604800
    @       IN      SOA     middleearth.local. root.k22.local. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
    ;
    @       IN      NS      middleearth.local.
    @       IN      A       192.222.1.202   ; IP Narya sendiri
    ; Record Web Server
    ironhills    IN      A       192.222.1.210
    palantir     IN      A       192.222.1.218
    ```

    - restart bind9

    ```c
    service named restart
    ```

    - WEB Server (**IronHills, Palantir**)
    - install package
    
    ```c
    apt-get update && apt-get install nginx
    ```
    
    - buat file html (ironhills/palantir *tinggal rubah aja*)
    
    ```c
    echo "Welcome to IronHills" > /var/www/html/index.html
    ```
    
    - start nginx
    
    ```c
    service nginx start
    ```

    <img width="590" height="48" alt="image" src="https://github.com/user-attachments/assets/673e456e-e2db-4fdb-a0da-6eb51586ea96" />

## Misi 2:

### 1. iptables postrouting (**osgiliath**)

   -  Agar seluruh jaringan internal bisa terhubung ke internet melalui Osgiliath, dibuat rule SNAT:

    ```c
    iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.122.25
    ```

### 2. tidak ada yang bisa ping vilya (**vilya**)

 - Agar tidak ada perangkat yang bisa melakukan ping ke Vilya, maka ICMP Echo Request diblokir:

    ```c
    iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
    ```

  <img width="704" height="109" alt="image" src="https://github.com/user-attachments/assets/5e309828-d86f-4e9c-8d6b-9f9f73740070" />

    ```c
    192.222.1.203 = IP vilya
    ```

### 3. Membuat hanya vilya yang bisa nc narya (**narya**)

- DNS Server (Narya) hanya boleh menerima koneksi UDP port 53 dari Vilya.
  Maka selain Vilya → ditolak.

    ```c
    iptables -A INPUT -p udp --dport 53 -s 192.222.1.203 -j ACCEPT && iptables -A INPUT -p udp --dport 53 -j REJECT
    ```

  Lalu di client

  ```c
  apt-get update && apt-get install netcat-openbsd
  ```

  Lalu lakukan tes 
  ```c
  nc -z -v -u 192.222.1.202 53
  ```

  <img width="700" height="108" alt="image" src="https://github.com/user-attachments/assets/4e399574-4df7-4b5e-adee-168cdd79e00a" />

### 4. buat hanya bisa curl iron hilss pada weekend

  - Akses ke web server IronHills (port 80) hanya diperbolehkan pada Sabtu & Minggu, dan hanya dari subnet tertentu.

    ```c
    # 1. Izinkan Subnet Durin
    iptables -A INPUT -p tcp --dport 80 -s 192.222.1.128/26 -m time --weekdays Sat,Sun -j ACCEPT

    # 2. Izinkan Subnet Khamul
    iptables -A INPUT -p tcp --dport 80 -s 192.222.1.192/29 -m time --weekdays Sat,Sun -j ACCEPT

    # 3. Izinkan Subnet Elendil & Isildur
    iptables -A INPUT -p tcp --dport 80 -s 192.222.0.0/24 -m time --weekdays Sat,Sun -j ACCEPT

    # 4. Blokir sisanya
    iptables -A INPUT -p tcp --dport 80 -j DROP
    ```

    <img width="650" height="161" alt="image" src="https://github.com/user-attachments/assets/aecfd869-171f-4c09-88c3-8756bc6ac3a7" />
