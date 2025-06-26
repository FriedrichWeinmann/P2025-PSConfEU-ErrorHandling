# failsafe
return

#----------------------------------------------------------------------------#
#                           Preferential Treatment                           #
#----------------------------------------------------------------------------#

$ErrorActionPreference

function Get-Preference {
	[CmdletBinding()]
	param ()

	$ErrorActionPreference
}
Get-Preference
Get-Preference -ErrorAction Stop
Get-Preference -ErrorAction Ignore

$ErrorActionPreference = 'Stop'
Get-Preference
$ErrorActionPreference = 'Continue'

function Get-EAParameter {
	[CmdletBinding()]
	param ()

	if ($PSBoundParameters.Keys -contains 'ErrorAction') {
		$PSBoundParameters.ErrorAction
	}
}
Get-EAParameter -ErrorAction Stop
Get-EAParameter
Get-EAParameter -ErrorAction SilentlyContinue


# Next: ???
code "$presentationRoot\07-Questions.ps1"