#Atle Holm - 2009
#Checks if users are in AD and if they are enabled or disabled, if they are locked out or not.
if (!$args) {
 	Write-Host "Dette scriptet brukes feks slik:"
	Write-Host "MassCheckUserStatus.ps1 C:\users.txt"
 	break
} elseif ($args -match "/\?{1}") {
 	Write-Host "Dette scriptet sjekker om alle brukere angitt i en tekstfil som argument er i AD og om de er enabled/disabled."
	Write-Host "Ogs&aring; om de er l&aring;st ute eller ikke. Resultat pipes ut til AD.txt og NotAd.txt i st&aring;ende katalog."
	Write-Host "Hver linje i tekstfilen m&aring; v&oslash;re av type domene\bruker"
	break
}
if ($args.count -gt 1) {
	Write-Host "Du kan bare supplere ett argument med dette scriptet."
	Write-Host "Dette argumentet er da filen som lister brukerne scriptet skal behandle."
	break
}
$Users = Get-Content $args
$domene = Read-Host "Skriv inn domenet du operer i "
foreach ($User in $Users) {
	$Container = Get-QADUser $User

	if (($domene + "\" + $Container.SamAccountName) -eq $User) {
		Write-Output "<-->" >> AD.txt
		
		Write-Output ($Container.SamAccountName + " is in AD") >> AD.txt
		if ($Container.AccountIsDisabled) {Write-Output "$User Account Disabled Status: Disabled" >> AD.txt}
		if (!$Container.AccountIsDisabled) {Write-Output "$User Account Disabled Status: Not Disabled" >> AD.txt}
		if ($Container.AccountIsLockedOut) {Write-Output "$User Account Locked Out Status: Locked Out" >> AD.txt}
		if (!$Container.AccountIsLockedOut) {Write-Output "$User Account Locked Out Status: Not Locked Out" >> AD.txt}
		Write-Output "<-->" >> AD.txt
		Write-Output "<-->"
	} else {
		Write-Output "$User is not in AD" >> NotAD.txt
	}
}
Write-Output "Se NotAD.txt og AD.txt for detaljer."