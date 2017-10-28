#!/bin/bash

# change to your desired name
name="server"


sudo echo "127.0.1.1	$name" | sudo tee -a /etc/hosts
sudo hostname $name
#sudo echo "$name" | sudo tee -a /etc/hostname
#sudo /etc/init.d/hostname.sh
#systemctl start hostname

sudo apt update
sudo apt -y upgrade 
sudo apt install -y avahi-daemon
systemctl status avahi-daemon

echo "In order for hostname to change you must reboot run: 'sudo reboot'"
echo "After that make sure the that 'host $name.local' resolves your machines IP"
