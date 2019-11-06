$ErrorActionPreference = "SilentlyContinue"

$Answer = "n"
while (($Answer -eq "n") -and ($Answer -ne "y")) {
    $NuovaCartella = Read-Host -Prompt "New folder name"

    $Answer = Read-Host "$($NuovaCartella) continue? (y/n)"
}

$StartingTime = Get-Date

Get-ChildItem -Directory |
    
ForEach-Object {

        
    if (-not(Test-Path -Path "$($_.FullName)\$($NuovaCartella)")) {

        New-Item -ItemType "directory" -Path "$($_.FullName)" -Name "$($NuovaCartella)" 
        Write-Host "Folder Created"

    }
    else {
        Write-Host "$($NuovaCartella) already exists in $($_.FullName)"
    }
}

$FinishingTime = Get-Date
$Time = $FinishingTime - $StartingTime

Write-Host "Operation required $($Time.Milliseconds) ms"