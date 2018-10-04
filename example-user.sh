#!/bin/bash
source global-settings.sh

# Customize here

uname='example'
homedir="/opt/$uname"
uid=7000
gid=7000
tz=$TZ
skeldir=$SKEL_DIR


# this function is sourced from `global-settings.sh`
create_user $uname $skeldir $homedir $uid $gid 
