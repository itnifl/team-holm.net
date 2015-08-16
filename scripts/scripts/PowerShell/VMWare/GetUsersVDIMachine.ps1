#Atle Holm - 2013
# CMDlets used here are available and installed on the VDI View Manager Server in your environment.
# These examples will get the name of the users VDI machine that he is assigned(1), 
# and reset a users VDI machine based on the users logon name(2).

import-module PowershellServiceCmdlets
 
Write-Output "Enter user name: "
$username = Read-Host

#(1)
Write-Host "Getting VDI name for user $username"
Get-RemoteSession -username domain\$username | %{Write-host @("`nUsers vm is named: " + (($_.DNSName).split(".")[0]) + "`n")}
 
Write-Host "Press enter to continue:"
Read-Host

#(2)
Write-Host "Resetting the VDI VM for user $username"
Get-RemoteSession -username domain\$username | %{Get-DesktopVM -name (($_.DNSName).split(".")[0])} | send-vmreset