'Lister alle filer i en mappe, sFolder.

On Error Resume Next

Dim oFSO, oFolder, arrFiles, sFolder    
Set oFSO = CreateObject("Scripting.FileSystemObject")  
sFolder = "m:\Program Files\Common Files\"
Set oFolder = oFSO.GetFolder(sFolder)  
Set arrFiles = oFolder.Files
For each strFile In arrFiles
	Wscript.Echo strFile
Next