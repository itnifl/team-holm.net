#Atle Holm - 2009
if (!$args) {
 	Write-Host "Dette scriptet brukes feks slik:"
	Write-Host "MassMoveUsers.ps1 C:\users.txt"
 	Write-Host "Deretter vil scriptet sp&oslash;rre om n&oslash;dvendige detaljer."
 	Write-Host "Feks hvor brukerne skal flyttes til."
 	break
} elseif ($args -match "/\?{1}") {
 	Write-Host "Dette scriptet kopierer alle brukere til en OU bestemt av bruker."
	Write-Host "Hver linje i tekstfilen m&aring; v&aelig;re av type domene\bruker"
	break
}
if ($args.count -gt 1) {
	Write-Host "Du kan bare supplere ett argument med dette scriptet."
	Write-Host "Dette argumentet er da filen som lister brukerne scriptet skal behandle."
	break
}

$fullPath = Read-Host "Skriv inn domene og AD sti til OU der brukere skal flyttes (feks cust.providernet.no/Users)"
$users = Get-Content $args

foreach ($user in $users) {
	move-QADObject $user -NewParentContainer $fullPath
}
