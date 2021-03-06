function Initialize-Git {
[CmdletBinding()]
Param()
<#
.SYNOPSIS
	Sets up the GitHub Git Shell Environment
.DESCRIPTION
	Sets up the proper PATH and ENV to use GitHub for Window's shell environment
#>
	if ($env:github_shell -eq $null) 
	{
		. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")

		# Shell.ps1 overwrites TMP and TEMP with a version with a trailing '\'
 		$env:TMP = $env:TEMP = [system.io.path]::gettemppath().TrimEnd('\')

		Import-Module Posh-Git
		Enable-GitColors
		Start-SshAgent -Quiet
		
		# We prefer hub.exe to git.exe, if available
		if (Get-Command "hub.exe" -ErrorAction SilentlyContinue)
		{
			set-alias -Scope Global git hub.exe
		}
	}
	else 
	{
		Write-Verbose "GitHub shell environment already setup"
	}
}

Export-ModuleMember Initialize-Git
