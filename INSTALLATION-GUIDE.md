# DoH Registry Installation Guide

## ⚠️ CRITICAL: Read Before Installing

### System Requirements
- Windows 10 (version 19628 or later) / Windows 11
- Administrator privileges
- Active internet connection

### Pre-Installation Checklist

#### 1. Backup Your Current Registry
Before making any changes, create a backup:

```powershell
# Export current DNS cache settings
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache" "dns-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss').reg"
```

#### 2. (Optional) Advanced Configuration

For most users, the Well-Known Servers file is sufficient. Advanced users can use the PowerShell script for interface-specific configuration if needed.

### Installation Steps

This adds DoH templates that Windows can automatically recognize:

1. Review the file: `DoH-Well-Known-Servers\Doh Well Known Servers.reg`
2. Double-click to import, or run:
   ```powershell
   reg import "DoH-Well-Known-Servers\Doh Well Known Servers.reg"
   ```
3. Restart DNS Client service:
   ```powershell
   Restart-Service -Name Dnscache
   ```

#### Advanced Option: Interface-Specific Configuration (Optional)

For advanced users who need per-interface DoH control, use the included PowerShell script:

```powershell
.\Generate-InterfaceSpecificDoH.ps1
```

This script will:
- Detect your network adapters automatically
- Generate a customized registry file for your system
- Optionally import it and restart DNS service

### Verification

Check if DoH is active:

```powershell
# Check DNS client settings
Get-DnsClientDohServerAddress

# Test DNS resolution
nslookup example.com

# Check Windows Event Viewer
Get-WinEvent -LogName "Microsoft-Windows-DNS-Client/Operational" -MaxEvents 20
```

### Troubleshooting

#### DNS Not Working After Installation

1. **Clear DNS cache:**
   ```powershell
   Clear-DnsClientCache
   ```

2. **Reset DNS to automatic:**
   ```powershell
   # Find your adapter name first
   Get-NetAdapter
   
   # Reset DNS servers (replace "Ethernet" with your adapter name)
   Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ResetServerAddresses
   ```

3. **Restore from backup:**
   ```powershell
   reg import "dns-backup-YYYYMMDD-HHMMSS.reg"
   Restart-Service -Name Dnscache
   ```

#### No DoH Connection Established

- Check if your DNS server IP matches a known DoH provider
- Verify internet connectivity to DoH endpoints
- Some VPNs or corporate networks may block DoH
- Firewall may be blocking HTTPS (port 443) to DNS servers

### Uninstallation

To remove DoH settings:

```powershell
# Remove Well-Known Servers
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\DohWellKnownServers" /f

# Restart DNS service
Restart-Service -Name Dnscache
```

If you used the advanced PowerShell script for interface-specific settings:

```powershell
# Remove Interface-Specific settings (replace GUID with yours)
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\{YOUR-GUID-HERE}\DohInterfaceSettings" /f

# Restart DNS service
Restart-Service -Name Dnscache
```

### DNS Providers Included

| Provider | IPv4 | IPv6 | Features |
|----------|------|------|----------|
| Cloudflare | 1.1.1.1 | 2606:4700:4700::1111 | Standard, Security, Family |
| Google | 8.8.8.8 | 2001:4860:4860::8888 | Standard, DNS64 |
| Quad9 | 9.9.9.9 | 2620:fe::fe | Security-focused |
| Control D | 76.76.2.0 | 2606:1a40:: | Multiple profiles |
| DNS0.EU | 193.110.81.0 | 2a0f:fc80:: | Privacy-focused (EU) |
| JoinDNS4 | 86.54.11.x | 2a13:1001::86:54:11:x | Filtering options (EU) |

### Security Considerations

- ✅ DoH encrypts DNS queries (privacy protection)
- ✅ Prevents DNS spoofing on untrusted networks
- ⚠️ Your DNS provider can still see all queries
- ⚠️ Some malware protection tools rely on DNS inspection
- ⚠️ May conflict with parental control software

### Support & Issues

If you experience issues:
1. Check Windows version compatibility
2. Verify the GUID matches your network adapter
3. Ensure DoH servers are reachable from your network
4. Check Windows Firewall/antivirus settings

---

**Last Updated**: October 14, 2025
