#!/bin/bash

#Installation and configuration
sudo apt update
wait $!
sleep 0.5
sudo apt install -y nginx
wait $!
sleep 0.5
sudo apt install -y torbrowser-launcher
wait $!
sleep 0.5
sudo apt install -y curl
wait $!
sleep 0.5
sudo apt install -y tar
wait $!
sleep 0.5
sudo apt install -y php
wait $!
sleep 0.5

#Uncomment if tor application was not installed
#cd ".."
#cd "Downloads"
#curl -O https://tor.eff.org/dist/torbrowser/11.5.8/tor-browser-linux64-11.5.8_en-US.tar.xz
#mkdir tor-browser_en
#tar -xf tor-browser-linux64-11.5.8_en-US.tar.xz -C tor-browser_en --strip-components=1

cd "/var"
sudo chmod 777 /var
cd "/var/www"
sudo chmod 777 /var/www
cd /"var/www/html"
sudo chmod 777 /var/www/html

sed -i '71, 72 s/^#//' /etc/tor/torrc

sudo su <<EOF
 cd "/var/lib"
 chmod 777 tor
 cd "/var/lib/tor"
 mkdir hidden_service
 chmod 777 hidden_service/
 exit
EOF

sudo chmod 700 /var/lib/tor/hidden_service 

sudo systemctl stop tor
sudo systemctl start tor

echo ""
echo "Installation finished"
echo "Make now the command sudo bash startlocal.sh"

