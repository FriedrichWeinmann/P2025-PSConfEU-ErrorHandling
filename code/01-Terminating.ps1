# Failsafe
return

#----------------------------------------------------------------------------#
#                      Terminating vs. Non-Terminating                       #
#----------------------------------------------------------------------------#

try { Remove-Item -Path C:\Fake\Folder }
catch { Write-Warning "Failed" }

try { Remove-Item -Path C:\Fake\Folder -ErrorAction Stop }
catch { Write-Warning "Failed" }
# Why?
#-------

<#
The core concept:
- Terminating: When no success is possible
- Non-Terminating: Further success is possible
#>

#-> Example
Get-ChildItem -Path C:\Temp\Demo\removedemo
Invoke-Item -Path C:\Temp\Demo\removedemo\log-3.csv
Get-ChildItem -Path C:\Temp\Demo\removedemo | Remove-Item -ErrorAction Stop

Get-Mailbox | Get-MailboxStatistics | Write-DbaDataTable -SqlInstance sql1 -Database db1 -table mailboxes


# Scripts, Exitcodes & Terminating Errors
#------------------------------------------

code "$presentationRoot\resources\terminate1-nonlethal.ps1"
powershell.exe -File "$presentationRoot\resources\terminate1-nonlethal.ps1"
$LASTEXITCODE

code "$presentationRoot\resources\terminate1-lethal.ps1"
powershell.exe -File "$presentationRoot\resources\terminate1-lethal.ps1"
$LASTEXITCODE


# Do-It-Yourself
#-----------------

#-> Non-Terminating
function Get-Double {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[int[]]
		$Number
	)

	process {
		foreach ($numberEntry in $Number) {
			if (2 -eq $numberEntry) {
				Write-Error "2 is evil!"
				continue
			}
			$numberEntry * 2
		}
	}
}
1..3 | Get-Double
1..3 | Get-Double -ErrorAction Stop
1..3 | Get-Double -ErrorAction SilentlyContinue

#-> Terminating
function Get-Triple {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[int[]]
		$Number
	)

	process {
		foreach ($numberEntry in $Number) {
			if (2 -eq $numberEntry) {
				throw "2 is evil!"
			}
			$numberEntry * 3
		}
	}
}
1..3 | Get-Triple
try { 1..3 | Get-Triple }
catch { "Failed: $_"}
1..3 | Get-Triple -ErrorAction Ignore

# Next: But ... throw does not mean a terminating exception!
code "$presentationRoot\02-NotTerminating.ps1"