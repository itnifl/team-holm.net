##Atle Holm - 2009
#Reads from the result of CheckDHCP.ps1 and deletes all reservations listed there

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

Write-Output "[$DATE $USERNAME] - CleanDHCP.ps1 $args" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH\CleanDHCP-STAT.log


$dhcpServer = "10.68.68.68"

Get-Content $args | % {
	$IPMAC = $_.split(":")[1]
	$scope = $_.split(":")[2]
	Write-Output "Scope: $scope"
	$IP = $IPMAC.split("-")[0].trimstart(" ")
	Write-Output "IP: $IP"
	$MAC = $IPMAC.split("-")[1].substring(0,12)
	Write-Output "MAC: $MAC"
	netsh dhcp server $dhcpServer scope $scope delete reservedip $IP $MAC
	if ($LASTEXITCODE -eq "0") {
		Write-Output "Sletting av $IP og $MAC p&aring; $dhcpServer under scopet $scope var vellykket!" >> `
		\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\ERASE_DHCP_OK.log
	} else {
		Write-Output "Sletting av $IP og $MAC p&aring; $dhcpServer under scopet $scope var ikke vellykket!" >> `
		\\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\ERASE_DHCP_NA.log
	}
}