#!/bin/bash

#determine the ps name, log file, pid file for restart proccess checking
ps_name="test_monitoring"
logs="/var/log/monitoring.log"
restart_check="/tmp/test_monitoring.pid"

#give access for log file
touch /var/log/monitoring.log && chmod 777 /var/log/monitoring.log

#check if ps running
if [ $(pgrep -x "$ps_name" | grep -c .) -ge 1 ]; then
	#check server - UP or DOWN
	if curl https://test.com/monitoring/test/api > /dev/null; then
        	echo "$(date) The proccess is running and server is available" >> "$logs"
        else echo "$(date) The procces is running and server is NOT available" >> "$logs"
        fi

	#check proccess state
       if [ -f $(restart_check) ]; then
	if [ $(cat $(restart_check)) != $(pgrep -x "$ps_name") ]; then
		echo "$(date) The proccess was restarted" >> "$logs"
	fi
       fi
       echo $(pgrep -x "$ps_name") > "$restart_check"
else
	exit 0 #do nothing if ps is not running
fi
