function Get-HasUncommittedChanges {
  $status = Invoke-Expression "git status --porcelain";
  return [boolean] $status;
}
