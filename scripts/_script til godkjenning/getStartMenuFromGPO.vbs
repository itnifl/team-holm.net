' ***********************  
' Atle Holm - 15.05.2011  
' ***********************  
'Mulige forbedringer:
'(1) Sjekk syntax på dns-suffix er korrekt
'(2) Gjør det mulig å velge om ISVC skal være med
'(3) Gjør det mulig å velge et vanlig eller VASP søk av hensyn til feks VASP nummer 137500OSL

Option Explicit
Dim menuFound, GPONameVar, customerNumber, customerDNSSuffix, GUID, rootFolder, folderContents, sendNextLine, pathsFound, oFSO, oShell, oSettingsFile, strUserDomain, strDomainCon, strFilePath, strLine 
'Dim x, y, percent
Const ForReading = 1
Const intUniCode = -1

set oFSO = CreateObject("Scripting.FileSystemObject") 
Set oShell = CreateObject("WScript.Shell")

call forceUseCScript

customerNumber = InputBox("Tast inn kundenummer:" & vbCrLf & vbCrLf & "Eks: 149999", "Kunde:")
customerDNSSuffix = InputBox("Tast inn DNS Suffix:" & vbCrLf & vbCrLf & "Eks: Euro.Tecosroot.com - la være blank for default", "DNS Suffix - default: Euro.Tecosroot.com")

'customerNumber = "402161"
'customerDNSSuffix = "Euro.Tecosroot.com"
'GUID = "{0A6D9D8D-606C-4AFB-80B0-7B8A2B441825}"

If customerNumber = "" Then
	Wscript.Echo "Dette scriptet avhenger av et kundenummer."
	WScript.Quit 
End If

If Len(customerNumber) <> 6 Then
	Wscript.Echo "Kundenummeret skal være seks siffer langt."
	WScript.Quit 
End If

If customerDNSSuffix = "" Then
	customerDNSSuffix = "Euro.Tecosroot.com"
End If

strDomainCon = "dc=" & Split(customerDNSSuffix,".")(0) & ",dc=" & Split(customerDNSSuffix,".")(1) & ",dc=" & Split(customerDNSSuffix,".")(2)

Set rootFolder = oFSO.GetFolder(oShell.ExpandEnvironmentStrings("%LOGONSERVER%") & "\sysvol\Euro.Tecosroot.com\Policies")  
Set folderContents = rootFolder.Subfolders
pathsFound = ""

