enum Format {
  Normal
  Verbose
  Body
}
function Invoke-RequestFile {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $True)]
    [string]
    # If set, prunes local remote branches first .Parameter
    $Path,
    [Parameter()]
    [hashtable[]]
    $Replace = @(),
    [Parameter()]
    [switch]
    $PrintCurl = $False,
    [Parameter()]
    [Format]
    $Format = [Format]::Normal
  )

  $request = Get-Content -Path $Path | ConvertFrom-Json

  $url = $request.Url

  if ([string]::IsNullOrWhiteSpace($request.Method)) {
    $method = "GET"
  } else {
    $method = $request.Method
  }

  if ($request.Headers -is [System.Management.Automation.PSCustomObject]) {
    $headers = $request.Headers
  } else {
    $headers = @{}
  }

  if ($request.Body -is [System.Management.Automation.PSCustomObject]) {
    if ($headers."Content-Type" -eq "application/json") {
      $body = $request.Body | ConvertTo-Json -Compress
    } else {
      $body = $request.Body
    }
  } elseif ($request.Body -ne $null) {
    $body = $request.Body.ToString()
  } else {
    $body = $null
  }

  $inputReplacements = @{}
  $Replace | ForEach-Object {
    $_.GetEnumerator() | ForEach-Object {
      $inputReplacements[$_.Key] = $_.Value
    }
  }

  $replacements = @{}
  $request.Replacements.PSObject.Properties | ForEach-Object {
    $settings = $_.Value
    $name = if ($_.Value.Name -ne $null) { $_.Value.Name } else { $_.Name }
    $target = $_.Name
    $replacement = $inputReplacements[$name]

    if ($replacement -eq $null) {
      if ([System.Environment]::GetEnvironmentVariable($name) -ne $null) {
        $replacement = [System.Environment]::GetEnvironmentVariable($name)
      } elseif ($settings.Default) {
        $replacement = $settings.Default
      } elseif ($settings.Required) {
        Write-Error "Required replacement '$($name)'"
        exit 1
      }
    }

    $replacements[$target] = $replacement
  }


  $headers = $headers | ConvertTo-Json -Compress
  $replacements.GetEnumerator() | ForEach-Object {
    Write-Host $_.Key -> $_.Value

    if ($body -is [string]) {
      $body = $body -ireplace [regex]::Escape($_.Key), $_.Value
    }
    if ($url -is [string]) {
      $url = $url -ireplace [regex]::Escape($_.Key), $_.Value
    }
    $headers = $headers -ireplace [regex]::Escape($_.Key), $_.Value
    if ($method -eq $_.Key) {
      $method = $_.Value
    }
  }

  # Convert headers to dictionary"
  $headers = $headers | ConvertFrom-Json -AsHashtable

  if ($PrintCurl) {
    $headerString = ""

    $headers.GetEnumerator() | ForEach-Object {
      $headerString = $headerString + " -H '$($_.Key): $($_.Value)'"
    }

    Write-Host "curl -L -X $method $url -d '$body'$headerString"
  }

  $response = [Microsoft.PowerShell.Commands.BasicHtmlWebResponseObject](
    Invoke-WebRequest -Method $method -Uri $url -Headers $headers -Body $body -SkipHttpErrorCheck
  )
  switch ($Format) {
    Normal {
      Write-Host $response.StatusCode $response.StatusDescription
      $response.Content
    }
    Body { $response.RawContent }
    Verbose { $response }
  }
}

