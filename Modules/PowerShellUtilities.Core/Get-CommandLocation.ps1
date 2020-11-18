function Get-CommandLocation {
  [Alias("which")]
  param ([Parameter(Position = 1, Mandatory = $true)] [string] $cmd);
  try {
    return (Get-Command $cmd -ErrorAction Stop).Path
  }
  catch {
    Write-Error $_
  }
}
