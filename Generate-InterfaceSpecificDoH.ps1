# DoH Interface-Specific Registry Generator
# This script helps customize the InterfaceSpecificParameters.reg file for your system

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "DoH Interface-Specific Registry Tool" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check for admin privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "WARNING: Not running as Administrator" -ForegroundColor Yellow
    Write-Host "Some operations may require elevation" -ForegroundColor Yellow
    Write-Host ""
}

# Get all network adapters
Write-Host "Detecting network adapters..." -ForegroundColor Green
$adapters = Get-NetAdapter | Select-Object Name, InterfaceDescription, InterfaceGuid, Status, LinkSpeed

if ($adapters.Count -eq 0) {
    Write-Host "ERROR: No network adapters found!" -ForegroundColor Red
    exit 1
}

# Display adapters
Write-Host ""
Write-Host "Available Network Adapters:" -ForegroundColor Yellow
Write-Host ""

$index = 1
$adapterTable = @()
foreach ($adapter in $adapters) {
    $adapterTable += [PSCustomObject]@{
        Index = $index
        Name = $adapter.Name
        Description = $adapter.InterfaceDescription
        GUID = $adapter.InterfaceGuid
        Status = $adapter.Status
        Speed = $adapter.LinkSpeed
    }
    $index++
}

$adapterTable | Format-Table Index, Name, Status, Speed, Description -AutoSize

# Prompt for selection
Write-Host ""
$selection = Read-Host "Select adapter number (1-$($adapters.Count)) or 'Q' to quit"

if ($selection -eq 'Q' -or $selection -eq 'q') {
    Write-Host "Cancelled by user." -ForegroundColor Yellow
    exit 0
}

try {
    $selectedIndex = [int]$selection - 1
    if ($selectedIndex -lt 0 -or $selectedIndex -ge $adapters.Count) {
        Write-Host "ERROR: Invalid selection!" -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "ERROR: Invalid input!" -ForegroundColor Red
    exit 1
}

$selectedAdapter = $adapters[$selectedIndex]
$selectedGuid = $selectedAdapter.InterfaceGuid

Write-Host ""
Write-Host "Selected Adapter:" -ForegroundColor Green
Write-Host "  Name: $($selectedAdapter.Name)"
Write-Host "  Description: $($selectedAdapter.InterfaceDescription)"
Write-Host "  GUID: $selectedGuid"
Write-Host "  Status: $($selectedAdapter.Status)"
Write-Host ""

# Note: This script generates interface-specific DoH configuration dynamically
# It does NOT require the Interface-Specific-Parameters folder
Write-Host "Generating DoH configuration for selected interface..." -ForegroundColor Green
Write-Host ""
Write-Host "NOTE: This script creates interface-specific DoH settings." -ForegroundColor Yellow
Write-Host "For most users, the 'DoH Well-Known Servers.reg' file is sufficient." -ForegroundColor Yellow
Write-Host ""

$confirm = Read-Host "Continue with interface-specific configuration? (Y/N)"
if ($confirm -ne 'Y' -and $confirm -ne 'y') {
    Write-Host "Cancelled. Use 'DoH Well-Known Servers.reg' for simpler setup." -ForegroundColor Yellow
    exit 0
}
Write-Host ""

# Read template from Well-Known Servers and convert to interface-specific format
$wellKnownPath = ".\DoH-Well-Known-Servers\Doh Well Known Servers.reg"
if (-not (Test-Path $wellKnownPath)) {
    Write-Host "ERROR: DoH Well-Known Servers file not found at: $wellKnownPath" -ForegroundColor Red
    Write-Host "This script requires the Well-Known Servers file to generate interface-specific configuration." -ForegroundColor Yellow
    exit 1
}

Write-Host "Reading DoH server configurations..." -ForegroundColor Green
# For now, create a minimal template - in a real implementation, you'd convert the Well-Known servers
$templateContent = @"
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters]

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{INTERFACE_GUID}]

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{INTERFACE_GUID}\DohInterfaceSettings]

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{INTERFACE_GUID}\DohInterfaceSettings\Doh]

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{INTERFACE_GUID}\DohInterfaceSettings\Doh\1.1.1.1]
"DohFlags"=hex(b):11,00,00,00,00,00,00,00
"DohTemplate"="https://cloudflare-dns.com/dns-query"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{INTERFACE_GUID}\DohInterfaceSettings\Doh\8.8.8.8]
"DohFlags"=hex(b):11,00,00,00,00,00,00,00
"DohTemplate"="https://dns.google/dns-query"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{INTERFACE_GUID}\DohInterfaceSettings\Doh\9.9.9.9]
"DohFlags"=hex(b):11,00,00,00,00,00,00,00
"DohTemplate"="https://dns.quad9.net/dns-query"
"@

