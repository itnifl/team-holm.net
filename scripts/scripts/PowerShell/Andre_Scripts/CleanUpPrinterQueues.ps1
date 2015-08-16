#Atle Holm - 2013
#Cancels all print queues in local computer with errors in them:

(Get-WMIObject Win32_Printer -computername . | where-object {$_.Status.toUpper -eq "ERROR" -or $_.PrinterState -eq 1 `
-or $_.PrinterState -eq 7 -or $_.ExtendedDetectedErrorState -eq 11 -or $_.ExtendedDetectedErrorState -eq 12 `
-or $_.ExtendedDetectedErrorState -eq 13 -or $_.ExtendedPrinterStatus -eq 9 -or $_.DetectedErrorState -eq 1 `
-or $_.DetectedErrorState -eq 8 -or $_.DetectedErrorState -eq 11}) `
| %{$name = $_.Name; "Cancelling all jobs on $name"; $_.CancelAllJobs() > $NULL}