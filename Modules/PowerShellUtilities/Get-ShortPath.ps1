function Get-ShortPath {
  param ([Parameter(Position = 1)] [string] $path = $executionContext.SessionState.Path.CurrentLocation);

  $profilePath = $env:USERPROFILE;

  # Check profile path exists.
  if (!$profilePath) {
    Write-Warning "Get-ShortPath: Profile path not found.";
    return $path;
  }

  # Replace it in path if found.
  if (($path.length -ge $profilePath.length) -and
    ($path.Substring(0, $profilePath.length)) -eq $profilePath) {
    return "~$($path.Substring($profilePath.length))";
  }
  else {
    return $path;
  }
}
