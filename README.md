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

## Misi 1: Memetakan Medan Perang
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

