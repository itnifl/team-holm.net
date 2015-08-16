' *********************************************  
' Atle Holm - 22.03.2011  scripts.team-holm.net
' ********************************************* 
' Kopierer angitt fil til angitte stibaner, og setter filbavn p&aring; original til filnavn.original
' Bruk: cscript replaceFile.vbs C:\temp\newFile.dll C:\Temp\destinationUNCs.txt
' destinationUNCs.txt m&aring; inneholde full UNC sti til filene som skal byttes ut

Option Explicit
'On Error Resume Next
Dim oDate, oFSO, oLogFile, oServersFile, oFileNameSplit, oShell, oFile2Delete
Dim sFile, sFileName, sServernavnLengde, sFilePathToServers, sLogPath, sUNC, sServer, oFileName, sName
Const ForReading = 1
Const ForAppending = 8

Set oShell = CreateObject("WScript.Shell")

oDate = date()

If WScript.Arguments.Count <> 2 Then
	Wscript.Echo "cscript replaceFile.vbs C:\temp\newFile.dll C:\Temp\destinationUNCs.txt"
	Wscript.Quit
End If

Call forceUseCScript

'Les inn sti som skal sjekkes og sti til fil med servere fra bruker:
sFile = WScript.Arguments(0)
sFilePathToServers = WScript.Arguments(1)
sLogPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")
oFileNameSplit = Split(sFile,"\")
sFileName = oFileNameSplit(arrLength(oFileNameSplit))
Wscript.Echo "Date: " & oDate
Wscript.Echo "Log path is: " & sLogPath
Wscript.Echo "Arguments are: '" & sFile & " & " & sFilePathToServers & "'"
Wscript.Sleep 3000

set oFSO = CreateObject("Scripting.FileSystemObject")

If Not oFSO.FileExists(sFilePathToServers) Then
	Wscript.Echo "Error: File " & sFilePathToServers & " does not exist!"
	Wscript.Quit
End If

set oServersFile = oFSO.OpenTextFile(sFilePathToServers,ForReading)
set oLogFile = oFSO.OpenTextFile (sLogPath & "\replaceFile.log", ForAppending, True)

oLogFile.WriteLine(vbCrLf & "| - " & oDate & " - LOGGING COPYING OF FILES: ")

Do Until oServersFile.AtEndOfStream
	sUNC = oServersFile.ReadLine
	If Right(sUNC,1) <> "\" Then
		sUNC = sUNC & "\"
	End If
	sServer = sUNC
	sServer = Right(sServer,(Len(sServer)-2))
	sServernavnLengde = Len(Split(sUNC,"\")(2))
	'Antar at lengden p&aring; servernavnet er sServerNavnLengde tegn
	sServer = Left(sServer,sServernavnLengde)
	If oFSO.FileExists(sUNC & sFileName) Then
		If oFSO.FileExists(sUNC & sFileName & ".original") Then
			Set oFile2Delete = oFSO.GetFile(sUNC & sFileName & ".original")
			oFile2Delete.Delete
		End If
		Wscript.Echo "Attempting to replace " & sUNC & sFileName & " with " & sFile
		oLogFile.WriteLine("Attempting to replace " & sUNC & sFileName & " with " & sFile)
		set oFileName = oFSO.getfile(sUNC & sFileName)
		sName = oFileName.name
		oFileName.name = sName & ".original"
		set oFileName = nothing
		If  Err.Number = 0  Then
			Wscript.Echo "..OK!" & vbCrLf
			oLogFile.WriteLine("..OK!")
		Else
			Wscript.Echo "..failed!" & vbCrLf
			oLogFile.WriteLine("..failed!")
		End If
	Else 
		Wscript.Echo "File at server " & sServer & " does not exist: " & sUNC & sFileName
		Wscript.Echo "Attempting to copy anyway.."
		oLogFile.WriteLine("File at server " & sServer & " does not exist: " & sUNC & sFileName)
		oLogFile.WriteLine("Attempting copy anyway, destination: " & sUNC & sFileName)
	End If
	If oFSO.FolderExists(sUNC) Then
		oFSO.CopyFile sFile, sUNC,TRUE
	Else
		Wscript.Echo " - Error: Destination path does not exist(" & sUNC & "). Aborting copy to destination path."
	End If
Loop

oServersFile.Close
oLogFile.Close

Function arrLength(oArray) 
	Dim itemCount, itemIndex
	itemCount = 0 
	For itemIndex = 0 To UBound(oArray) 
		If Not(oArray(itemIndex)) = Empty Then 
			itemCount = itemCount + 1 
		End If 
	Next 
	arrLength = itemCount-1
End Function

Sub forceUseCScript()   
	If Not WScript.FullName = WScript.Path & "\cscript.exe" Then      
		oShell.Popup "Startet ved bruk av WScript. Starter igjen...",3,"WSCRIPT"
		oShell.Run "cmd.exe /k " & WScript.Path & "\cscript.exe //NOLOGO " & Chr(34) & WScript.scriptFullName _
			& Chr(34) & " " & WScript.Arguments(0) & " " & WScript.Arguments(1),1,False
		WScript.Quit 0
	End If
End Sub 