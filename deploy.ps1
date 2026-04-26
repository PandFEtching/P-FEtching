# P&F Etching - Deploy Script
# Run this to upload your store to GitHub

param(
    [string]$RepoUrl = "",
    [string]$Message = "Update store"
)

$folder = $PSScriptRoot
if (-not $folder) { $folder = Split-Path -Parent $MyInvocation.MyCommand.Path }

Write-Host "`n=== P&F Etching Store Deploy ===`n" -ForegroundColor Cyan

# Check if git initialized
Set-Location $folder
if (-not (Test-Path ".git")) {
    Write-Host "Initializing git repository..." -ForegroundColor Yellow
    git init
    git add .
    git commit -m "Initial store setup"
}

# Get repo URL if not provided
if (-not $RepoUrl) {
    Write-Host "Enter your GitHub repo URL (e.g., https://github.com/USERNAME/webstore.git)" -ForegroundColor Yellow
    $RepoUrl = Read-Host "Repo URL"
}

# Set remote if needed
try {
    $current = git remote get-url origin 2>$null
    if ($current -and $current -ne $RepoUrl) {
        git remote set-url origin $RepoUrl
    } elseif (-not $current) {
        git remote add origin $RepoUrl
    }
} catch {
    git remote add origin $RepoUrl
}

# Show status
Write-Host "`nFiles to deploy:" -ForegroundColor Cyan
git status --short

# Commit and push
if (-not $Message -or $Message -eq "Update store") {
    $Message = Read-Host "Commit message (press Enter for default)"
    if (-not $Message) { $Message = "Update store" }
}

Write-Host "`nCommitting and pushing..." -ForegroundColor Yellow
git add .
git commit -m $Message
git push -u origin main --force

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n=== SUCCESS ===" -ForegroundColor Green
    $username = ($RepoUrl -split '/')[-2]
    Write-Host "Your store: https://$username.github.io/webstore" -ForegroundColor Cyan
    Write-Host "Admin: https://$username.github.io/webstore/admin.html" -ForegroundColor Cyan
} else {
    Write-Host "`nPush failed. Check your repo URL and internet connection." -ForegroundColor Red
}

Write-Host "`nNote: Enable GitHub Pages in repo Settings after first push!" -ForegroundColor Yellow
Write-Host "Settings → Pages → Source: Deploy from branch (main / root) → Save`n" -ForegroundColor Yellow