#!/bin/bash
source global-settings.sh

# Customize here

uname='fabric'
homedir="/opt/$uname"
uid=4000
gid=4000
tz=$TZ
skeldir=$SKEL_DIR


# this function is sourced from `global-settings.sh`
create_user $uname $skeldir $homedir $uid $gid 
