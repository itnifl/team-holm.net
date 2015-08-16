#Atle Holm - 2009

Remove-Item RemoteMassAdmLocalAdmin.log 2>> $NULL

Function DeleteUser {
	$SERVERS = Get-Content servers.txt
	foreach ($SERVER in $SERVERS) { 
		$userNamesToDel = Get-Content users.txt
		$group =[ADSI]"WinNT://$SERVER/Administrators,group"
		foreach ($userNameToDel in $userNamesToDel) { 
			$group.remove("WinNT://$env:userdomain/$userNameToDel") 2>> $er
			if ($?) {
				Write-Host "User $userNameToDel deleted from local Administrators at $Server"
				$date = date
				Write-Output "$date User $userNameToDel deleted from local Administrators at $Server." >> RemoteMassAdmLocalAdmin.log
			} else { Write-Host $er }
		}
	} 
}

Function AddUser {
	$SERVERS = Get-Content servers.txt
	foreach ($SERVER in $SERVERS) {
		echo "Trying: $SERVER" 
		$userNamesToAdd = Get-Content users.txt
		$group =[ADSI]"WinNT://$SERVER/Administrators,group"
		foreach ($userNameToAdd in $userNamesToAdd) { 
			echo "Adding: $userNameToAdd"
			$group.add("WinNT://$env:userdomain/$userNameToAdd") 2>> $er
			if ($?) { 
				Write-Host "User $userNameToAdd added to local Administrators at $Server."
				$date = date
				Write-Output "$date User $userNameToAdd added to local Administrators at $Server." >> RemoteMassAdmLocalAdmin.log
			} else { Write-Host $er }
		}
	} 
}

Function ListUsers {
	$SERVERS = Get-Content servers.txt
	foreach ($SERVER in $SERVERS) { 
		$group =[ADSI]"WinNT://$SERVER/Administrators,group" 
		$members = @($group.psbase.Invoke("Members"))
		if ($?) { 
			Write-Host ""
			Write-Host "*Listing users from local Administrators at `"$Server`" :"
			Write-Host ""
			$date = date
			Write-Output "$date Users from local Administrators at $Server listed." >> RemoteMassAdmLocalAdmin.log
			$members | foreach {$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)}
		} else { Write-Host $er }	
	} 
}

if ($Args.count -eq 1) {
	if ($Args -eq 1) { DeleteUser }
	if ($Args -eq 2) { AddUser }
	if ($Args -eq 3) { ListUsers }
} elseif ($Args.count -ne 1) {
	Write-Output "Usage: RemoteMassAdmLocalAdmin.ps1 n"
	Write-Output "n = 1 : Delete users listed in users.txt from local Administrators groups at servers listed in servers.txt"
	Write-Output "n = 2 : Add users listed in users.txt to local Administrators groups at servers listed in servers.txt"
	Write-Output "n = 3 : List users listed in local Administrators groups at servers listed in servers.txt"
}

#users.txt must include information of the type: 	domainname\userName
#							domainname\userName
#							domainname\userName
#servers.txt must include information of the type:	machinename
#							machinename
#							machinename