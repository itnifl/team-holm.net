##Atle Holm - 2009
#Reads from a csv file in the format dhcp-Servername;IP
#The script then checks if the IP's are reserved or not in DNS.
#The result from this script lists all reserved and non-reserverd IP adresses from 
#all DHCP servers in the csv file that is given as an argument to this script.
#This result can then be used when running 
#CleanReverseIP.ps1 to unreserve all the reserved IP's from theyr DHCP scopes


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

function Pause ($Message="Press any key to continue...")
{
	Write-Host -NoNewLine $Message
	$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	Write-Host ""
}

Write-Output "[$DATE $USERNAME] - CheckDHCP.ps1 $args" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH\CheckDHCP-STAT.log


$DHCPserver = "10.68.68.68"

Get-Content $args | % {  
	$field = $_.split(";")
	Write-Output "Field: $field"
	$currentIP = $field[1].trimstart(" ")
	Write-Output "Current IP: $currentIP"
	$currentIPs = $currentIP.split(".")
	Write-Output "Current IPs: $currentIPs"
	$scope = $currentIPs[0] + "." + $currentIPs[1] + "." + $currentIPs[2] + "." + "0"
	Write-Output "Scope: $scope"
	$reservedServers = netsh dhcp server $DHCPserver scope $scope show reservedip
	if ($reservedServers -ne "The command needs a valid Scope IP Address.") {
		$matched = $false
		foreach ($reservedServer in $reservedServers) {
			if ($reservedServer.contains("-") -and $reservedServer.contains(".")) {
				$reservedMACs = $reservedServer.substring("27")
				$reservedMACs = $reservedMACs.split("-")
				$reservedMAC = $()
				foreach ($MAC in $reservedMACs) {
					$reservedMAC += $MAC				
				}
				Write-Output "Evaluating Reserved MAC: $reservedMAC"
				$reservedIP = $reservedServer.split("-")[0].trimEnd(" ")
				$reservedIP = $reservedIP.trimstart(" ")
				Write-Output "Evaluating Reserved IP and MAC: $reservedIP $reservedMAC"
				if ($reservedIP -eq $currentIP) {
					Write-Output "`t$reservedIP matched $currentIP"
					$correctMAC = $reservedMAC
					$matched = $true
				} else {
					Write-Output "`t$reservedIP did not match $currentIP"

				}
			}			
		}
		if ($matched -eq $true) {
			Write-Host "The following is reserved in DHCP: $currentIP-$correctMAC Scope:$scope" -Foregroundcolor Yellow
			Write-Output "The following is reserved in DHCP: $currentIP-$correctMAC Scope:$scope" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\CHECK_DHCP_Found.log
		} else {
			Write-Host "The following is not reserved in DHCP: $currentIP Scope:$scope" -Foregroundcolor Yellow
			Write-Output "The following is not reserved in DHCP: $currentIP Scope:$scope" >> \\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\CHECK_DHCP_NA.log
		}
		pause
	} else {
		Write-Output "$scope: This is not a valid scope." >> \\(PLACE_TO_LOG)\$YEAR-$MONTH-$DAY\CHECK_DHCP_NA.log
	}
}