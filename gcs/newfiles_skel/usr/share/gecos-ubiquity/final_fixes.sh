#!/bin/bash

logs=/target/var/log/installer/debug

exec >> $logs 2>&1

function error() {
	echo "Error: $*"
}

echo "#Sources in sources.list.d" > /target/etc/apt/sources.list

chmod 644 /target/etc/apt/sources.list

# Uninstall this package
chroot /target dpkg -r gecosws-ubiquity

# Uninstall ubiquity
chroot /target dpkg --purge ubiquity ubiquity-casper ubiquity-frontend-gtk ubiquity-ubuntu-artwork
chroot /target dpkg --purge ubiquity
chroot /target apt -y autoremove

# Stop chef service
chroot /target /bin/systemctl disable chef-client.service

