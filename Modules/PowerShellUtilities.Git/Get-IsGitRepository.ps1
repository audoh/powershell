function Get-IsGitRepository {
  $result = Invoke-Expression "git rev-parse --is-inside-work-tree" 2>&1;
  return $result -eq "true";
}
