##Atle Holm - 2009
#Reads from the result of CheckReverseDNS.ps1 and deletes all reverse DNS lookup records

$DAY = (get-date -displayHint date).day
$MONTH = (get-date -displayHint date).month
$YEAR = (get-date -displayHint date).year

if ($DAY -lt 10) {$DAY = "0" + $DAY}
if ($MONTH -lt 10) {$MONTH = "0" + $MONTH}

$USERNAME = (([System.Security.Principal.WindowsIdentity]::GetCurrent()).name).split("\")[1]
$COMPUTERNAME = (Get-wmiObject -class win32_computerSystem).name

if ((Test-Path -type container \\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY) -eq $false) {
	New-Item \\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY -type directory
}
if ((Test-Path -type container \\(PLACE_TO_LOG)\$YEAR-$MONTH) -eq $false) {
	New-Item \\(PLACE_TO_LOG)\$YEAR-$MONTH -type directory
}

Write-Output "[$DATE $USERNAME] - CleanReverseDNS.ps1 $args" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH\CleanReverseDNS-STAT.log

$DNSsrv = "10.54.54.54"

Get-Content $args | % {  
	$field = $_.split(" ")[1]
	$lookup = nslookup $field
	$IP = $field
	if ($lookup.count -gt 3) {
		$FQDN = $lookup[3].split(":")[1].trimstart(" ")
		$IPS = $field.split(".")
		$dnsserver = $lookup[1].split(":")[1].trimstart(" ")

		$suffix = $()

		$suffix += $IPS[1]
		$suffix += "."
		$suffix += $IPS[0]
		$suffix += ".in-addr.arpa"

		$addr = $IPS[3]
		$addr += "."
		$addr += $IPS[2]

		\\(PLACE_TO_BAT)\ReverseDel.bat $DNSsrv $suffix $addr $FQDN $IP
	} else {
		$temp = $field
		Write-Output "IP $temp ble ikke funnet, og kan derfor ikke slettes. Det er nok slettet fra f&oslash;r." `
		>> "\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\IP-err.log"
	}
	
}