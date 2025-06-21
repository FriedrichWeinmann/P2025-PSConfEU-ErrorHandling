trap {
	Write-Warning "Things failed: $_"
}

Write-Host "Starting"
1 / 0
Write-Host "Done"