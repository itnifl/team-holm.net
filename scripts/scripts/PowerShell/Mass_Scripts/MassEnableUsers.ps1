#Atle Holm - 2009
#Sjekker om det er lagt ved et argument, som trengs
if (!$args) {
 	Write-Host "Dette scriptet brukes feks slik:"
	Write-Host "MassEnableUsers.ps1 C:\users.txt"
 	Write-Host "Deretter vil scriptet sp&oslash;rre om n&oslash;dvendige detaljer."
 	break
} elseif ($args -match "/\?{1}") {
 	Write-Host "Dette scriptet disabler alle brukere angitt i en tekstfil som argument."
	Write-Host "Hver linje i tekstfilen m&aring; v&aelig;re av type domene\bruker"
	break
}
if ($args.count -gt 1) {
	Write-Host "Du kan bare supplere ett argument med dette scriptet."
	Write-Host "Dette argumentet er da filen som lister brukerne scriptet skal behandle."
	break
}
$users = Get-Content $args
foreach ($user in $users) {
	enable-QADUser $user
}
