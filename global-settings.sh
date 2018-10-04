#!/bin/bash
export MEDIA_DATA_ROOT='/media/raid/media'
export MEDIA_SYNC_ROOT="$MEDIA_DATA_ROOT/sync-shares"
export MEDIA_NEXTCLOUD_ROOT="$MEDIA_DATA_ROOT/sync-shares/nextcloud"
export SKEL_DIR='/etc/skel'
export TZ='Europe/Vilnius'

function create_user(){

 if [ $# -ne 5 ]; then

    echo "usage: create_user <uname> <skeldir> <homedir> <uid> <gid>"
    echo "vars:"
    echo '    $1 - uname'
    echo '    $2 - skeldir'
    echo '    $3 - homedir'
    echo '    $4 - uid'
    echo '    $5 - gid'
    exit 0
 fi

 if getent passwd $1 > /dev/null 2>&1; then
     echo "User '$1' already exists"
 else
     echo "User '$1' does not exist we will create directories"
         sudo cp -r $2 $3
         sudo chown -R $4:$5 $3
         sudo useradd -u $4 --home-dir=$3 $1
         sudo chsh -s /bin/bash $1
 fi

}
