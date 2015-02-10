#!/bin/bash

logs=/target/var/log/installer/debug

exec >> $logs 2>&1

function error() {
	echo "Error: $*"
}

echo "#Sources in sources.list.d" > /target/etc/apt/sources.list

chmod 644 /target/etc/apt/sources.list

