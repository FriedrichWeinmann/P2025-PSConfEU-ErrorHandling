function Invoke-Fail {
	[CmdletBinding()]
	param (
		[string]
		$Message = 'Failed!'
	)

	$PSCmdlet.ThrowTerminatingError(
		[System.Management.Automation.ErrorRecord]::new(
			[Exception]::new($Message),
			"Failed",
			[System.Management.Automation.ErrorCategory]::NotSpecified,
			$null
		)
	)
}

1..2 | ForEach-Object {
	Invoke-Fail
	$_
}
#-> The ForEach-Object continues though it should be terminating? Should it?

<#
Turns out, .ThrowTerminatingError is only terminating within the pipeline itself.
Specifically: It is designed to kill the entire pipeline the command is part of.
Outside it is an _operator_ error, that requires a try/catch or a trap statement!

In our Example above, Invoke-Fail is a _nested_ pipeline and not part of the outer pipeline.
A single command is still a pipeline in PowerShell - just one with a single element.

Solution:
If the outer pipeline is wrapped in a try/catch - or covered under a trap - it still behaves as expected.
#>
trap {
	Write-Warning "Failed: $_"
	throw $_
}
1..2 | ForEach-Object {
	Invoke-Fail
	$_
}