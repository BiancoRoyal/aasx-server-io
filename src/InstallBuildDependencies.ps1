﻿<#
.SYNOPSIS
This script installs the dependencies necessary to build the solution.
#>

$ErrorActionPreference = "Stop"

Import-Module (Join-Path $PSScriptRoot Common.psm1) -Function `
    AssertDotnet

function Main {
    Set-Location $PSScriptRoot

    if ($null -eq (Get-Command "nuget.exe" -ErrorAction SilentlyContinue))
    {
       throw "Unable to find nuget.exe in your PATH"
    }


    Write-Host "Restoring packages for the solution ..."
    nuget.exe restore AasxServer.sln -PackagesDirectory packages
}

$previousLocation = Get-Location; try { Main } finally { Set-Location $previousLocation }
