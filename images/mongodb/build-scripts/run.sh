#!/bin/bash
set -m
 
mongodb_cmd="mongod --storageEngine $STORAGE_ENGINE --host 0.0.0.0"
cmd="$mongodb_cmd"
if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi
 
if [ "$JOURNALING" == "no" ]; then
    cmd="$cmd --nojournal"
fi
 
if [ "$OPLOG_SIZE" != "" ]; then
    cmd="$cmd --oplogSize $OPLOG_SIZE"
fi
 
$cmd &
 
if [ ! -f /data/db/.build-admin ]; then
    /build-scripts/build-admin.sh
fi
 
fg