# DoH Well-Known Servers Registry File

## What This File Does

This registry file adds DNS over HTTPS (DoH) server templates to Windows, allowing the operating system to automatically upgrade DNS queries to encrypted HTTPS connections when you use supported DNS servers.

## Status: ✅ READY FOR DISTRIBUTION

This file has been reviewed and corrected for syntax errors. It is safe to distribute and use.

## How It Works

When you configure your network adapter to use one of the DNS server IP addresses listed in this file, Windows will automatically recognize it and use the corresponding DoH template for encrypted DNS queries.

### Example:
- You set your DNS to `1.1.1.1` (Cloudflare)
- Windows recognizes this IP from the registry
- Windows automatically uses `https://cloudflare-dns.com/dns-query` for DoH

## Included DNS Providers

### Cloudflare
- **1.1.1.1 / 1.0.0.1** → Standard (no filtering)
- **1.1.1.2 / 1.0.0.2** → Security (blocks malware)
- **1.1.1.3 / 1.0.0.3** → Family (blocks malware + adult content)
- IPv6 equivalents included

### Google Public DNS
- **8.8.8.8 / 8.8.4.4** → Standard DNS
- **2001:4860:4860::8888** → IPv6
- **2001:4860:4860::64** → DNS64 support

### Quad9
- **9.9.9.9** → Security-focused (blocks malicious domains)
- **9.9.9.10 / 9.9.9.11** → Alternative servers
- **149.112.112.x** → Additional endpoints
- IPv6 support included

### Control D (Free DNS)
- **76.76.2.0-5 / 76.76.10.0-5** → Various filtering profiles
  - p0: Unfiltered
  - p1-p3: Custom profiles
  - family: Family-safe filtering
  - uncensored: No filtering
- IPv6 equivalents included

### DNS0.EU (European, Privacy-focused)
- **193.110.81.0 / 185.253.5.0** → Standard
- **193.110.81.9 / 185.253.5.9** → Zero-logging variant
- **193.110.81.1 / 185.253.5.1** → Kids filter
- IPv6 equivalents included

### JoinDNS4 (European, Privacy-focused)
- **86.54.11.1 / 86.54.11.201** → Protective (malware blocking)
- **86.54.11.12 / 86.54.11.212** → Child protection
- **86.54.11.13 / 86.54.11.213** → Ad blocking
- **86.54.11.11 / 86.54.11.211** → Child protection + ad blocking
- IPv6 equivalents included

## Installation

### Simple Method
Double-click the `Doh Well Known Servers.reg` file and confirm the import.

### PowerShell Method
```powershell
# Import the registry file
reg import "Doh Well Known Servers.reg"

# Restart DNS Client service
Restart-Service -Name Dnscache
```

### Manual Method
1. Open Registry Editor (regedit.exe) as Administrator
2. Navigate to: `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters`
3. File → Import → Select this .reg file

## After Installation

1. **Configure your DNS server** in network settings to use one of the supported IPs
2. **Restart DNS Client service** or reboot
3. **Verify DoH is working**:
   ```powershell
   Get-DnsClientDohServerAddress
   ```

## Important Notes

✅ **Safe for system-wide use** - This file only adds templates, doesn't change active DNS settings
✅ **No GUID dependency** - Works on any Windows 10 (19628+) / Windows 11 system
✅ **Automatic activation** - DoH activates automatically when you use a recognized DNS server
✅ **Reversible** - Can be uninstalled without affecting DNS functionality

## What Was Fixed

- ✅ Added missing opening brackets `[` to 8 JoinDNS4 IPv6 entries
- ✅ Corrected Google DNS64 templates to use proper HTTPS URLs
- ✅ Verified all Template values use correct DoH endpoint formats

## Compatibility

- Windows 10 version 19628 or later
- Windows 11 (all versions)
- Windows Server 2022 or later

## Privacy & Security

This registry modification:
- ✅ Enables encrypted DNS (prevents eavesdropping)
- ✅ Only provides templates (doesn't force any DNS provider)
- ✅ No telemetry or tracking added
- ❌ Does NOT modify your current DNS settings
- ❌ Does NOT collect any data

Your DNS queries will be encrypted IF you choose to use one of these DNS servers in your network settings.

---

**File Version**: 1.1 (Corrected)
**Last Updated**: October 14, 2025
**Status**: Production-ready
