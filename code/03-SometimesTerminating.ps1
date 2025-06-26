# failsafe
return

#----------------------------------------------------------------------------#
#                      Sometimes-Terminating Exceptions                      #
#----------------------------------------------------------------------------#

Write-Host "Starting"
1 / 0
Write-Host "Ending"

try {
	Write-Host "Starting"
	1 / 0
	Write-Host "Ending"
}
catch { Write-Warning "Failed: $_" }

# Why?

# Next: Taking Notes when stuff breaks
code "$presentationRoot\04-TakingNotes.ps1"