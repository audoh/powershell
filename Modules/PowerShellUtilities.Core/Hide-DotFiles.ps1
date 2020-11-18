function Hide-DotFiles {
  param ([Parameter(Position = 1)] [string] $path = ".")

  Get-ChildItem -Recurse -Force $path |
  Where-Object { $_.Name -Like ".*" -and $_.Attributes -Match "Hidden" -Eq $false } |
  ForEach-Object {
    Set-ItemProperty -Path $_ -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
    $_
  }
}
