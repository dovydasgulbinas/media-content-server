
uname='media'
homedir="/opt/$uname"
uid=5000
gid=5000
tz='Europe/Vilnius'
ip='192.168.0.8'


if getent passwd $uname > /dev/null 2>&1; then
    echo "User '$uname' already exists"
else
    echo "User '$uname' does not exist we will create directories"
		sudo mkdir -p $homedir
		sudo chown $uid:$gid $homedir
		sudo useradd -u $uid --home-dir=$homedir $uname
fi
