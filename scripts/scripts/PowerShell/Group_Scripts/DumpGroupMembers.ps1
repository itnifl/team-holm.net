#Atle Holm - 2009
if ($args -match "/\?{1}" -or $args[0] -match "/\?{1}") {
 	Write-Host "Dette scriptet dumper medlemene av en gruppe til fil."
	Write-Host "Den aktuelle gruppen skal v&aelig;re et argument til scriptet."
	Write-Host "`nDu m&aring; ha to argument med dette scriptet:"
	Write-Host "`t1. Gruppen som skal behandles" -ForegroundColor yellow
	Write-Host "`t2. Sti til der resultatfila skal dumpes" -ForegroundColor yellow
 	break
}
if ($args.count -ne 2) {
	Write-Host "Du m&aring; ha to argument med dette scriptet:"
	Write-Host "`t1. Gruppen som skal behandles" -ForegroundColor yellow
	Write-Host "`t2. Sti til der resultatfila skal dumpes" -ForegroundColor yellow
	break
}

$uRetreive = $args[0]
$PATHN = $args[1]
$userNames = @()
$logonNames = @()
$temp = $()

$file = "Dump-$uRetreive.log"
Write-Output "*GRUPPENS MEDLEMMER:" >> $PATHN\$file
foreach ($user in ((Get-QADgroup $uRetreive).get_allMembers() | Get-QADuser)) {
	$temp = $user.get_displayname()
	Write-Output "Henter DisplayName $temp"
	$userNames += $temp
} 
foreach ($logon in ((Get-QADgroup $uRetreive).get_allMembers() | Get-QADuser)) { 
	$temp = $user.get_logonname()
	Write-Output "Henter LogonName $temp"
	$logonNames += $temp
} 
for ($X = 0; $X -lt $userNames.count; $X++) {
	$temp = $userNames[$X] + " -- " + $logonNames[$X]	 
	Write-Output $temp >> $PATHN\$file
}

$userNames = @()
$logonNames = @()
Write-Output "*GRUPPENS N&Oslash;STEDE MEDLEMMER:" >> $PATHN\$file
foreach ($user in ((Get-QADgroup $uRetreive).get_nestedmembers() | Get-QADuser)) { 
	$temp = $user.get_displayname()
	Write-Output "Henter DisplayName $temp"
	$userNames += $temp
} 
foreach ($logon in ((Get-QADgroup $uRetreive).get_nestedmembers() | Get-QADuser)) { 
	$temp = $user.get_logonname()
	Write-Output "Henter LogonName $temp"
	$logonNames += $temp
} 
for ($X = 0; $X -lt $userNames.count; $X++) {
	$temp = $userNames[$X] + " -- " + $logonNames[$X]	
	Write-Output $temp >> $PATHN\$file
}

Write-Host "Resultatene finner du i $PATHN\$file."