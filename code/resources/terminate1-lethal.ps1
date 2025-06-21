Write-Host "Starting"
Remove-Item -Path C:\Fake\Folder -ErrorAction Stop

foreach ($number in 1..1000) {
	$number / 0
}
Write-Host "Done"