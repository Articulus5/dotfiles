#!/usr/bin/bash

user=$USER
server=Methuselah
cred="/home/$user/.local/share/.samba_credentials"

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
	echo "Adding --clean or -c will clean up the mounts instead."
	exit 0
fi

for share in Shared Archive Scanner Video Music Photo Other ; do
	mountpoint=/mnt/share-$share

	if [ "$1" == "--clean" ] || [ "$1" == "-c" ]; then
		echo "unmounting and removing $mountpoint.."
		sudo umount $mountpoint
		sudo rmdir $mountpoint
	else
		echo "mounting //$server/$share to $mountpoint..."
		sudo mkdir -p $mountpoint
		if [ -f $cred ]; then
			sudo mount -t cifs -o credentials=$cred,uid=`id -u $user`,gid=`id -g $user` //$server/$share $mountpoint
		else
			sudo mount -t cifs -o username=$user,uid=`id -u $user`,gid=`id -g $user` //$server/$share $mountpoint
		fi
	fi
done
