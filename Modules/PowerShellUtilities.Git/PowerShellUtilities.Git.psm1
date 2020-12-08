. $PSScriptRoot\Get-IsGitRepository.ps1
. $PSScriptRoot\Get-GitBranch.ps1
. $PSScriptRoot\Get-HasUncommittedChanges.ps1
. $PSScriptRoot\Get-HasUnpushedCommits.ps1
. $PSScriptRoot\Clear-UntrackedBranches.ps1

Export-ModuleMember -Function Get-IsGitRepository, Get-GitBranch, Get-HasUncommittedChanges, Get-HasUnpushedCommits, Clear-UntrackedBranches
