'** Atle Holm - 02.08.2012 - ta kontakt p&aring; atle.@team-holm.net for informasjon 
'** eller tilbakemeldinger. Scriptet logger en bruker
'** automatisk p&aring; alle servere i en publisert desktop.
'** NB! Pass p&aring; at sWFICAFile variabelen er satt til rett  
'** plassering av wfcrun32.exe - scriptet er satt opp med standard plassering.

'Scriptet brukes slik:
'cscript logon2Load.vbs 'Desktop Name' domain\username password

'Pseudo:
'1. Ta imot brukernavn og passord
'2. Generer liste over servere med qfarm /app desktop
'3. Generer ICA filer for disse
'4. Kj&oslash;r hver ICA fil med wfica32.exe eller start.exe

Option Explicit

Dim oShell, oDate, oFSO, oLogFile, oResultFile, iReturn, iCounter, sDesktop, sLogPath
Dim sUntreatedString, sUserCreds, sPassCreds
Dim sUntreated, sTreated, sWFICAFile

sUntreated = "\citrixServersUnTreated.txt"
sTreated = "\citrixServersTreated.txt"
sWFICAFile = "C:\Program Files\Citrix\ICA Client\wfcrun32.exe"

Const ForReading = 1
Const ForAppending = 8
set oShell = wscript.createObject("wscript.shell")

If WScript.Arguments.Count <> 3 Then
	Wscript.Echo "Usage: "
	Wscript.Echo "cscript logon2Load.vbs 'Desktop Name' domain\username password"
	Wscript.Quit
End If
oDate = date()

Call forceUseCScript

'1. Ta imot brukernavn og passord
sDesktop = WScript.Arguments(0)
sUserCreds = WScript.Arguments(1)
sPassCreds = WScript.Arguments(2)
sLogPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")

set oFSO = CreateObject("Scripting.FileSystemObject")

Wscript.Echo "Date: " & oDate
Wscript.Echo "Fetching servers from: " & sDesktop
Wscript.Echo "Logpath and temporary folder: " & sLogPath
Wscript.Echo "Arguments are: '" & sDesktop & "' & '" & sUserCreds & "' & '" & sPassCreds & "'"
Wscript.Sleep 3000

iReturn = oShell.Run("cmd.exe /c " & Chr(34) & "qfarm.exe /app """ & sDesktop & """ > """ & sLogPath _
& sUntreated & """"  & Chr(34),1,True)
set oLogFile = oFSO.OpenTextFile(sLogPath & sUntreated, ForReading)
set oResultFile = oFSO.OpenTextFile(sLogPath & sTreated, ForAppending, True)
iCounter = 0

Wscript.echo vbCrlf & "Servers are in " & sDesktop & " are: "

'2. Generer liste over servere med qfarm /app desktop
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
		WScript.Echo "   " & arraySplit(1)
		oResultFile.WriteLine(arraySplit(1))
	End If
Loop
oLogFile.close
oResultFile.close
oFSO.DeleteFile sLogPath & sUntreated
set oResultFile = oFSO.OpenTextFile(sLogPath & sTreated, ForReading, True)

'3. Generer ICA filer for disse
Wscript.Echo ""
Do Until oResultFile.AtEndOfStream
	Dim sServer, sIcaFile, oIcaFile

	sServer = oResultFile.ReadLine

	sIcaFile = "[WFClient]" & vbCrLf & "Version=2" & vbCrLf & "HttpBrowserAddress=" & sServer & vbCrLf & "LocTcpBrowserAddress=" _ 
	& sServer & vbCrLf & "LocTcpBrowserAddress2=" & sServer & vbCrLf & "ProxyType=Auto" & vbCrLf & "ConnectionBar=1" _
	& vbCrLf & "[ApplicationServers]" & vbCrLf & sServer & "=" & vbCrLf & "[" & sServer & "]" & vbCrLf & "Address=" _
	& sServer & vbCrLf & "ClientAudio=On" & vbCrLf & "AudioBandwidthLimit=1" & vbCrLf & _
	"CDMAllowed=On" & vbCrLf & "CPMAllowed=On" & vbCrLf & "username=" & sUserCreds & vbCrLf & "Password=" & vbCrLf _
	& "ClearPassword=" & sPassCreds & vbCrLf & "DesiredColor=8" & vbCrLf & "ConnectionBar=1" & vbCrLf & "TWIMode=Off" _
	& vbCrLf & "ScreenPercent=90" & vbCrLf & "Compress=On" & vbCrLf & "TransportDriver=TCP/IP" _
	& vbCrLf & "WinStationDriver=ICA 3.0" & vbCrLf & "BrowserProtocol=HTTPonTCP" & vbCrLf & "[Compress]" _
	& vbCrLf & "DriverName= PDCOMP.DLL" & vbCrLf & "DriverNameWin16= PDCOMPW.DLL" & vbCrLf & "DriverNameWin32= PDCOMPN.DLL"

	set oIcaFile = oFSO.OpenTextFile(sLogPath & "\" & sServer & ".ica", ForAppending, True)
	oIcaFile.WriteLine(sIcaFile)
	'4. Kj&oslash;r hver ICA fil med wfica32.exe eller start.exe
	Wscript.Echo "Generer ICA fil for " & sServer & " og logger inn bruker " & sUserCreds & ":"
	iReturn = oShell.Run("cmd.exe /c """ & """" & sWFICAFile & """" & " """ & sLogPath & "\" & sServer & ".ica" & """""",0,False)
	If iReturn = 0 Then
		Wscript.Echo "   -->OK!"
	Else
		Wscript.Echo "    -->Unknown error!"
	End If
	Wscript.Sleep 0800
	oIcaFile.close
	oFSO.DeleteFile sLogPath & "\" & sServer & ".ica"
Loop
oResultFile.close
oFSO.DeleteFile sLogPath & sTreated


Sub forceUseCScript()
	If Not WScript.FullName = WScript.Path & "\cscript.exe" Then
		oShell.Popup "Startet ved bruk av WScript. Starter igjen...",3,"WSCRIPT"
		oShell.Run "cmd.exe /k " & WScript.Path & "\cscript.exe //NOLOGO " & Chr(34) & WScript.scriptFullName & Chr(34) _
		& " " & WScript.Arguments(0) & " " & WScript.Arguments(1) & " " & WScript.Arguments(2),1,False
		WScript.Quit 0
	End If
End Sub