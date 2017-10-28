sudo useradd -u 1999 transmission
sudo useradd -u 2000 jackett
sudo useradd -u 2001 sonarr
sudo useradd -u 2002 radarr

sudo usermod -a -G transmission jackett
sudo usermod -a -G transmission sonarr
sudo usermod -a -G transmission radarr
