[CmdletBinding()]
param (
	
)

trap {
	Write-Warning "Failed: $_"
}

Write-Host "Starting"
foreach ($number in 1..3) {
	if (2 -eq $number) { throw "2 is evil!" }
	$number
}
Write-Host "Done"