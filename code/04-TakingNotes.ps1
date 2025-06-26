# failsafe
return

#----------------------------------------------------------------------------#
#                        Kicking Ass and Taking Names                        #
#----------------------------------------------------------------------------#

Get-ChildItem -Path 'C:\Temp\Demo\removedemo2'

Invoke-Item -Path 'C:\Temp\Demo\removedemo2\log-1.csv'
Invoke-Item -Path 'C:\Temp\Demo\removedemo2\log-3.csv'
Invoke-Item -Path 'C:\Temp\Demo\removedemo2\log-7.csv'

Get-ChildItem -Path 'C:\Temp\Demo\removedemo2' | Remove-Item -ErrorAction SilentlyContinue -ErrorVariable failed
$failed
$failed.TargetObject
#-> TargetObject

# Write-Error & TargetObject
#-----------------------------
Write-Error "2 is evil!"
$error[0].TargetObject # empty
Write-Error "2 is evil!" -TargetObject 2
$error[0].TargetObject # 2


# Remoting & Errors
#--------------------

#-> Just in case you actually want to run this Fred
$code = { Get-CimInstance Win32_OperatingSystem }

# A) Don't do this
$servers = 'server1','server2','server3','server4','server5','server6','server7'
$results = foreach ($server in $servers) {
	try { Invoke-Command -ComputerName $server -ScriptBlock $code -ErrorAction Stop }
	catch { Write-Warning "Failed to connect to $server" }
}

# B) Now in parallel
$servers = 'server1','server2','server3','server4','server5','server6','server7'
$results = Invoke-Command -ComputerName $servers -ScriptBlock $code -ErrorAction SilentlyContinue -ErrorVariable failed
foreach ($connectionError in $failed) {
	Write-Warning "Failed to connect to $($connectionError.TargetObject)"
}
<#
Errors within remoting code should be handled within, the result object indicating success or failure.
#>

# Next: IT'S A TRAP!!!!
code "$presentationRoot\05-ItsATrap.ps1"