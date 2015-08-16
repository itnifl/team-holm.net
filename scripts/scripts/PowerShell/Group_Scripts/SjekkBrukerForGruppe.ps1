##Atle Holm - 2009
#Sjekker om brukere er medlem av en bestemt gruppe

$users = Get-Content $args
$group = Read-Host "Skriv gruppenavnet som brukere skal sjekkes for"
$pathN = Read-Host "Skriv inn sti hvor resultatene skal logges"
$log = "users-VS-$group.log"

$exists = $false
$endret = $false

$DATEX = Get-Date

foreach ($user in $users) {
	echo "Sjekker n&aring;: $user"
	$QADuser = Get-QADUser $user
	$userGroups = $QADuser.memberof | % { $_.split(",")[0].substring(3) }
	foreach ($userGroup in $userGroups) {
		if ($userGroup -eq $group) {
			$exists = $true
		}
	}
	if (exists eq $true) {
		echo "$DATEX - $user er medlem av $group" >> $pathN\$log
	} else {
		echo "$DATEX - $user er IKKE medlem av $group" >> $pathN\$log
	}
	$exists = $false
}