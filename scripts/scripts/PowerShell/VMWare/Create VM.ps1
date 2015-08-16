#Atle Holm - 2013
#1. Oppretter VM og plasserer i default plasseringer.
#2. Returmerer IP-adressen på server.
#3. Sette expiry date på server i notes field.

$vCenterHost = "xx.xx.xx.xx"
$vCenterUser = "lab\Administrator"
$vCenterPass = "xxxxxxx" 

$vmcluster = ""
$datastorecluster = ""
$ErrorID = 0

$vmname = "Platinum"
$NumCpu = "2"
$MemoryGB = "2"
$DiskStorageFormat = "Thin"
#win2003 | win2008
$osversion = "WIN2008"

if(-not (Get-PSSnapin VMware.VimAutomation.Core 2> $NULL)) { 
	Add-PSSnapin VMware.VimAutomation.Core 
} 

Set-PowerCLIConfiguration -DefaultVIServerMode Single -InvalidCertificateAction Ignore -confirm:$false
Connect-VIServer -Server $vCenterHost -User $vCenterUser -Password $vCenterPass

$vmname = $vmname.toUpper()
$vmname = "LAB-$vmname"

try {
	$name = ((Get-VM $vmname).name).toUpper() 2> $NULL
}catch{

}

if ($name -eq $vmname) { 
	$ErrorID = "1"
	throw "ERROR: 1 A server already exists with the same name" 
}

$osversion = $osversion.toUpper()

switch ($osversion) { 
	"WIN2012" {	"OS velges: Windows 2012"
		$OSCustomizationSpec = "W2K12-CUSTOMIZATION"
		$vmtemplate = "win2012_template"
	} 
	"WIN2008" {	"OS velges: Windows 2008"
		$OSCustomizationSpec = "W2K8-CUSTOMIZATION"
		$vmtemplate = "W2K8-MAL"
	}         
	default { 
		$ErrorID = "2"
		throw "ERROR: 2 Unknown OS version chosen" 
	}
}
$vmcluster = $vmcluster.toUpper()
switch ($vmcluster) { 
	"HOSTECluster_xx" {	
		"Annet VM cluster valgt"				  
	}        
	default { 
		"Default VM Cluster velges"
		$vmcluster = "CLUSTER 1"
	}
}

$datastorecluster = $datastorecluster.toUpper()

switch ($datastorecluster) { 
	"DatastoreCluster_xx" {	
		"Annet datastore valgt"				  
	}         
	default { 
		"Default Datastore velges"
		$datastorecluster = "DatastoreCluster_01"
	}
}
$expiryDate = (Get-Date).AddDays(60)
Get-Cluster $vmcluster | New-VM -Name $vmname -OSCustomizationSpec $OSCustomizationSpec -DiskStorageFormat `
$DiskStorageFormat -Template $vmtemplate -Datastore $datastorecluster
Get-VM $vmname | Set-VM -NumCpu $NumCpu -MemoryGB $MemoryGB -Notes `
"Expires: $expiryDate - NB! Removing this text will automatically expire your VM!" -confirm:$false
Get-VM $vmname | Start-VM


while ($guestIpAddress -eq $NULL) {
	"Waiting for server to get an IP address from DHCP..."
	Start-Sleep -s 15
	$guestIpAddress = (get-vm $vmname).guest.IPAddress[0]
}
"Servers IP-adresse er: $guestIpAddress"
