Function arrLength(oArray) 
	Dim itemCount, itemIndex
	itemCount = 0 
	For itemIndex = 0 To UBound(oArray) 
		If Not(oArray(itemIndex)) = Empty Then 
			itemCount = itemCount + 1 
		End If 
	Next 
	arrLength = itemCount-1
End Function