##Atle Holm - 2009
#Reads from a csv file in the format DNS-Servername;IP
#The script will then create a result in \\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY where it lists all active DNS names
#The result listing is later used to delete the records that are active via the script CleanDNS.ps1

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

Write-Output "[$DATE $USERNAME] - CheckDNS.ps1 $args" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH\Check_DNS-STAT.log

Get-Content $args | % {  
	$field = $_.split(";")
	$lookup = nslookup $field[0]
	#$lookup
	$temp = $field[0]

	if ($lookup.count -gt 3) {
		$FQDN = $lookup[3].split(":")[1].trimstart(" ")
		$suffixSplit = $FQDN.split(".")

		$suffix = $()
		$count = $suffixSplit.count

		$suffix += $suffixSplit[$count - 2]
		$suffix += "."
		$suffix += $suffixSplit[$count - 1]

		Write-Output "DNS-navnet $temp ble funnet, tilh&oslashrende domene $suffix." >> "\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\CHECK_Found.log"
	} else {		
		Write-Output "DNS-navnet $temp ble ikke funnet." >> "\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\CHECK_NA.log"
	}
	
}