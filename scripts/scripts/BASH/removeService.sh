#! /bin/bash
## 02.08.2009 - Atle Holm
## Scriptet fjerner bare symlinks under /etc/rc?.d - THIS IS NOT THE RIGHT WAY TO DO THIS!
##Use update-rc.d instead to do this the right way
if [ $# != 1 ]; then echo "You have to have one argument, the service name you want to remove!"; exit 1; fi

echo "Starting removal of service.." >> /var/log/RemoveService-log.log
echo "`date` - Removing service *$1*" >> /var/log/RemoveService-log.log
X=0
ErrCount=0
while [ $X != 7 ]
do
	FINDING=`find /etc/rc$X.d -name *$1* 2>> /var/log/RemoveService-log.log` 
	if [ $? != 0 ]; then 
		echo "Encountered an error, exiting!"; 
		echo "Encountered an error, exiting!" >> /var/log/RemoveService-log.log; 
		exit 1;
	fi
	for FOUND in ${FINDING}
	do
		echo "Removing ${FOUND}"
		rm ${FOUND} >> /var/log/RemoveService-log.log 2>> /var/log/RemoveService-log.log
		echo "${FOUND} deleted!" >> /var/log/RemoveService-log.log
	done
	if [ -z ${FINDING} ]; then 
		echo "Service was not found at /etc/rc$X.d"; (( ErrCount = ErrCount + 1 )); 
	fi
	(( X=X+1 ))
done 
if [ $ErrCount = 7 ]; then echo "Service *$1* was not found!" >> /var/log/RemoveService-log.log; fi
echo "Done!" >> /var/log/RemoveService-log.log
echo "Done!"; exit 0