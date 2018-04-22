
uname='media'
homedir="/opt/$uname"
uid=5000
gid=5000
cname=$uname  # docker container name


if getent passwd $uname > /dev/null 2>&1; then
    echo "User '$uname' already exists"
else
    echo "User '$uname' does not exist we will create directories"
		sudo mkdir $homedir
		sudo chown $uid:$gid $homedir
		sudo useradd -u $uid -g $gid $uname --home-dir $homedir
fi
