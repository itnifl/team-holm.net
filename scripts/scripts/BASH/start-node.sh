#! /bin/bash
### BEGIN INIT INFO
# Provides:          start-node
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Initscript for node API
# Description:  Automatically start node API when the system starts up.
#               Provide commands for manually starting and stopping node API.
#				This script needs to be edited before it works in your environment.
#				In a CentOS/RedHat based environment it can be stored under 
#				/etc/init.d/[name] and added to the system with chkconfig --add [name] --level 0356
#				In a Debian based environment it can be stored under 
#				/etc/init.d/[name] and added to the system with update-rc.d [name] defaults
#				In CentOs this script depends on the rpm package redhat-lsb
### END INIT INFO
# Adapt the following lines to your configuration
# RUNUSER: The user to run start-node as.
RUNUSER=root
# NODE_INSTALLDIR: The path to the code where the node API is
NODE_INSTALLDIR="/home/node/api"
# ==================================================================================
# ==================================================================================
# ==================================================================================
# PATH should only include /usr/* if it runs after the mountnfs.sh script
PATH=/sbin:/usr/sbin:/bin:/usr/bin:$NODE_INSTALLDIR;
DESC="node API"
NAME=start-node
SCRIPTNAME=/etc/init.d/$NAME
# Define LSB log_* functions.
# To be replaced by LSB functions
# Defined here for distributions that don't define
# log_daemon_msg
log_daemon_msg () {
    echo $@
}
# To be replaced by LSB functions
# Defined here for distributions that don't define
# log_end_msg
log_end_msg () {
    retval=$1
    if [ $retval -eq 0 ]; then
        echo "."
    else
        echo " failed!"
    fi
    return $retval
}
# Depend on lsb-base (>= 3.0-6) to ensure that this file is present.
. /lib/lsb/init-functions
 
run_with_home() {
if ps aux | grep "$NODE_INSTALLDIR/[s]erver.js" > /dev/null; then
    log_failure_msg "$NAME is already running."
else
    echo "Logging to /tmp/start-node.log"
    if [ "$RUNUSER" != "$USER" ]; then
        su - "$RUNUSER" -c "nohup node ${NODE_INSTALLDIR}/$1 > /tmp/start-node.log 2>/dev/null &"
    else
        nohup node ${NODE_INSTALLDIR}/$1 > /tmp/start-node.log 2>/dev/null &
    fi
fi
}
#
# Function that starts the daemon/service
#
do_start()
{
    run_with_home server.js
}
#
# Function that stops the daemon/service
#
do_stop()
{
if ps aux | grep "$NODE_INSTALLDIR/[s]erver.js" > /dev/null; then
     # node is running
        killall node
  else
     # node is not running
        log_failure_msg "$NAME is not running."
fi
}
 
case "$1" in
  start)
    [ "$VERBOSE" != no ] && log_daemon_msg "Starting $DESC" "$NAME"
    do_start
    case "$?" in
        0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
        2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
    esac
    ;;
  stop)
    [ "$VERBOSE" != no ] && log_daemon_msg "Stopping $DESC" "$NAME"
    do_stop
    case "$?" in
        0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
        2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
    esac
    ;;
  status)
       if ps aux | grep "$NODE_INSTALLDIR/[s]erver.js" > /dev/null; then
        log_daemon_msg "$NAME is running" && exit 0 || exit $?
       fi
        log_failure_msg "$NAME is not running."
        return 1
       ;;
  restart|force-reload)
    #
    # If the "reload" option is implemented then remove the
    # 'force-reload' alias
    #
    log_daemon_msg "Restarting $DESC" "$NAME"
    do_stop
    case "$?" in
      0|1)
        do_start
        case "$?" in
            0) log_end_msg 0 ;;
            1) log_end_msg 1 ;; # Old process is still running
            *) log_end_msg 1 ;; # Failed to start
        esac
        ;;
      *)
        # Failed to stop
        log_end_msg 1
        ;;
    esac
    ;;
  *)
    echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
    exit 3
    ;;
esac