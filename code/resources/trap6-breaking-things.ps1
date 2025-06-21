[CmdletBinding()]
param ()
$ErrorActionPreference = 'Stop'
trap {
	Write-Warning "Failed: $_"
	#$PSCmdlet.ThrowTerminatingError( $_)
	break
}

function Invoke-Fail {
	[CmdletBinding()]
	param ()

	Write-Host "Starting"
	$PSCmdlet.ThrowTerminatingError(
		[System.Management.Automation.ErrorRecord]::new(
			[Exception]::new("2 is evil!"),
			"2IsEvil",
			[System.Management.Automation.ErrorCategory]::InvalidData,
			2
		)
	)
	Write-Host "Done"
}

Write-Host "Starting Script"
Invoke-Fail
Write-Host "Completing Script"