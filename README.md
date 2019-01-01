# MeanBox
Konfigurasi Vagrant untuk [M.E.A.N](https://mean.io)

## Port Forwarding
MeanBox dikonfigurasi dengan port forwarding dari localhost (127.0.0.1), dengan port sebagai berikut:
1. Host 2222 --> Guest 22
2. Host 8080 --> Guest 80
3. Host 8443 --> Guest 443
4. Host 3000 --> Guest 3000
5. Host 27107 --> Guest 27107

## Cara Penggunaan
Untuk menggunakan MeanBox diperlukan set up sebagai berikut:
1. VirtualBox, bisa diunduh dari <https://www.virtualbox.org/>
2. Vagrant, bisa diunduh dari <https://www.vagrantup.com/>

Selanjutnya konfigurasi MeanBox bisa dimulai dengan langkah berikut:
1. Download seluruh direktori MeanBox. Atau cara lain dengan git clone
2. Mulai konfigurasi dengan perintah: vagrant up
