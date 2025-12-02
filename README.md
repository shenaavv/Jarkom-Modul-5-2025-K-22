# Laporan Resmi Praktikum Komunikasi Data dan Jaringan Komputer Modul 5

# Jarkom K22

## Member

| No  | Nama                   | NRP        |
| --- | ---------------------- | ---------- |
| 1   | Kanafira Vanesha Putri | 5027241010 |
| 2   | Reza Aziz Simatupang   | 5027241051 |

## Reporting

```bash
Base = 10.22.0.0
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

| Subnet | Deskripsi Jaringan | NID/Prefix | Gateway | Broadcast | Rentang IP Host | Kebutuhan Host | Jumlah IP | Netmask |
| :---: | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **A5** | (Elendil, Isildur) > Switch > Minastir | 10.22.0.0/24 | 10.22.0.1 | 10.22.0.255 | 10.22.0.1 - 10.22.0.254 | 231 | 256 | 255.255.255.0 |
| **A6** | (Gilgalad, Cirdan) > Switch > AnduinBanks | 10.22.1.0/25 | 10.22.1.1 | 10.22.1.127 | 10.22.1.1 - 10.22.1.126 | 121 | 128 | 255.255.255.128 |
| **A2** | Durin > Wilderland | 10.22.1.128/26 | 10.22.1.129 | 10.22.1.191 | 10.22.1.129 - 10.22.1.190 | 51 | 64 | 255.255.255.192 |
| **A3** | Khamul > Switch > Wilderland | 10.22.1.192/29 | 10.22.1.193 | 10.22.1.199 | 10.22.1.193 - 10.22.1.198 | 6 | 8 | 255.255.255.248 |
| **A4** | (Vilya, Narya) > switch > Rivendell | 10.22.1.200/29 | 10.22.1.201 | 10.22.1.207 | 10.22.1.201 - 10.22.1.206 | 3 | 8 | 255.255.255.248 |
| **A1** | IronHills > Switch > Moria | 10.22.1.208/30 | 10.22.1.209 | 10.22.1.211 | 10.22.1.209 - 10.22.1.210 | 2 | 4 | 255.255.255.252 |
| **A7** | Wilderland > Moria | 10.22.1.212/30 | 10.22.1.213 | 10.22.1.215 | 10.22.1.213 - 10.22.1.214 | 2 | 4 | 255.255.255.252 |
| **A8** | Palantir > Pelargir | 10.22.1.216/30 | 10.22.1.217 | 10.22.1.219 | 10.22.1.217 - 10.22.1.218 | 2 | 4 | 255.255.255.252 |
| **A9** | AnduinBanks > Pelargir | 10.22.1.220/30 | 10.22.1.221 | 10.22.1.223 | 10.22.1.221 - 10.22.1.222 | 2 | 4 | 255.255.255.252 |
| **A10** | Pelargir > Minastir | 10.22.1.224/30 | 10.22.1.225 | 10.22.1.227 | 10.22.1.225 - 10.22.1.226 | 2 | 4 | 255.255.255.252 |
| **A11** | Moria > Osgiliath | 10.22.1.228/30 | 10.22.1.229 | 10.22.1.231 | 10.22.1.229 - 10.22.1.230 | 2 | 4 | 255.255.255.252 |
| **A12** | Rivendell > Osgiliath | 10.22.1.232/30 | 10.22.1.233 | 10.22.1.235 | 10.22.1.233 - 10.22.1.234 | 2 | 4 | 255.255.255.252 |
| **A13** | Minastir > Osgiliath | 10.22.1.236/30 | 10.22.1.237 | 10.22.1.239 | 10.22.1.237 - 10.22.1.238 | 2 | 4 | 255.255.255.252 |
