[CmdletBinding()]
param (
	
)

trap {
	Write-Warning "Failed: $_"
	$PSCmdlet.ThrowTerminatingError($_)
}

# Handle it
try { Remove-Item -Path C:\Fake\Folder1 -ErrorAction Stop }
catch { Write-Warning "Failed to delete temp folder" }

Write-Host "Starting"

# Ignore it
Remove-Item -Path C:\Fake\Folder2 -ErrorAction Ignore

# Let the chips fall where they will
Remove-Item -Path C:\Fake\Folder3

Write-Host "Done"