# sudo groupadd --gid=5000 media
sudo useradd -u 5001 transmission
sudo useradd -u 5002 jackett
sudo useradd -u 5003 sonarr
sudo useradd -u 5004 radarr

sudo usermod -a -G media transmission
sudo usermod -a -G media jackett
sudo usermod -a -G media sonarr
sudo usermod -a -G media radarr
