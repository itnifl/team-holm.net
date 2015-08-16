#Atle Holm - 2009
#Teller antall disabled og enabled brukere i domenet

$Enabled = 0
$Disabled = 0
 
Get-QADUser -enabled -sl 0 | %{$Enabled++}
Get-QADUser -disabled -sl 0 | %{$disabled++}
 
"There are $Enabled enabled users and $Disabled disabled users.`n"