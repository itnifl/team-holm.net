#Atle Holm - 2009
#Dette scriptet trenger en fil tilgjengelig, en tekstfil som inneholder informasjon av typen:
#  	Ola Nordmann ,brukerkonto,passord
#Scriptet krever Quests CMDlets

$OULOCATION = read-host "Skriv LDAP sti til OU hvor brukere opprettes(feks:company.com/UserOU)"

if (!$args[0]) {
 	$NAMESLOCATION = read-host "Skriv inn sti til tekstfil som inneholder brukernavn og logon navn"
} else {
 	$NAMESLOCATION = $args[0]
}

if ($?) {
 	$WORKBLOCK = get-content $NAMESLOCATION
 	foreach ($WORK in $WORKBLOCK) {
  		$NAME = $WORK.split(",")[0]
 		$USERNAME = $WORK.split(",")[1]
  		$PASSWORD = $WORK.split(",")[2]
  		write-host "Creating user $USERNAME `n Name: $NAME `n Password: $PASSWORD"
  		new-QADUser -name $NAME -DisplayName $NAME -ParentContainer $OULOCATION -SamAccountName $USERNAME -UserPassword $PASSWORD
  		Set-QADUser $USERNAME -userMustChangePassword $true
  		$date = date
  		write-output "$date Bruker $USERNAME opprettet med passord: $PASSWORD" >> MassCreateUsers.log
 	}
} 
else {
 	write-output "An error occured: $er"
}