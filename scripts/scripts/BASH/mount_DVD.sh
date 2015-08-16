#! /bin/bash
##04.02.2009 - Atle Holm

if [ $# -lt  1 ] || [ $# -gt 1 ]; then
	echo "You have to have 1 and you can only have 1 option, the number on the Debian DVD you want to mount!"
	exit 0
fi
case "$1" in
	1)
	umount /cdrom 2>> /dev/NULL
	mount -t iso9660 -o loop /home/Sources/ISO/debian-500-amd64-DVD-1.iso /cdrom
	echo "DVD1 mounted"
	;;
	2)
	umount /cdrom 2>> /dev/NULL
	mount -t iso9660 -o loop /home/Sources/ISO/debian-500-amd64-DVD-2.iso /cdrom
	echo "DVD2 mounted"
	;;
	3)
	umount /cdrom 2>> /dev/NULL
	mount -t iso9660 -o loop /home/Sources/ISO/debian-500-amd64-DVD-3.iso /cdrom
	echo "DVD3 mounted"
	;;
	4)
	umount /cdrom 2>> /dev/NULL
	mount -t iso9660 -o loop /home/Sources/ISO/debian-500-amd64-DVD-4.iso /cdrom
	echo "DVD4 mounted"
	;;
	5)
	umount /cdrom 2>> /dev/NULL
	mount -t iso9660 -o loop /home/Sources/ISO/debian-500-amd64-DVD-5.iso /cdrom
	echo "DVD5 mounted"
	;;
	*) echo "You can only choose from 1 to 5"
esac