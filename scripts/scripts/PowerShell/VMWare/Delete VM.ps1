#Atle Holm - 2013
#1. Sletter VM.

$vCenterHost = "xx.xx.xx.xx"
$vCenterUser = "lab\Administrator"
$vCenterPass = "xxxxxxx" 

$ErrorID = "0"

$vmname = "PLATINUM"

if(-not (Get-PSSnapin VMware.VimAutomation.Core 2> $NULL)) { 
    Add-PSSnapin VMware.VimAutomation.Core 
} 

Set-PowerCLIConfiguration -DefaultVIServerMode Single -InvalidCertificateAction Ignore -confirm:$false
Connect-VIServer -Server $vCenterHost -User $vCenterUser -Password $vCenterPass

$vmname = $vmname.toUpper()

try {
      $name = ((Get-VM $vmname).name).toUpper() 2> $NULL
} catch {

}

if ($name -ne $vmname) { 
	$ErrorID = "1"
	throw "ERROR: 1 Did not find a server with that name" 
}

"Shutting down $vmname"
$vmobj = Get-VM $vmname
try {
	Shutdown-VMGuest $vmobj -Confirm:$false
	while (((Get-VM $vmname).PowerState).ToString().ToLower().compareTo(("PoweredOff").ToLower()) -ne 0) {
		"Waiting for VM to enter a powered off state before we delete it.."
		Start-Sleep -s 15
		if(((Get-VM $vmname).PowerState).ToString().ToLower().compareTo(("PoweredOff").ToLower()) -eq 0) { 
			"Deleting $vmname"
			Remove-VM $vmobj -DeletePermanently -Confirm:$false 
			exit 0
		}
	}
} catch {
	$ErrorID = "3"
	throw "ERROR: 2 Was not able to shut down and/or delete VM" 
}