# Haskell

- Run this PowerShell command to install on Windows:

    `Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { Invoke-Command -ScriptBlock ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -ArgumentList $true } catch { Write-Error $_ }`

- Close and Reopen VSCode
- In VSCode's terminal you should be able to run `ghc --version`
- Compile program with `ghc haskell.hs`
- Run with just `haskell.exe`