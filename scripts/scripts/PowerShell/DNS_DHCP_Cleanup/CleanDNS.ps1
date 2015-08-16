##Atle Holm - 2009
#Reads from the result of the script: CheckDNS.ps1
#Deletes all DNS records listed there


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

Write-Output "[$DATE $USERNAME] - CleanDNS.ps1 $args" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH\CleanDNS-STAT.log

Get-Content $args | % {  
	$field = $_.split(" ")[1]
	$lookup = nslookup $field
	if ($lookup.count -gt 3) {
		$FQDN = $lookup[0].split(":")[1].trimstart(" ")
		$suffixSplit = $FQDN.split(".")
		$dnsserver = $lookup[1].split(":")[1].trimstart(" ")

		$suffix = $()
		$count = $suffixSplit.count

		$suffix += $suffixSplit[$count - 2]
		$suffix += "."
		$suffix += $suffixSplit[$count - 1]

		\\(PLACE_TO_BAT)\DNSDEL.bat $suffix $field $dnsserver
	} else {
		$temp = $field
		Write-Output "DNS-navnet $temp ble ikke funnet, og kan derfor ikke slettes. Det er nok slettet fra f&oslash;r." `
		>> "\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\EDBOpersrv-DNS-err.log"
	}
	
}