##Atle Holm - 2009
#Reads from a csv file in the format DNS-Servername;IP
#The script then checks if the IP has a reverse lookup record in DNS.
#The result lists all reverse lookup records that are found or not. 
#The result can later be used to run CleanReverseDNS.ps1 for deletion of these reverse lookup zones

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

Write-Output "[$DATE $USERNAME] - CheckReverseDNS.ps1 $args" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH\CheckReverseDNS-STAT.log
Get-Content $args | % {  
	$field = $_.split(";")
	$lookup = nslookup $field[1]
	#$lookup
	$temp = $field[1]

	if ($lookup.count -gt 3) {
		$FQDN = $lookup[3].split(":")[1].trimstart(" ")
		$suffixSplit = $FQDN.split(".")

		$suffix = $()
		$count = $suffixSplit.count

		$suffix += $suffixSplit[$count - 2]
		$suffix += "."
		$suffix += $suffixSplit[$count - 1]

		Write-Output "IP $temp ble funnet, tilh&oslash;rende domene $suffix." >> "\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\IPCHECK_Funnet.log"
	} else {		
		Write-Output "IP $temp ble ikke funnet." >> "\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\IPCHECK_NA.log"
	}	
}