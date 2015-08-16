#!/bin/bash
#
# Register with SpaceWalk for updates.
# Script is used as a part of a VMware template. 
# It ensures automatic registration to SpaceWalk given the right conditions.
#
# chkconfig: 12345 99 80
# description: Register with SpaceWalk for updates, see /etc/hosts for info
#

#Get the systems IP-address at eth0 - Before Centos 7:
#NETADDR=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

#Get the systems IP-address at ETHNAME - Centos 7:
ETHNAME=`/sbin/ifconfig | grep flags | cut -d: -f 1 | grep -v lo | head -1 | awk '{ print $1}'`
NETADDR=`/sbin/ifconfig $ETHNAME | grep -w inet | cut -d ' ' -f 10 | awk '{ print $1}'`

#Check that we are not in particular subnet before we continue:
if [[ $NETADDR =~ ^192\.168\.100\.[0-9] ]]; then
        echo "** Detected that we are in the lab network, therefore we are not registering."
else
        if [ -f /etc/sysconfig/rhn/systemid ]; then
                echo "** The file /etc/sysconfig/rhn/systemid was found, so assuming the system is already registered with SpaceWalk"
        else
                echo "** Seems the system is not registered with SpaceWalk"
                TEMPLATENAME="CENTOS64.TEMPLATE"
                if [ -f /etc/touchme ] || [ "$HOSTNAME" == "$TEMPLATENAME" ]; then
                        echo "** File /etc/touchme was found and/or hostname was CENTOS64.TEMPLATE, so not registering with SpaceWalk"
                else
                        echo "** File /etc/touchme was not found and hostname was not CENTOS64.TEMPLATE, therefore registering with SpaceWalk"
                        rhnreg_ks --serverUrl=http://the-spacewalkserver/XMLRPC --activationkey=8-778bfb0a8dcbf0889fbb829aaf27w261
                        if [ $? == 0 ]; then
                                touch /etc/touchme
                        fi
                fi
        fi
fi
