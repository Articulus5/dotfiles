#!/usr/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: mount_cifs.sh <mount point> <server> <share name>"
	exit 0
fi

user=$USER
cred="/home/$user/.local/share/.samba_credentials"
mountpoint=$1
server=$2
share=$3

if [ -z "$server" ]; then
	server=Methuselah
fi

if [ -z "$share" ]; then
	share=shared
fi

if [ -z "$mountpoint" ]; then
	mountpoint=temp
fi

echo "mounting //$server/$share to /mnt/$mountpoint..."

if [ -f $cred ]; then
	sudo mount -t cifs -o credentials=$cred,uid=`id -u $user`,gid=`id -g $user` //$server/$share /mnt/$mountpoint
else
	sudo mount -t cifs -o username=$user,uid=`id -u $user`,gid=`id -g $user` //$server/$share /mnt/$mountpoint
fi