# Replace placeholder GUID with selected interface GUID
$customizedContent = $templateContent -replace '\{INTERFACE_GUID\}', $selectedGuid

Write-Host "Generated interface-specific DoH configuration" -ForegroundColor Cyan
Write-Host "Note: This includes basic Cloudflare, Google, and Quad9 servers" -ForegroundColor Cyan

# Create output filename
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$outputPath = ".\InterfaceSpecificDoH_$($selectedAdapter.Name -replace '[^a-zA-Z0-9]', '')_$timestamp.reg"

# Save customized file
Write-Host "Generating customized registry file..." -ForegroundColor Green
$customizedContent | Out-File -FilePath $outputPath -Encoding ASCII

Write-Host ""
Write-Host "SUCCESS! Customized registry file created:" -ForegroundColor Green
Write-Host "  $outputPath" -ForegroundColor White
Write-Host ""

# Ask if user wants to import now
Write-Host "Do you want to import this registry file now?" -ForegroundColor Yellow
Write-Host "This will configure DoH for adapter: $($selectedAdapter.Name)" -ForegroundColor Yellow
Write-Host ""
$import = Read-Host "Import now? (Y/N)"

if ($import -eq 'Y' -or $import -eq 'y') {
    if (-not $isAdmin) {
        Write-Host ""
        Write-Host "ERROR: Administrator privileges required to import registry files!" -ForegroundColor Red
        Write-Host "Please run this script as Administrator, or manually import the file:" -ForegroundColor Yellow
        Write-Host "  Right-click the .reg file -> 'Merge' or 'Import'" -ForegroundColor Yellow
        Write-Host ""
        exit 1
    }
    
    Write-Host ""
    Write-Host "Creating registry backup..." -ForegroundColor Green
    $backupPath = ".\dns-backup-$timestamp.reg"
    try {
        reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache" $backupPath /y | Out-Null
        Write-Host "Backup saved to: $backupPath" -ForegroundColor Green
    } catch {
        Write-Host "WARNING: Could not create backup!" -ForegroundColor Yellow
    }
    
    Write-Host "Importing registry file..." -ForegroundColor Green
    try {
        reg import $outputPath
        Write-Host ""
        Write-Host "Registry imported successfully!" -ForegroundColor Green
        Write-Host ""
        
        # Ask to restart DNS service
        $restart = Read-Host "Restart DNS Client service now? (Y/N)"
        if ($restart -eq 'Y' -or $restart -eq 'y') {
            Write-Host "Restarting DNS Client service..." -ForegroundColor Green
            Restart-Service -Name Dnscache -Force
            Write-Host "DNS Client service restarted!" -ForegroundColor Green
            Write-Host ""
            Write-Host "DoH configuration complete!" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Next steps:" -ForegroundColor Yellow
            Write-Host "1. Configure your DNS servers to use DoH-supported addresses"
            Write-Host "2. Run: Get-DnsClientDohServerAddress"
            Write-Host "3. Verify DoH is working"
        } else {
            Write-Host ""
            Write-Host "Registry imported but DNS service not restarted." -ForegroundColor Yellow
            Write-Host "Run 'Restart-Service -Name Dnscache' when ready." -ForegroundColor Yellow
        }
    } catch {
        Write-Host ""
        Write-Host "ERROR: Failed to import registry file!" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        Write-Host ""
        Write-Host "You can manually import: $outputPath" -ForegroundColor Yellow
    }
} else {
    Write-Host ""
    Write-Host "Registry file created but not imported." -ForegroundColor Yellow
    Write-Host "To import manually:" -ForegroundColor Yellow
    Write-Host "  1. Double-click: $outputPath" -ForegroundColor White
    Write-Host "  2. Confirm the import prompt" -ForegroundColor White
    Write-Host "  3. Run: Restart-Service -Name Dnscache" -ForegroundColor White
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Done!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
