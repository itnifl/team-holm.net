' **************************************************************************************
' Atle Holm - 15.05.2011 
' Henter Terminal Services Profile Path fra AD bruker gitt som argument til funksjonen.
' ************************************************************************************** 
Function getTSProfilePath(strUser)
	On Error Resume Next
	Dim objRoot, sDC, sDC2, ors, objUser, oConnection, oCommand, dnsArray, i, strQuery, ldap
	Dim strBase, strFilter, strAttributes,
	
	Set objRoot = GetObject("LDAP://rootDSE")
	sDC = objRoot.Get("dnshostName")
	
	dnsArray = Split(sDC,".")
	For i = 1 to Ubound(dnsArray)
		If i = 1 Then 
			sDC2 = "dc=" & dnsArray(i)
		Else
			sDC2 = sDC2 & ",dc=" & dnsArray(i)
		End If
	Next

	strBase = "<LDAP://" & sDC2 & ">"
	strFilter = "(&(objectClass=user)(sAMAccountName=" & strUser & "))"
	strAttributes = "sAMAccountName,cn,distinguishedName"
	strQuery = strBase & ";" & strFilter & ";" & strAttributes & ";subtree"
	Set oConnection = CreateObject("ADODB.Connection")
	Set oCommand = CreateObject("ADODB.Command")
	Set ors = createobject("ADODB.Recordset")

	oConnection.Provider = "ADsDSOObject"
	oConnection.Open "ADs Provider"
	oCommand.ActiveConnection = oConnection
	oCommand.CommandText = strQuery
	oCommand.Properties("Page Size") = 99
	
	Set ors = oCommand.Execute
	If Err.Number then
		Wscript.Echo "Error 0x" & CStr(Hex(Err.Number)) & " ocurred during the query."
		If Err.Description <> "" Then
			Wscript.Echo "Error description: " & Err.Description & "."
		End If
		Err.Clear
		Exit Function
	End If
	
	Do Until objRecordSet.EOF
		ldap = ors.fields("distinguishedName").Value
		Set objUser = GetObject("LDAP://" & ldap)
		If objUser.sAMAccountName = strUser Then
			GetFileServer = objUser.TerminalServicesProfilePath
			Exit Function
		End If
		ors.MoveNext
	Loop
End Function