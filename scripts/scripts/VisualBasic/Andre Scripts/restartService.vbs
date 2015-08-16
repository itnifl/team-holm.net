' ***********************
' Atle Holm - ??.12.2010
' ***********************
' Restarter en bestemt tjeneste definert i strService(det finnes enklere m&aring;ter &aring; gj&oslash;re dette p&aring;).
Option Explicit
Dim objWMIService, objItem, objService
Dim colListOfServices, strComputer, strService, intSleep 

strComputer = "."
intSleep = 15000


On Error Resume Next

strService = " 'Applica GTS'"
Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colListOfServices = objWMIService.ExecQuery ("Select * from Win32_Service Where Name ="& strService & " ")
For Each objService in colListOfServices
	objService.StopService()
	WSCript.Sleep intSleep
	objService.StartService()
Next 
WScript.Quit