'x = 1
'y = 1
'For each GUID In folderContents
'	y = y + 1
'Next
WScript.Echo vbNewLine & "******************************************************************"
WScript.Echo "Starter nå søket, du vil bli informert om resultatene under veis."
WScript.Echo "Tall lengst til venstre er fremgangsindikator."
WScript.Echo "******************************************************************" & vbNewLine
pauseScript("Starter nå søket, du vil bli informert om resultatene under veis." & vbNewLine & "Tall lengst til venstre er fremgangsindikator.")
For each GUID In folderContents  
	GUID = Split(GUID, "\")(6)
	'percent = (x / y)*100
	GPONamevar =  GetGPOName(strDomainCon,GUID)
	'Wscript.Echo "Framgang: " & Round(percent) & "% "'Ser om GPO " & GPONameVar & " tilhører kunde " & customerNumber
	'x = x + 1
	If InStr(GPONameVar,customerNumber) Then
		Wscript.Echo "Fant policy: " & GetGPOName(strDomainCon,GUID)
		Wscript.Echo "  - Denne GPO tilhører " & customerNumber
		strFilePath = oShell.ExpandEnvironmentStrings("%LOGONSERVER%") & "\sysvol\Euro.Tecosroot.com\Policies\" & GUID & "\User\Documents & Settings\fdeploy.ini"
		If oFSO.FileExists(strFilePath) Then
			Wscript.Echo "  - Ser etter startmeny"
			Set oSettingsFile = oFSO.OpenTextFile(strFilePath,ForReading,False,intUniCode)
			menuFound = False
			'Wscript.Echo "Åpner fil: " & strFilePath
			Do Until oSettingsFile.AtEndOfStream  
				strLine = oSettingsFile.ReadLine 
				'Wscript.Echo strLine
				If sendNextLine = True Then
					If pathsFound = "" Then 
						pathsfound = vbNewLine & "    " & strLine & vbNewLine
					Else
						pathsfound = pathsFound & "    " & strLine
					End If
					WScript.echo "  - Hittil funnet: " & pathsFound
					sendNextLine = False
					'pauseScript(pathsfound)
				End If
				If InStr(Trim(strLine),"[Start Menu]") Then
					sendNextLine = True
					menuFound = True
				End If
			Loop
			If Not menuFound Then
				WScript.Echo "  - Fant ikke startmeny i denne GPO"
			End If
			menuFound = False
		End If
	End If
Next
Wscript.Echo vbNewLine & "Resultat: " & pathsFound
pauseScript("Scriptet er ferdig.")

Function GetGPOName(strDomainCon,GUID)
	Dim oExecObject, strResults, strCmd, arrLines, i
	'* * * * * * * * * *
	'* Her brukte vi Microsofts Search.vbs tidligere. Dette går tregt, 
	'* derfor er det erstattet med bare det nødvendigste.
	'strCmd = "cscript search.vbs ""LDAP://" & strDomainCon & """ /C:""&(objectClass=groupPolicyContainer)(name=" & GUID & ")"" /P:displayName /S:SubTree"
	'Set oExecObject = oShell.Exec(strCmd)

	'Do Until oExecObject.StdOut.AtEndOfStream
	'	strResults = oExecObject.StdOut.ReadAll
	'Loop
	'* * * * * * * * * *
	
	'OBS - I stedet for å bruke trege kall til Microsofts trege Search.vbs har jeg hentet ut bare det som trengs.
	'Dette er Search prosedyren og intExecuteSearch funksjonen. Begge er skrevet om.
	Call Search("LDAP://" & strDomainCon, "&(objectClass=groupPolicyContainer)(name=" & GUID & ")", "displayName", "SubTree", "", "", strResults)
	arrLines = Split(strResults, vbNewLine)

	For i = 0 to Ubound(arrLines)
		GetGPOName = arrLines(i)
	Next
End Function

Sub forceUseCScript()   
	If Not WScript.FullName = WScript.Path & "\cscript.exe" Then      
		oShell.Popup "Startet ved bruk av WScript. Starter på nytt...",3,"WSCRIPT"      
		oShell.Run "cmd.exe /k " & WScript.Path & "\cscript.exe //NOLOGO " & Chr(34) & WScript.scriptFullName & Chr(34),1,False
		WScript.Quit 0
	End If
End Sub 

Sub pauseScript(strSecondMessage)
	Dim strMessage, Input
	strMessage = vbNewLine & strSecondMessage & vbNewLine & vbNewLine & "Trykk ENTER for å fortsette." 
	'Wscript.StdOut.Write strMessage
	msgBox strMessage
	WScript.Echo "Trykk ENTER for å fortsette." & vbNewLine & "(CTRL-C) for å avbryte."

	Do While Not WScript.StdIn.AtEndOfLine
		Input = WScript.StdIn.Read(1)
	Loop
End Sub

'********************************************************************
'*
'*OBS: Følgende er en Microsoft sub prosedyre som er omkskrevet for 
'* å behage vårt formål og dette scriptet
'* Atle Holm - 15.05.2011
'*
'********************************************************************

Private Sub Search(strADsPath, strCriteria, strProperties, strScope, strUserName, strPassword, ByRef strResults)
    ON ERROR RESUME NEXT

    Dim strProvider, strSearchPath, objConnect, objCommand
    Dim  objRecordSet, intResult

    'Make sure that the provide is LDAP
    strProvider = Left(strADsPath, InStr(1, strADsPath, ":"))
    If strProvider <> "LDAP:" then
        Wscript.Echo "The provider is not LDAP:."
        Wscript.Quit
    End If
	
    strSearchPath =  "<" & strADsPath & ">;"
    strCriteria = "(" & strCriteria & ");"

    Set objConnect = CreateObject("ADODB.Connection")
    If Err.Number then
        Wscript.Echo "Error 0x" & CStr(Hex(Err.Number)) & " ocurred in opening a connection."
        If Err.Description <> "" Then
            Wscript.Echo "Error description(1-1): " & Err.Description & "."
        End If
        Exit Sub
    End If

    Set objCommand = CreateObject("ADODB.Command")
    If Err.Number then
        Wscript.Echo "Error 0x" & CStr(Hex(Err.Number)) & " ocurred in creating the command object."
        If Err.Description <> "" Then
            Wscript.Echo "Error description(1-2): " & Err.Description & "."
        End If
        Exit Sub
    End If

    objConnect.Provider = "ADsDSOObject"
    If strUserName = "" then
        objConnect.Open "Active Directory Provider"
    Else
        objConnect.Open "Active Directory Provider", strUserName, strPassword
    End If
    If Err.Number then
        Wscript.Echo "Error 0x" & CStr(Hex(Err.Number)) & " ocurred opening a provider."
        If Err.Description <> "" Then
            Wscript.Echo "Error description(1-5): " & Err.Description & "."
        End If
        Exit Sub
    End If

    Set objCommand.ActiveConnection = objConnect

    'Set the query string and other properties
    objCommand.CommandText  = strSearchPath & strCriteria & strProperties & ";" & strScope
    objCommand.Properties("Page Size") = 100000                    'reset search properties
    objCommand.Properties("Timeout") = 300000 'seconds
	'objCommand.Properties("SearchScope") = 2

    'After setting all the parameter now execute the search and display the results.
    intResult = intExecuteSearch(objRecordSet, objCommand, strResults)

    If strOutputFile <> "" Then
        objOutputFile.Close
        If intResult > 0 Then
            Wscript.Echo "Results are saved in file " & strOutputFile & "."
        End If
    End If
End Sub

'********************************************************************
'*
'*OBS: Dette er en Microsoft funksjon som er omkskrevet for å behage 
'* vårt formål og dette scriptet
'* Atle Holm - 15.05.2011
'*
'********************************************************************

Private Function intExecuteSearch(objRecordSet, objCommand, ByRef strResults)
    ON ERROR RESUME NEXT

    Dim  intNumObjects, i, j , k, intUBound, strMessage

    intNumObjects = 0
    intUBound = 0
    intExecuteSearch = 0

    'Let the user know what is going on
    'Wscript.Echo objCommand.CommandText

    'Execute the query
    Set objRecordSet = objCommand.Execute
    
    If Err.Number then
        Wscript.Echo "Error 0x" & CStr(Hex(Err.Number)) & " ocurred during the query."
        If Err.Description <> "" Then
            Wscript.Echo "Error description(2-1): " & Err.Description & "."
        End If
        Err.Clear
        intExecuteSearch = -1        'failed
        Exit Function
    End If

    'Get the total number of objects found.
    objRecordSet.MoveLast
    intNumObjects = objRecordSet.RecordCount
    intExecuteSearch = intNumObjects    'Succeeded

    If intNumObjects Then                'If intNumObjects is not zero
        'Wscript.Echo "Found " & intNumObjects & " objects."
        objRecordSet.MoveFirst
        k = 1
        While Not objRecordSet.EOF
            For i = 0 To objRecordSet.Fields.Count - 1
                intUBound = UBound(objRecordSet.Fields(i).Value)

                If Err.Number Then
                    'This means that it is a single valued property.
                    Err.Clear
                    'strMessage = objRecordSet.Fields(i).Name & " " & k & " = "  & objRecordSet.Fields(i).Value
					strMessage = objRecordSet.Fields(i).Value
                Else                            'It is a multivalued property.
                    If intUBound = 0 Then        'There is only one implemented
                        'strMessage = objRecordSet.Fields(i).Name & " " & k & " = " & objRecordSet.Fields(i).Value(0)
						strMessage = objRecordSet.Fields(i).Value(0)
                    Else                        'It is truely multivalued.
                        'strMessage = objRecordSet.Fields(i).Name & " " & k
						strMessage = ""
                        For j = 0 to intUBound
                            strMessage = strMessage & vbCRLF & "     " & j+1 & " " & objRecordSet.Fields(i).Value(j)
                        Next
                    End If
                End If
                strResults = strResults & strMessage
            Next
            objRecordSet.MoveNext
            k = k + 1
        Wend
    Else
        Wscript.Echo "No object satisfying the criteria has been found within " & strADsPath & "."
    End If
End Function