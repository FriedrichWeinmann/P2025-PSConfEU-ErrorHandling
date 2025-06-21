[CmdletBinding()]
param (
	
)

$ErrorActionPreference = 'Stop'
trap {
	Write-Warning "Script failed: $_"
	throw $_
}

#region Functions

#endregion Functions

