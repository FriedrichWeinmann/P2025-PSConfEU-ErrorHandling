Write-Host "Starting"
Remove-Item -Path C:\Fake\Folder

foreach ($number in 1..1000) {
	$number / 0
}
Write-Host "Done"