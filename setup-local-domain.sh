#!/bin/bash

# change to your desired name
name="home-server"

sudo apt update
sudo apt -y upgrade 
sudo apt install -y avahi-daemon

sudo echo "127.0.1.1	$name" | sudo tee -a /etc/hosts
sudo echo "$name" | sudo tee -a /etc/hostname
sudo /etc/init.d/hostname.sh

echo "In order for hostname to change you must reboot run: 'sudo reboot'"
echo "After that make sure the that 'host $name.local' resolves your machines IP"
