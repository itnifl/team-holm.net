#Atle Holm - 2013
# Lists comma separated information about all vms 
# starting with a ceratin name. Replace "namestart" below for the start of the name you want to search for.

if(-not (Get-PSSnapin VMware.VimAutomation.Core 2> $NULL)) { 
	Add-PSSnapin VMware.VimAutomation.Core 
} 
Connect-VIServer localhost #localhost is the vcenter in this case

get-vm namestart* | %{
	$name = $_.name
	$mem = $_.MemoryMB 
	$nCPU = $_.NumCpu
	$diskCapacities = $_.HardDisks | %{$_.CapacityKB/1024}
	$outputString = "$name, #CPU: $nCPU, Memory: $mem MB"
	$x = 0;
	foreach ($d in $diskCapacities) {
		$x++;
		$outputString = $($outputString + ", Disk" + $x + ": " + $d + "MB")
	}
	$x = 0;
	foreach($ip in $_.Guest.IPAddress) {
		$x++;
		$outputString = $($outputString + ", IP" + $x + ": "+$ip)
	} 
	Write-Output $outputString
}