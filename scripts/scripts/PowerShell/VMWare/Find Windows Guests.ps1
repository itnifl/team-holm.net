#Atle Holm - 2013
#Lists all guests with Windows OS

$vms = Get-VM | ?{$_.PowerState -eq "PoweredOn"}
foreach($vm in $vms) {
	Get-WmiObject -ComputerName $vm.Name Win32_OperatingSystem -EA SilentlyContinue `
	| Select-Object @{Name="ComputerName"; Expression={$vm.Name}}
}