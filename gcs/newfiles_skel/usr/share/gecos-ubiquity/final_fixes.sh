#!/bin/bash

logs=/target/var/log/installer/debug

exec >> $logs 2>&1

function error() {
	echo "Error: $*"
}

cp -v /usr/share/gecos-system-conf/apt-archives/sources.list /target/etc/apt/sources.list || error "copying sources.list"

chmod 644 /target/etc/apt/sources.list

rm -f /target/etc/apt/sources.list.d/*

