#Atle Holm - 2013
#Disconnect all users that have been idle more then 300 minutes / 5 hours

if(-not (Get-PSSnapin VMware.VimAutomation.Core 2> $NULL)) { 
	Add-PSSnapin VMware.VimAutomation.Core 
} 
Connect-VIServer localhost #localhost is the vcenter
Get-ViSession | Where {$_.IdleMinutes -gt 300 -and $_.FullName.Trim().ToString().ToLower() -ne "excludeUserName1Here" `
-and $_.FullName.Trim().ToString().ToLower() -ne "excludeUserName2Here"} | Disconnect-VISession