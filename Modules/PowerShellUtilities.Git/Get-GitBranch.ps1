function Get-GitBranch {
  return Invoke-Expression "git rev-parse --abbrev-ref HEAD";
}
