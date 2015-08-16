#Atle Holm - 2009

if ($args -eq "?") {
 	Write-Host "Dette scriptet dumper gruppemedlemskaper til fil fra en bruker."
	Write-Host "Scriptet sp&oslash;r etter den aktuelle brukeren etter at det er startet."
 	break
}

$uRetreive = Read-Host "Skriv inn bruker som skal hentes "
$groups = (Get-QADUser $uRetreive).memberof | Get-QADGroup
$file = "Dump-$uRetreive.log"
Write-Output "Bruker $uRetrieve har f&oslash;lgende gruppetilh&oslash;righeter:`n" >> "$file"

foreach ($group in $groups) {
	write-output "$group `n" >> "$file"
}
Write-Host "Resultatene finner du i $file."