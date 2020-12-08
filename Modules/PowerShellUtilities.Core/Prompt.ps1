function Prompt {
  $warningPreference = "SilentlyContinue";

  $date = "[$(Get-Date -Format HH:mm)]";
  $path = "$(Get-ShortPath)";
  $git = "";

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

  [Console]::ResetColor()

  # Write at the end to avoid weird jumping about of the cursor
  Write-Host "$($date) $($path)" -NoNewline;
  if ($git) {
    Write-Host " $($git)" -NoNewline -ForegroundColor $color;
  }
  Write-Host " >" -NoNewline;

  return " ";
}
