function Get-HasUnpushedCommits {
  param ([Parameter(Position = 1)] [string] $branch = "$(Get-GitBranch)");

  $diff = Invoke-Expression "git rev-list --left-only --count $($branch)...origin/$($branch)";
  if ($diff -and $diff[0] -eq "0") {
    return $False;
  }
  else {
    return $True;
  }
}
