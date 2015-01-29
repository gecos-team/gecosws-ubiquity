#!/bin/bash

logs=/target/var/log/installer/debug

exec >> $logs 2>&1

function error() {
	echo "Error: $*"
}

echo "#Sources in sources.list.d" > /target/etc/apt/sources.list

chmod 644 /target/etc/apt/sources.list

mkdir -p /target/usr/share/ca-certificates-imported/

chmod 644 /target/usr/share/ca-certificates-imported/

for cert in `ls /target/usr/share/ca-certificates/*/*`
do
    chroot /target keytool -cacert -keystore '/etc/java/cacerts-gcj' -file '$cert'
    cp -a $cert /target/usr/share/ca-certificates-imported/
done

