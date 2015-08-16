'** Atle Holm 03.03.2012 - atle@team-holm.net for feedback.
'** Vanligvis vil qfarm /app desktopNavn liste alle servere i en desktop, 
'** men noen ganger &oslash;nsker mann &aring bare f&aring; servernavnene og ikke alt det andre med.
'** Feks n&aring;r man skal bruke listen i andre scripts.
'
'Brukes slik:
'cscript getDesktopServers.vbs 'Desktop Name' generertListe.txt
'Feks:
'cscript getDesktopServers.vbs 102910 generertListe.txt
'
'Da f&aring;r man b&aring;de skrevet servernavnene ut i cmd vindu, og man f&aring;r de listet i generertListe.txt

Option Explicit

Dim oShell, oDate, oFSO, oLogFile, oResultFile, iReturn, iCounter, sDesktop, sLogPath, sUntreatedString, sListPath
Const ForReading = 1
Const ForAppending = 8
set oShell = wscript.createObject("wscript.shell")

If WScript.Arguments.Count <> 2 Then
	Wscript.Echo "Usage: "
	Wscript.Echo "cscript getDesktopServers.vbs 'Desktop Name' generertListe.txt"
	Wscript.Quit
End If

Call forceUseCScript

oDate = date()
sDesktop = WScript.Arguments(0)
sListPath = WScript.Arguments(1)
sLogPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")

set oFSO = CreateObject("Scripting.FileSystemObject")

Wscript.Echo "Date: " & oDate
Wscript.Echo "Fetching servers from: " & sDesktop
Wscript.Echo "Saving server list in file: " & sListPath
Wscript.Echo "Logpath: " & sLogPath
Wscript.Echo "Arguments are: '" & sDesktop & "' & '" & sListPath & "'"
Wscript.Sleep 3000

iReturn = oShell.Run("cmd.exe /c qfarm.exe /app """ & sDesktop & """ > """ & sLogPath & "\citrixServersUnTreated.txt""",1,True)
set oLogFile = oFSO.OpenTextFile(sLogPath & "\citrixServersUnTreated.txt", ForReading)
set oResultFile = oFSO.OpenTextFile(sLogPath & "\" & sListPath, ForAppending, True)
iCounter = 0

Wscript.echo vbCrlf & "Servers are in " & sDesktop & " are: "
Do Until oLogFile.AtEndOfStream
	Dim arraySplit, strChars, i
	sUntreatedString = oLogFile.ReadLine
	iCounter = iCounter + 1
	If iCounter >= 5 Then
		For i = 39 to 2 Step -1
			strChars = Space(i)
			sUntreatedString = Replace(sUntreatedString, strChars, ";")
		Next
		arraySplit = split(sUntreatedString, ";")
		WScript.Echo arraySplit(1)
		oResultFile.WriteLine(arraySplit(1))
	End If
Loop
oLogFile.close
oResultFile.close
oFSO.DeleteFile sLogPath & "\citrixServersUnTreated.txt"

Sub forceUseCScript()   
	If Not WScript.FullName = WScript.Path & "\cscript.exe" Then      
		oShell.Popup "Startet ved bruk av WScript. Starter igjen...",3,"WSCRIPT"
		oShell.Run "cmd.exe /k " & WScript.Path & "\cscript.exe //NOLOGO " & Chr(34) & WScript.scriptFullName _
		& Chr(34) & " " & WScript.Arguments(0) & " " & WScript.Arguments(1),1,False
		WScript.Quit 0
	End If
End Sub 