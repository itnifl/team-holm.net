'** Atle Holm - 28.03.2012 - Scriptet leter etter en hotfix i farmen og lister ut to logger, 	**
'** en for servere der denne er funnet og en for servere der denne ikke er funnet.				**
'** Kj&oslash;ring av scriptet forutsetter at det kj&oslash;res i en Citrix farm hvor det skal sjekkes 		**
'** for hotfix.																					**

'Pseudo:
'1. Ta imot hotfiks det skal s&oslash;kes etter som argument av typen KBxxxxxx
'2. S&oslash;ke opp alle server i en farm
'3. S&oslash;ke etter hotfikses p&aring; alle servere
'4. Lage liste med servere som ikke har spesifisert hotfiks

Option Explicit
On Error Resume Next

Dim oShell, oDate, oFSO, oLogFile, oResultFile1, oResultFile2, iReturn, iCounter, sPatchKB, sLogPath
Dim sUntreatedString, sListPath, strComputer, colQuickFixes, objWMIService, objQuickFix, iFound
Const ForReading = 1
Const ForAppending = 8
Set oShell = wscript.createObject("wscript.shell")

Call forceUseCScript

If WScript.Arguments.Count <> 2 Then
	Wscript.Echo "Usage: "
	Wscript.Echo "cscript checkForHotfix.vbs KB123456 loggliste.txt"
	Wscript.Quit
End If

oDate = date()
'1. Ta imot hotfiks det skal s&oslash;kes etter som argument av typen KBxxxxxx
sPatchKB = WScript.Arguments(0)
sListPath = WScript.Arguments(1)
sLogPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")

Set oFSO = CreateObject("Scripting.FileSystemObject")

'2. S&oslash;ke opp alle server i en farm
iReturn = oShell.Run("cmd.exe /c qfarm.exe /CONTINUE > """ & sLogPath & "\citrixServersUnTreated.txt""",1,True)
Set oLogFile = oFSO.OpenTextFile(sLogPath & "\citrixServersUnTreated.txt", ForReading)
Set oResultFile1 = oFSO.OpenTextFile(sLogPath & "\" & sListPath & "-FoundServers.log", ForAppending, True)
Set oResultFile2 = oFSO.OpenTextFile(sLogPath & "\" & sListPath & "-NotFoundServers.log", ForAppending, True)
iCounter = 0

Wscript.Echo "Running Script: " & WScript.scriptFullName
Wscript.Echo "Date: " & oDate
Wscript.Echo "Saving server list in file: " & sListPath
Wscript.Echo "Logpath: " & sLogPath
Wscript.Echo "Arguments are: '" & sPatchKB & "' & '" & sListPath & "'"
Wscript.Sleep 3000

'3. S&oslash;ke etter hotfikses p&aring; alle servere
Do Until oLogFile.AtEndOfStream
	Dim arraySplit, strChars, i
	sUntreatedString = oLogFile.ReadLine
	iCounter = iCounter + 1
	If iCounter >= 5 Then
		For i = 39 to 2 Step -1
			strChars = Space(i)
			sUntreatedString = Replace(sUntreatedString, strChars, " ")
		Next
		arraySplit = split(sUntreatedString, " ")
		WScript.Echo "Sjekker: " & arraySplit(0)
		strComputer = arraySplit(0)
		Err.Clear
		Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
		Set colQuickFixes = objWMIService.ExecQuery ("Select * from Win32_QuickFixEngineering")
		If  Err.Number <> 0  Then   
			' An exception occurred
			oResultFile2.WriteLine("Exception when retreiving information from server " & strComputer & ":" & vbCrLf _
				& "    Error number: " & Err.Number & vbCrLf & "    Error description: '" & Err.Description & vbCrLf)
		Else
			iFound = 0
			For Each objQuickFix In colQuickFixes
				If objQuickFix.HotFixID<>"File 1" And StrComp(objQuickFix.HotFixID, sPatchKB, 1) = 0 Then 
					Wscript.Echo objQuickFix.HotFixID & " found at server " & strComputer
					If Not isNULL(objQuickFix.Description) Then Wscript.Echo "Description: " & objQuickFix.Description
					If Not isNULL(objQuickFix.InstallDate) Then Wscript.Echo "Installation date is: " & objQuickFix.InstallDate
					If Not isNULL(objQuickFix.InstalledBy) Then Wscript.Echo "Installed By: " & objQuickFix.InstalledBy
					oResultFile1.WriteLine(vbCrlf & objQuickFix.HotFixID & " found at server " & strComputer)
					If Not isNULL(objQuickFix.Description) Then oResultFile1.WriteLine(vbTab & "Description: " & objQuickFix.Description)
					If Not isNULL(objQuickFix.InstallDate) Then oResultFile1.WriteLine(vbTab & "Installation date is: " & objQuickFix.InstallDate)
					If Not isNULL(objQuickFix.InstalledBy) Then oResultFile1.WriteLine(vbTab & "Installed By: " & objQuickFix.InstalledBy)
					iFound = 1
				End If
			Next
			If (iFound = 0) Then
				'4. Lage liste med servere som ikke har spesifisert hotfiks
				oResultFile2.WriteLine(strComputer & ": Did not find " & sPatchKB)
			End If
		End If
	End If
Loop

oLogFile.close
oResultFile1.close
oResultFile2.close
oFSO.DeleteFile sLogPath & "\citrixServersUnTreated.txt"

Sub forceUseCScript()   
	If Not WScript.FullName = WScript.Path & "\cscript.exe" Then      
		oShell.Popup "Startet ved bruk av WScript. Starter igjen...",3,"WSCRIPT"
		oShell.Run "cmd.exe /k " & WScript.Path & "\cscript.exe //NOLOGO " & Chr(34) & WScript.scriptFullName & Chr(34) _
			& " " & WScript.Arguments(0) & " " & WScript.Arguments(1),1,False
		WScript.Quit 0
	End If
End Sub 