#!/bin/bash

BACKUP_PATH='/root/mongobackup'

HOST='127.0.0.1:27017'

USERNAME=''

PASSWORD=''

DATABASE=''

AUTHENTICATION_DATABASE='admin'

RETAIN_DAYS=3

if [[ ! -d $BACKUP_PATH ]]; then
    mkdir $BACKUP_PATH
    chmod 700 $BACKUP_PATH
fi

mongodump --host=$HOST --username=$USERNAME --password=$PASSWORD --db=$DATABASE --authenticationDatabase=$AUTHENTICATION_DATABASE --out="$BACKUP_PATH/$(date '+%d%b%Y')/"

OLD_BACKUP="$BACKUP_PATH/$(date --date="$RETAIN_DAYS days ago" '+%d%b%Y')"

if [[ -d $OLD_BACKUP ]]; then
    rm -rf $OLD_BACKUP
fi
