' ***********************
' Atle Holm - 13.12.2010
' ***********************
' Kopierer alle filer fra sSourcePath til sDestinationPath og legger til dato p&aring; slutten
Option Explicit
On Error Resume Next
Dim oDate, oFSO, oFolder, oFile, sSourcePath, sDestinationPath, sFilename, sFileSuffix

oDate = date()
'Bytt ut f&oslash;lgende med absolutte filstier
sSourcePath = "C:\temp"
sDestinationPath = "C:\temp\temp"

set oFSO = CreateObject("Scripting.FileSystemObject")
If oFSO.FolderExists(sSourcePath) Then
	set oFolder = oFSO.GetFolder(sSourcePath)
Else
	WScript.Echo "Folder " & sSourcePath & " does not exist. Quitting."
	WScript.Quit
End If

For Each oFile in oFolder.Files
	sFilename = Split(oFile.Name,".")(0)
	sFileSuffix = Split(oFile.Name,".")(1)
	oFSO.CopyFile sSourcePath & "\" & oFile.Name , sDestinationPath & "\" & sFilename & "-" & oDate & "." & sFileSuffix
Next