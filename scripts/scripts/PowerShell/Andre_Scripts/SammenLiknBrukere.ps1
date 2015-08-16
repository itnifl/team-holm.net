##Atle Holm - 2010
#Finner ulikheter i gruppetilh&oslash;righeter mellom bruker 1 og 2(sammenlikningsident).

$userOne = Read-Host "Skriv brukernavn til f&oslash;rste bruker som skal sammenliknes"
$userTwo = Read-Host "Skriv brukernavn til andre bruker som skal sammenliknes"
$pathN = Read-Host "Skriv inn sti hvor resultatene skal logges"

$log = "$userOne-ulikheterVS-$userTwo.log"
$exists = $false
$endret = $false

$DATEX = Get-Date

Write-Host "Sammenlikner $userOne med $userTwo"

$QADuserOne = Get-QADUser $userOne
$QADuserTwo = Get-QADUser $userTwo

$userOneGroups = $QADuserOne.memberof | % { $_.split(",")[0].substring(3) }
$userTwoGroups = $QADuserTwo.memberof | % { $_.split(",")[0].substring(3) }

#Write-Output "$QADuserOne has the groups:`n $userOneGroups"
#Write-Output "$QADuserTwo has the groups:`n $userTwoGroups"

foreach ($userOneGroup in $userOneGroups) {
	foreach ($userTwoGroup in $userTwoGroups) {
		Write-Output "$userOneGroup sammenliknes med $userTwoGroup"
		if ($userOneGroup -eq $userTwoGroup) {
			$exists = $true
		} 
	}
	if ($exists -ne $true) {
		$userOneGroup >> $pathN\$log		
		$endret = $true
	}
	$exists = $false
}
if ($endret -eq $false) {
	Write-Output "Det ble ikke funnet noen ulikheter mellom $userOne og $userTwo" >> $pathN\$log
}
Write-Host "Se $pathN\$log"