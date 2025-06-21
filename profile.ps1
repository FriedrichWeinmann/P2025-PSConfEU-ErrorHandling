Remove-Item -Path C:\Temp\demo\* -Force -Recurse

$null = New-Item -Path C:\Temp\Demo -Name removedemo -ItemType Directory
$null = New-Item -Path C:\Temp\Demo -Name removedemo2 -ItemType Directory
$files = Get-ChildItem -Path C:\Windows -File -Force
foreach ($n in 1..10) {
	$files | Export-Csv -Path "C:\Temp\Demo\removedemo\log-$n.csv"
	$files | Export-Csv -Path "C:\Temp\Demo\removedemo2\log-$n.csv"
}