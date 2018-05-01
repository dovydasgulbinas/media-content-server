
uname='world'
homedir="/opt/$uname"
uid=5200
gid=5200
tz='Europe/Vilnius'


if getent passwd $uname > /dev/null 2>&1; then
    echo "User '$uname' already exists"
else
    echo "User '$uname' does not exist we will create directories"
		sudo mkdir -p $homedir
		sudo chown $uid:$gid $homedir
		sudo useradd -u $uid --home-dir=$homedir $uname
fi
