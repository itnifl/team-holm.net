#Atle Holm - 2013
# This script fixes error messages found in the event viewer 
# described in http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2038263
# Run the script against desired computers
[cmdletbinding()]
param(
	[parameter(Mandatory=$true)]
	$ComputerName=$env:COMPUTERNAME)
$service = Get-WmiObject -ComputerName $ComputerName -Class Win32_Service -Filter "Name='VMTools'"
$service.stopservice()
Start-Sleep -s 10
$Processes = Get-WmiObject -Class Win32_Process -ComputerName $ComputerName -Filter "name='vmtoolsd.exe'"
if($Processes) {
  foreach ($process in $processes) {
    $processid = $process.handle
    $processcreationtime = $Process.Converttodatetime($Process.creationdate)
    write-host "`nThe vmtoolsd.exe `($processid`) process creation time is $processcreationtime"
	$returnval = $process.terminate()
	if($returnval.returnvalue -eq 0) {
		write-host "`n`tThe process vmtoolsd.exe `($processid`) terminated successfully"
	} else {
		write-host "`n`tThe process vmtoolsd.exe `($processid`) termination has some problems"
	}
  }
} else {
  write-host "`nNo Process found with name vmtoolsd.exe"
}
Start-Sleep -s 12
$file = "\\$ComputerName\c$\Program Files\VMware\VMware Tools\plugins\vmusr\Unity.dll" 
write-host "`nEvaluating $file"
if (test-path $file) {
	write-host "`n$ComputerName: File exists" 
	Remove-Item $file -force 
	write-host "`n$ComputerName: File is deleted" 
} else {
	write-host "`n$ComputerName File does not exist" 
	write-host "`n`tNot touching any files.."
}
 $service.startservice()