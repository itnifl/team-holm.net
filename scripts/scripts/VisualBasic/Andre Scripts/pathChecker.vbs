' *********************************************  
' Atle Holm - 18.03.2011  scripts.team-holm.net
' ********************************************* 
' Sjekker etter angitt sti p&aring; angitte servere
' Bruk: pathChecker C:\Users C:\Temp\servere.txt
' servere.txt m&aring; inneholde servernavn p&aring; hver sin linje.

Option Explicit
'On Error Resume Next
Dim oDate, oFSO, oShell, sServer, oLogFile, oServersFile, sPath, sFilePathToServers, sLogPath, sUNC
Const ForReading = 1
Const ForAppending = 8

Set oShell = CreateObject("WScript.Shell")

oDate = date()

If WScript.Arguments.Count <> 2 Then
	Wscript.Echo "Bruk: Cscript patchChecker.vbs C:\Users C:\Temp\servere.txt"
	Wscript.Quit
End If

Call forceUseCScript

'Les inn sti som skal sjekkes og sti til fil med servere fra bruker:
sPath = WScript.Arguments(0)
sFilePathToServers = WScript.Arguments(1)
sLogPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")

Wscript.Echo "Date: " & oDate
Wscript.Echo sPath
Wscript.Echo "Log path is: " & sLogPath
Wscript.Echo "Arguments are: '" & sPath & " & " & sFilePathToServers & "'"
Wscript.Sleep 3000

set oFSO = CreateObject("Scripting.FileSystemObject")

If Not oFSO.FileExists(sFilePathToServers) Then
	Wscript.Echo "Error: File " & sFilePathToServers & " does not exist!"
	Wscript.Quit
End If

set oServersFile = oFSO.OpenTextFile(sFilePathToServers,ForReading)
set oLogFile = oFSO.OpenTextFile (sLogPath & "\pathChecker.log", ForAppending, True)

oLogFile.WriteLine(oDate)

Do Until oServersFile.AtEndOfStream
	sServer = oServersFile.ReadLine
	sUNC = "\\" & sServer & "\" & Left(sPath,1) & "$\" & Right(sPath,(Len(sPath)-3))
	If oFSO.FolderExists(sUNC) Then
		Wscript.Echo "Folder at server " & sServer & " exists: " & sUNC
		oLogFile.WriteLine("Folder at server " & sServer & " exists: " & sUNC)
	Else 
		Wscript.Echo "Folder at server " & sServer & " does not exist: " & sUNC
		oLogFile.WriteLine("Folder at server " & sServer & " does not exist: " & sUNC)
	End If
Loop

oServersFile.Close
oLogFile.Close

Sub forceUseCScript()   
	If Not WScript.FullName = WScript.Path & "\cscript.exe" Then      
		oShell.Popup "Startet ved bruk av WScript. Starter igjen...",3,"WSCRIPT"      
		oShell.Run "cmd.exe /k " & WScript.Path & "\cscript.exe //NOLOGO " & Chr(34) & WScript.scriptFullName _
			& Chr(34) & " " & WScript.Arguments(0) & " " & WScript.Arguments(1),1,False
		WScript.Quit 0
	End If
End Sub 