function Prompt {
  $WarningPreference = "SilentlyContinue";

  try {
    $date = "[$(Get-Date -Format HH:mm)]";
    $path = "$(Get-ShortPath)";
    $git = "";
    $color = "Black"

    if (Get-IsGitRepository) {
      $branch = Get-GitBranch;
      $color = "Cyan";

      if (Get-HasUncommittedChanges) {
        $color = "Red";
      }
      elseif (Get-HasUnpushedCommits $branch) {
        $color = "Yellow";
      }

      $git = "($($branch))";
    }
  }
  catch {
    Write-Host $_ -ForegroundColor "Red"
    $git = "[error]"
    $color = "Red"
  }

  [Console]::ResetColor()

  # Write at the end to avoid weird jumping about of the cursor
  Write-Host "$($date) $($path)" -NoNewline;
  if ($git) {
    Write-Host " $($git)" -NoNewline -ForegroundColor $color;
  }

  Write-Host " " -NoNewline

  return "> ";
}
