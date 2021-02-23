function Convert-PathSeparator {
  param (
    [Parameter(Position = 1, Mandatory = $true, ValueFromPipeline = $true)]
    [string]
    $Path
    )
  $Path -Replace "\\", "/"
}
