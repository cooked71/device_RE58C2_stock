#!/sbin/sh

# Wait for 30 seconds to let recovery settle
sleep 60

SRC="/cache"
DST="/storage/7BC1-1BE6/cache_backup"

mkdir -p $DST
cp -r $SRC/* $DST/
sync
