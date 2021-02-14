function ConvertTo-PowerShell {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $True)]
    # If set, prunes local remote branches first .Parameter
    $Value
  )

  $type = $Value.GetType()
  if ($type -eq [System.String]) {
    "`"$Value`""
  } elseif ($type -eq [System.Boolean]) {
    if ($Value) {
      "`$true"
    } else {
      "`$false"
    }
  } elseif ($type.ImplementedInterfaces.Contains([System.Collections.IList])) {
    @("@("
      $Value.GetEnumerator() | ForEach-Object {
        $(ConvertTo-PowerShell $_)
      } | Join-String -Separator "; "
      ")"
    ) | Join-String -Separator " "
  } elseif ($type.ImplementedInterfaces.Contains([System.Collections.ICollection])) {
    @(
      "@{"
      $Value.GetEnumerator() | ForEach-Object {
        "`"$($_.Key)`"=$(ConvertTo-PowerShell $_.Value)"
      } | Join-String -Separator "; "
      "}"
    ) | Join-String -Separator " "
  } else {
    Write-Host $Value
  }

}
