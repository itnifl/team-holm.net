Dim strCmd, oExecObject, oShell, strResults

strCmd = "cscript scriptToRun.vbs"
Set oShell = CreateObject("WScript.Shell")
Set oExecObject = oShell.Exec(strCmd)

'Vis resultatet:
Do Until oExecObject.StdOut.AtEndOfStream
	strResults = oExecObject.StdOut.ReadAll
Loop