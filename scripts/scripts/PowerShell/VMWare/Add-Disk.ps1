#Atle Holm - 2013
#Add Disk to VM
$vCenterHost = "xx.xx.xx.xx"
$vCenterUser = "lab\Administrator"
$vCenterPass = "xxxxxxx" 
$vmcluster = "CLUSTER 1"

$vmname = "PLATINUM"
$disk1 = "100"
$disk2 = ""
$Disks = @()
if($disk1.compareTo("0") -eq 0) { $disk1 = ""}
if($disk2.compareTo("0") -eq 0) { $disk2 = ""}
if($disk1 -and $disk2) {
   $Disks = @($disk1,$disk2)
}elseif($disk1 -and !$disk2) {
   $Disks = @($disk1)
}elseif(!$disk1 -and $disk2) {
   $Disks = @($disk2)
}	
$DiskStorageFormat = "Thin"
$datastorecluster = ""
$ErrorID = 0

if(-not (Get-PSSnapin VMware.VimAutomation.Core)) { 
    Add-PSSnapin VMware.VimAutomation.Core 
} 

Set-PowerCLIConfiguration -DefaultVIServerMode Single -InvalidCertificateAction Ignore -confirm:$false
Connect-VIServer -Server $vCenterHost -User $vCenterUser -Password $vCenterPass

$vmname = $vmname.toUpper()

try {
      $name = ((Get-VM $vmname).name).toUpper()
}catch{
	$ErrorID = "1"
	throw "ERROR: 100 Server not found" 
}

$datastorecluster = $datastorecluster.toUpper()

switch ($datastorecluster) { 
	"DatastoreCluster_xx" {	
		"Det er valgt et annet datastore"
			  
		} 	
	default { 
		"Default datastore er valgt"
		$datastorecluster = "DatastoreCluster_01"
	}
}
try {
	foreach ($nSize in $Disks) {
		Get-VM $vmname | New-HardDisk -DiskType flat -CapacityGB $nSize `
			-StorageFormat $DiskStorageFormat -Datastore $datastorecluster 	
	}
} catch {
	$ErrorID = "2"
	throw "ERROR: 2 Could not add one or more disks to $vmname" 
}