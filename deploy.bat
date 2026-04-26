@echo off
REM P&F Etching Store - Quick Deploy Script
REM Usage: deploy.bat https://github.com/YOUR_USERNAME/webstore.git

cd /d "%~dp0"

echo.
echo === P&F Store Deploy ===
echo.

if "%1"=="" (
    echo Enter your GitHub repo URL:
    echo Example: https://github.com/USERNAME/webstore.git
    set /p REPO_URL="Repo URL: "
) else (
    set REPO_URL=%1
)

REM Initialize git if needed
if not exist ".git" (
    echo Initializing git...
    git init
)

REM Setup remote
git remote -v 2>nul | findstr "origin" >nul
if errorlevel 1 (
    git remote add origin %REPO_URL%
) else (
    git remote set-url origin %REPO_URL%
)

REM Show files
echo.
echo Files to deploy:
git status --short
echo.

REM Deploy
set /p MSG="Commit message (or Enter for default): "
if "%MSG%"=="" set MSG=Update store

git add .
git commit -m "%MSG%"
git push -u origin main --force

if %errorlevel%==0 (
    echo.
    echo SUCCESS! Store deployed.
    echo.
    echo Enable GitHub Pages in repo Settings after first push:
    echo Settings ^> Pages ^> Source: Deploy from branch (main / root)
    echo.
) else (
    echo.
    echo Push failed. Check URL and try again.
    pause
)