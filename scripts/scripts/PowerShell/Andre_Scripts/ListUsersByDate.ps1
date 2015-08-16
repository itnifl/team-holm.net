#Atle Holm - 2009
#Lister alle brukere som ble opprettet for mer enn 6 m&aring;neder siden.

$LdapFilter = "(&(objectClass=user)(objectCategory=person))"
$Searcher = New-Object DirectoryServices.DirectorySearcher($Null, $LdapFilter)
$Searcher.PageSize = 1000
$sixMonthsAgo = (get-date).AddDays(-120)
$Searcher.FindAll() | Select-Object @{n='Name';e={ $_.Properties["name"][0] }}, `
@{n='WhenCreated';e={ $_.Properties["whencreated"][0] }} `
| % { if ($_.WhenCreated -gt $sixMonthsAgo) { echo $_ }}