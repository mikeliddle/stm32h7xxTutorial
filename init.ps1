# region ALIASES

Function Invoke-Build {
    C:\ST\STM32CubeCLT_1.18.0\CMake\bin\cmake.EXE --build . --config Debug
}

Function Invoke-NextLesson {
    $currentDir = Get-Location
    if ($currentDir -match "Chapter(\d+)$") {
        $currentChapter = [int]$matches[1]
        $nextChapter = $currentChapter + 1
        $nextChapterDir = Join-Path $currentDir.Path "..\Chapter$nextChapter"
        if (Test-Path $nextChapterDir) {
            Set-Location $nextChapterDir
        } else {
            Write-Host "Next chapter directory does not exist: Chapter$nextChapter" -ForegroundColor Yellow
        }
    } else {
        Write-Host "Current directory does not match the expected chapter format." -ForegroundColor Red
    }
}

Function Invoke-Chapter1 {
    Set-Location $env:WorkspaceRoot\Chapter1
}
Function Invoke-Chapter2 {
    Set-Location $env:WorkspaceRoot\Chapter2
}
Function Invoke-Chapter3 {
    Set-Location $env:WorkspaceRoot\Chapter3
}
Function Invoke-Chapter4 {
    Set-Location $env:WorkspaceRoot\Chapter4
}
Function Invoke-Chapter5 {
    Set-Location $env:WorkspaceRoot\Chapter5
}
Function Invoke-Chapter6 {
    Set-Location $env:WorkspaceRoot\Chapter6
}
Function Invoke-Chapter7 {
    Set-Location $env:WorkspaceRoot\Chapter7
}
Function Invoke-Chapter8 {
    Set-Location $env:WorkspaceRoot\Chapter8
}

# endregion ALIASES

$env:WorkspaceRoot = (Get-Location).Path

if (-not (Get-Command cmake -ErrorAction SilentlyContinue)) {
    winget install cmake
}

if (-not (Get-Command ninja -ErrorAction SilentlyContinue)) {
    winget install ninja
}

if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    winget install Microsoft.VisualStudioCode
}

if (-not (code --list-extensions | Select-String -Pattern "stm32")) {
    code --install-extension stm32-vscode
}

if (-not (Get-Command python3 -ErrorAction SilentlyContinue)) {
    winget install python3.12
}

if (-not (Get-Command cpplint -ErrorAction SilentlyContinue)) {
    python3 -m pip install cpplint
}

Copy-Item tools/hooks/pre-commit .git/hooks/pre-commit -Force

Set-Alias -Name build -Value Invoke-Build
Set-Alias -Name next -Value Invoke-NextLesson
Set-Alias -Name nl -Value Invoke-NextLesson

Set-Alias -Name chapter1 -Value Invoke-Chapter1
Set-Alias -Name chapter2 -Value Invoke-Chapter2
Set-Alias -Name chapter3 -Value Invoke-Chapter3
Set-Alias -Name chapter4 -Value Invoke-Chapter4
Set-Alias -Name chapter5 -Value Invoke-Chapter5
Set-Alias -Name chapter6 -Value Invoke-Chapter6
Set-Alias -Name chapter7 -Value Invoke-Chapter7
Set-Alias -Name chapter8 -Value Invoke-Chapter8
