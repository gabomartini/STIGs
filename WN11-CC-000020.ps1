<#
.SYNOPSIS
    Disables IPv6 source routing by setting the protection level to highest.

.NOTES
    Author          : Gabriel Martini
    LinkedIn        : linkedin.com/in/gabomartini/
    GitHub          : github.com/gabomartini
    Date Created    : 2026-04-01
    Last Modified   : 2026-04-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000020.ps1 
#>

$path = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
$name = "DisableIpSourceRouting"
$value = 2

# Ensure the registry path exists
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null
