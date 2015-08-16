#Atle holm - 2013
#Set VLAN on an existing VM guest
$vCenterHost = "xx.xx.xx.xx"
$vCenterUser = "lab\Administrator"
$vCenterPass = "xxxxxxx" 
$vmcluster = "CLUSTER 1"

$vmname = "PLATINUM"
$newNetworkName = "VLAN 123"
$ErrorID = 0

if(-not (Get-PSSnapin VMware.VimAutomation.Core)) { 
    Add-PSSnapin VMware.VimAutomation.Core 
} 

Set-PowerCLIConfiguration -DefaultVIServerMode Single -InvalidCertificateAction Ignore -confirm:$false
Connect-VIServer -Server $vCenterHost -User $vCenterUser -Password $vCenterPass

$vmname = $vmname.toUpper()

try {
      $name = ((Get-VM $vmname).name).toUpper()
} catch {
	$ErrorID = "1"
	throw "ERROR: 100 Server not found" 
}

try {
	get-vm $vmname | Get-NetworkAdapter | Set-NetworkAdapter -NetworkName $newNetworkName -Confirm:$false
} catch {
	$ErrorID = "2"
	throw "ERROR: 200 Could not set VLAN on server"
}