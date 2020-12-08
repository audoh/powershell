function Clear-UntrackedBranches {
  git branch --format "%(refname:short) %(upstream:track)" | ForEach-Object {
    $split = $_.Split(" ")
    if ($split[1] -eq "[gone]") {
      git branch -D $split[0]
    }
  }
}
