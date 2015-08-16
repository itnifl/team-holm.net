#Atle Holm - 2011
if (!$args) {
 	Write-Host "Dette scriptet brukes feks slik:"
	Write-Host "MassSetUsersAsMembers.ps1 C:\users.txt C:\groups.txt"
	Write-Host "Bruk /? som argument til scriptet for mer info."
 	break
} elseif ($args[0] -match "/\?{1}") {
 	Write-Host "Dette scriptet gj&oslash;r alle brukere spesifisert i f&oslash;rste `
	tekstfil til medlemmer i grupper spesifisert som andre argument i andre tekstfil"
	Write-Host "MassSetUsersAsMembers.ps1 C:\users.txt C:\groups.txt"
	break
}
if ($args.count -gt 2) {
	Write-Host "Du kan bare supplere to argument med dette scriptet."
	Write-Host "MassSetUsersAsMembers.ps1 C:\users.txt C:\groups.txt"
	break
}
$users = get-content $args[0]
$groups = get-content $args[1]

foreach ($group in $groups) {
	foreach ($user in $users) {
		Add-QADGroupMember -Identity $group -Member $user
	}
}
