#Atle Holm - 2013
#Lists the amount of time the vCenter service has been running.
#NB! Use this on a server with a vCenter service! :)

New-TimeSpan -Start (get-process vpxd).StartTime