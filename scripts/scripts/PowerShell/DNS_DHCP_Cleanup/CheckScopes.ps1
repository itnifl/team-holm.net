#Atle Holm - 2009
#Dette scriptet sjekker befoolkningen p&aring; alle scopes p&aring; gitt DHCP server

$DHCPServer = "10.68.68.68"
$scopeSamling = netsh dhcp server $DHCPServer show scope

$count = 0
$totalPopulation = 0
foreach($scope in $scopeSamling) {
	if ($scope.contains(".")) {
		$scopeIP = ($scope.split("-")[0].trimEnd(" ")).trimStart(" ")
		Write-Output "Working with: $scopeIP"
		$scopeList = netsh dhcp server $DHCPServer scope $scopeIP show clients
		if ($scopeList[$scopeList.count - 3] -ne "The command needs a valid Scope IP Address." -and $scopeList[$scopeList.count - 3].contains("version")) {
			$temp = "Working with: " + $scopeList[$scopeList.count - 3]
			Write-Output $temp
			$scopePopulation = $scopeList[$scopeList.count - 3].split(":")[1].substring(1,1)
			$count++
			#Seems as if the server does not like to be flooded
			if($count -gt 20) {
				$count = 0
				Start-Sleep -m 10000
			}
			Write-Output "This scope is populated by the following number of inhabitants: $scopePopulation`n"
			$totalPopulation += $scopePopulation
			if ($scopePopulation -eq "0") {
				Write-Output "Scope: $scopeIP has a scope-population of $scopePopulation" >> .\DHCP_scopes_NA.log
			} else {
				Write-Output "Scope: $scopeIP has a scope-population of $scopePopulation" >> .\DHCP_scopes_OK.log
			}
		}		
	}
}
Write-Output "There has bee counted up $totalPopulation clients." >> .\DHCP_scopes_OK.log