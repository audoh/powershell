<#
.SYNOPSIS
  Clears out local Git branches whose tracking branches are gone.
#>
function Clear-UntrackedBranches {
  [CmdletBinding()]
  param (
    [Parameter()]
    [switch]
    # If set, prunes local remote branches first .Parameter
    $Prune
  )

  if ($Prune) {
    git remote | ForEach-Object { git remote prune $_ }
  }

  git branch --format "%(refname:short) %(upstream:track)" | ForEach-Object {
    $split = $_.Split(" ")
    if ($split[1] -eq "[gone]") {
      git branch -D $split[0]
    }
  }
}
