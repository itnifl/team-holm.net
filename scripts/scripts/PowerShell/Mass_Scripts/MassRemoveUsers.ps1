#Atle Holm - 2009

#Dette scriptet trenger tre filer tilgjengelige, en tekstfil for grupper, en for brukernes navn og en for logonnavn
#Det kan ikke eksistere blanke "characters" etter brukernavn eller andre navn i filene

$USERNAMESLOCATION = read-host "Skriv inn sti til tekstfil som inneholder brukernavn"
$USERNAMES = get-content $USERNAMESLOCATION 2>> $er

if ($?) {
	foreach ($USERNAME in $USERNAMES) {		
		remove-QADObject $USERNAME
	}
} else {
	write-output "An error occured: $er"
}
