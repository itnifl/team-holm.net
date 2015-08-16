Sub pauseScript(strSecondMessage)
	Dim strMessage, Input

	strMessage = vbNewLine & strSecondMessage & vbNewLine & vbNewLine & _
	"Trykk ENTER for &aring; fortsette." 
	Wscript.StdOut.Write strMessage
	'Desverre pause scriptet bare en gang, 
	'med mindre man enten ogs&aring; eller i stedet bruker msgBox
	'msgBox strMessage
	WScript.Echo "Trykk ENTER for &aring; fortsette." & vbNewLine & _
	"(CTRL-C) for å avbryte."
	Do While Not WScript.StdIn.AtEndOfLine
		Input = WScript.StdIn.Read(1)
	Loop
End Sub