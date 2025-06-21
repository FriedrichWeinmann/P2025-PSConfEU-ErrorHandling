# Failsafe
return

#----------------------------------------------------------------------------#
#                      Terminating vs. Non-Terminating                       #
#----------------------------------------------------------------------------#

try { Remove-Item -Path C:\Fake\Folder }
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
			$numberEntry * 2
		}
	}
}

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
			$numberEntry * 3
		}
	}
}

# Next: But ... throw does not mean a terminating exception!
code "$presentationRoot\02-NotTerminating.ps1"