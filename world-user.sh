#!/bin/bash
source global-settings.sh

# Customize here

uname='world'
homedir="/opt/$uname"
uid=5200
gid=5200
tz=$TZ
skeldir=$SKEL_DIR


# this function is sourced from `global-settings.sh`
create_user $uname $skeldir $homedir $uid $gid

