# failsafe
return

#----------------------------------------------------------------------------#
#                     Throw is not (always) terminating!                     #
#----------------------------------------------------------------------------#

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
				$PSCmdlet.ThrowTerminatingError(
					[System.Management.Automation.ErrorRecord]::new(
						[System.ArgumentException]::new("2 is evil"),
						"2IsEvil",
						[System.Management.Automation.ErrorCategory]::InvalidArgument,
						$numberEntry
					)
				)
			}
			$numberEntry * 3
		}
	}
}
1..3 | Get-Triple
1..3 | Get-Triple -ErrorAction SilentlyContinue
try { 1..3 | Get-Triple -ErrorAction SilentlyContinue }
catch { Write-Warning "Failed: $_" }

# Compensate
#-------------
function Get-Triple {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[int[]]
		$Number
	)

	process {
		foreach ($numberEntry in $Number) {
			if (2 -eq $numberEntry) { throw "2 is evil!" }
			$numberEntry * 3
		}
	}
}

# True Terminating Exception
#-----------------------------
function Get-Quintuple {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[int[]]
		$Number
	)

	process {
		foreach ($numberEntry in $Number) {
			if (2 -eq $numberEntry) { throw "2 is evil!" }
			$numberEntry * 5
		}
	}
}





# Next: Sometimes-Terminating Exceptions
code "$presentationRoot\03-SometimesTerminating.ps1"