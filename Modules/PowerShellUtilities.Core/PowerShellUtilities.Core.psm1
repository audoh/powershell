. $PSScriptRoot\Get-ShortPath.ps1
Import-Module -Name $PSScriptRoot\..\PowerShellUtilities.Git
. $PSScriptRoot\Get-CommandLocation.ps1
. $PSScriptRoot\Hide-DotFiles.ps1
. $PSScriptRoot\Prompt.ps1
Export-ModuleMember -Function Prompt, Hide-DotFiles, Get-CommandLocation
Export-ModuleMember -Alias which
