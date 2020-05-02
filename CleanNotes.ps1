param(
    [string]
    $notesPath
)
get-childItem $notesPath | Where-Object {$_.length -eq 0} | remove-Item