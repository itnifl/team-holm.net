'** Atle Holm 14.04.2015 - atle@team-holm.net
'** Kopierer inn maler fra sentral lokasjon hvis de er nyere og tar kopi av originalmal med suffix .original i samme mappe

Option Explicit
'On Error Resume Next
Dim oDate, oFSO, oFileNameSplit, oShell, oFile2Delete
Dim sFiles(1), sFileName, sFile, sDestinationPath, sUNC, oFileName, sName, sAppdata
 
Set oShell = CreateObject("WScript.Shell")
set oFSO = CreateObject("Scripting.FileSystemObject")
 
'Les inn sti som skal sjekkes og sti til fil med servere fra bruker:
sFiles(0) = "\\UNCSServer\dfsroot\RedirectedContent\maler\Normal.dotm"
sFiles(1) = "\\UNCSServer\dfsroot\RedirectedContent\maler\NormalEmail.dotm"

sAppdata = oShell.expandEnvironmentStrings("%APPDATA%")
sDestinationPath = sAppdata & "\Microsoft\Maler\"

If Not oFSO.FolderExists(sAppdata + "\Microsoft\") Then
	oFSO.CreateFolder(sAppdata & "\Microsoft\")
End If 
If Not oFSO.FolderExists(sAppdata + "\Microsoft\Maler\") Then
	oFSO.CreateFolder(sAppdata & "\Microsoft\Maler\")
End If 
 
set oFSO = CreateObject("Scripting.FileSystemObject")
 
For Each sFile In sFiles
	If Right(sDestinationPath,1) <> "\" Then
      sDestinationPath = sDestinationPath & "\"
	End If
   
	oFileNameSplit = Split(sFile,"\")
	sFileName = oFileNameSplit(arrLength(oFileNameSplit))
	
	Dim oDate1, oDate2, osFileName, odFileName
	Set osFileName = Nothing
	Set odFileName = Nothing
	
	If oFSO.FileExists(sDestinationPath & sFileName) Then
		set odFileName = oFSO.getfile(sDestinationPath & sFileName)
	End If
	If oFSO.FileExists(sFile) Then
		set osFileName = oFSO.getfile(sFile)
	End If
		
	If Not osFileName Is Nothing And Not odFileName Is Nothing Then
		oDate1 = osFileName.DateLastModified
		oDate2 = odFileName.DateLastModified
	End If

    If oFSO.FileExists(sDestinationPath & sFileName) Then		
		If DateDiff("d", oDate2, oDate1) > 0 Then
			If oFSO.FileExists(sDestinationPath & sFileName & ".original") Then
				Set oFile2Delete = oFSO.GetFile(sDestinationPath & sFileName & ".original")
				oFile2Delete.Delete
			End If
			'Renaming file			
			sName = odFileName.name
			odFileName.name = sName & ".original"
			set odFileName = nothing
		End If
    End If
    If oFSO.FolderExists(sDestinationPath) And Not oFSO.FileExists(sDestinationPath & sFileName) Then
		oFSO.CopyFile sFile, sDestinationPath,TRUE
	ElseIf oFSO.FolderExists(sDestinationPath) Then
		If DateDiff("d", oDate2, oDate1) > 0 Then
			oFSO.CopyFile sFile, sDestinationPath,TRUE
		End If
    End If
Next
 
Function arrLength(oArray) 
   Dim itemCount, itemIndex
   itemCount = 0 
   For itemIndex = 0 To UBound(oArray) 
      If Not(oArray(itemIndex)) = Empty Then
         itemCount = itemCount + 1 
      End If
   Next
   arrLength = itemCount + 1
End Function
