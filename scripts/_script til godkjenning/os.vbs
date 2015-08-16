Option Explicit
Dim objWMIService, objItem, colItems
Dim strComputer

On Error Resume Next
strComputer = "."

Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")

Set colItems = objWMIService.ExecQuery ("Select * from Win32_OperatingSystem")

For Each objItem in colItems
	msgbox objItem.SystemDrive
Next
WSCript.Quit