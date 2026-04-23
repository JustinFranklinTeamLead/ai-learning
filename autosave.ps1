Write-Host "Auto-save started. Pushing to GitHub every 5 minutes. Press Ctrl+C to stop." -ForegroundColor Green

while ($true) {
    Set-Location $PSScriptRoot

    $changes = git status --porcelain
    if ($changes) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
        git add -A
        git commit -m "Auto-save: $timestamp"
        git push
        Write-Host "[$timestamp] Saved and pushed to GitHub." -ForegroundColor Cyan
    } else {
        Write-Host "[$(Get-Date -Format 'HH:mm')] No changes to save." -ForegroundColor Gray
    }

    Start-Sleep -Seconds 300
}
