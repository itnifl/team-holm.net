#Atle Holm - 2008/2009
#Sjekker om det er lagt ved et argument, som trengs
if (!$args) {
 	Write-Host "Dette scriptet brukes feks slik:"
	Write-Host "AddMember2Groups.ps1 C:\obj.txt"
 	Write-Host "Deretter vil scriptet sp&oslash;rre om n&oslash;dvendige detaljer."
 	break
} elseif ($args -match "/\?{1}") {
 	Write-Host "Dette scriptet gj&oslash;r et objekt til medlem av alle objekter listet i en tekstfil."
	Write-Host "Scriptet sp&oslash;r senere etter brukernavn/gruppenavn som skal ha de nye medlemskapene."
	Write-Host "AddMember2Groups.ps1 C:\obj.txt"
	break
}
if ($args.count -gt 1) {
	Write-Host "Du kan bare supplere ett argument med dette scriptet."
	Write-Host "AddMember2Groups.ps1 C:\obj.txt"
	break
}
$objekter = get-content $args
$target = Read-Host "Skriv inn navn p&aring; objekt som skal f&aring; de nye tilh&oslash;righetene"
foreach ($objekt in $objekter) {
	Add-QADGroupMember -Identity $objekt -Member $target
}
