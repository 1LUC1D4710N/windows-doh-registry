# DNS Providers Reference Guide

Complete reference for all 12 DNS providers included in this registry, with IPv4/IPv6 addresses, DoH endpoints, hostnames for Private DNS (smartphones), and official sources.

**Total:** 125 configurations from 12 providers (as of October 2025)

---

## ➕ Add Only a Single DNS Provider

If you want to add just one DNS provider from the list, use the script below. Replace `<DNS_IP>` and `<DoH_Template_URL>` with the values for your chosen provider (see the DNS-PROVIDERS-REFERENCE.md for details):

```powershell
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\DohWellKnownServers" -Name '<DNS_IP>' -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\DohWellKnownServers\<DNS_IP>" -Name 'Template' -Value '<DoH_Template_URL>'
```

Example for Cloudflare:

```powershell
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\DohWellKnownServers" -Name '1.1.1.1' -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\DohWellKnownServers\1.1.1.1" -Name 'Template' -Value 'https://cloudflare-dns.com/dns-query'
```

You must run PowerShell as Administrator.

---

## 📱 Quick Reference: Private DNS Hostnames for Smartphones

Use these hostnames in Android/iOS Private DNS settings:
- `dns.nextdns.io` - NextDNS (default, use with or without profile ID)
- `cloudflare-dns.com` - Cloudflare (Standard)
- `dns.google` - Google Public DNS
- `dns.quad9.net` - Quad9 (Security)
- `p0.freedns.controld.com` - Control D (Unfiltered)
- `p1.freedns.controld.com` - Control D (Malware)
- `p2.freedns.controld.com` - Control D (Malware + Ads)
- `p3.freedns.controld.com` - Control D (Malware + Ads + Social)
- `family.freedns.controld.com` - Control D (Family/Parental controls)
- `uncensored.freedns.controld.com` - Control D (Uncensored)
- `protective.joindns4.eu` - DNS4EU (Protective)
- `dns.adguard-dns.com` - AdGuard DNS (Default)
- `family.adguard-dns.com` - AdGuard DNS (Family)
- `unfiltered.adguard-dns.com` - AdGuard DNS (Unfiltered)
- `dns.mullvad.net` - Mullvad DNS (Base)
- `adblock.dns.mullvad.net` - Mullvad DNS (Ad-blocking)
- `base.dns.mullvad.net` - Mullvad DNS (Malware blocking)
- `extended.dns.mullvad.net` - Mullvad DNS (Extended + Social)
- `family.dns.mullvad.net` - Mullvad DNS (Family safe)
- `all.dns.mullvad.net` - Mullvad DNS (Maximum blocking)
- `doh.cleanbrowsing.org` - CleanBrowsing
- `doh.libredns.gr` - LibreDNS
- `anycast.uncensoreddns.org` - UncensoredDNS

---

## 📋 Complete Provider List

### 1. Cloudflare DNS ✅ (Pre-installed in Windows)
**Location:** USA  
**Provider:** Cloudflare, Inc.  
**Privacy Policy:** [Cloudflare Privacy Policy](https://www.cloudflare.com/privacypolicy/)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| Standard | 1.1.1.1, 1.0.0.1 | 2606:4700:4700::1111, 2606:4700:4700::1001 | https://cloudflare-dns.com/dns-query | `cloudflare-dns.com` Also: `one.one.one.one`, `1dot1dot1dot1.cloudflare-dns.com` |
| Security (Malware blocking) | 1.1.1.2, 1.0.0.2 | 2606:4700:4700::1112, 2606:4700:4700::1002 | https://security.cloudflare-dns.com/dns-query | `security.cloudflare-dns.com` |
| Family (Malware + Adult blocking) | 1.1.1.3, 1.0.0.3 | 2606:4700:4700::1113, 2606:4700:4700::1003 | https://family.cloudflare-dns.com/dns-query | `family.cloudflare-dns.com` |

**Note:** For NAT64/DNS64 environments (IPv6-only networks), use hostname `dns64.cloudflare-dns.com` which resolves to 2606:4700:4700::64, 2606:4700:4700::6400.

**Source:** [Cloudflare Developers](https://developers.cloudflare.com/1.1.1.1/)

---

### 2. Google Public DNS ✅ (Pre-installed in Windows)
**Location:** USA  
**Provider:** Google LLC  
**Privacy Policy:** [Google Public DNS Privacy](https://developers.google.com/speed/public-dns/privacy)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| Standard | 8.8.8.8, 8.8.4.4 | 2001:4860:4860::8888, 2001:4860:4860::8844 | https://dns.google/dns-query | `dns.google` |
| DNS64 (IPv6 only) | - | 2001:4860:4860::6464, 2001:4860:4860::64 | https://dns64.dns.google/dns-query | `dns64.dns.google` |

**Note:** DNS64 is IPv6-only and helps IPv6-only networks access IPv4-only services.

**Source:** [Google Public DNS](https://developers.google.com/speed/public-dns)

---

### 3. Quad9 DNS ✅ (Pre-installed in Windows)
**Location:** Switzerland  
**Provider:** Quad9 Foundation  
**Privacy Policy:** [Quad9 Privacy Policy](https://quad9.net/privacy/policy/)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| Standard (Malware blocking, DNSSEC) | 9.9.9.9, 149.112.112.112 | 2620:fe::fe, 2620:fe::9 | https://dns.quad9.net/dns-query | `dns.quad9.net` |
| Alternative Endpoint (Same filtering) | 9.9.9.9, 149.112.112.9 | 2620:fe::9, 2620:fe::fe:9 | https://dns9.quad9.net/dns-query | `dns9.quad9.net` |
| Unsecured (No malware blocking, no DNSSEC) | 9.9.9.10, 149.112.112.10 | 2620:fe::10, 2620:fe::fe:10 | https://dns10.quad9.net/dns-query | `dns10.quad9.net` |
| Secured with ECS (Malware blocking, DNSSEC, ECS enabled) | 9.9.9.11, 149.112.112.11 | 2620:fe::11, 2620:fe::fe:11 | https://dns11.quad9.net/dns-query | `dns11.quad9.net` |

**Source:** [Quad9 Service Addresses](https://quad9.net/service/service-addresses-and-features)

---

### 4. Control D ❌ (NEW)
**Location:** USA/Canada  
**Provider:** Control D Inc.  
**Privacy Policy:** [Control D Privacy](https://controld.com/privacy)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| P0 - Unfiltered | 76.76.2.0, 76.76.10.0 | 2606:1a40::, 2606:1a40:1:: | https://freedns.controld.com/p0 | `p0.freedns.controld.com` |
| P1 - Malware | 76.76.2.1, 76.76.10.1 | 2606:1a40::1, 2606:1a40:1::1 | https://freedns.controld.com/p1 | `p1.freedns.controld.com` |
| P2 - Malware + Ads | 76.76.2.2, 76.76.10.2 | 2606:1a40::2, 2606:1a40:1::2 | https://freedns.controld.com/p2 | `p2.freedns.controld.com` |
| P3 - Malware + Ads + Social | 76.76.2.3, 76.76.10.3 | 2606:1a40::3, 2606:1a40:1::3 | https://freedns.controld.com/p3 | `p3.freedns.controld.com` |
| Family - Parental controls | 76.76.2.4, 76.76.10.4 | 2606:1a40::4, 2606:1a40:1::4 | https://freedns.controld.com/family | `family.freedns.controld.com` |
| Uncensored | 76.76.2.5, 76.76.10.5 | 2606:1a40::5, 2606:1a40:1::5 | https://freedns.controld.com/uncensored | `uncensored.freedns.controld.com` |

**Source:** [Control D Free DNS](https://controld.com/free-dns)

---

### 5. DNS4EU (JoinDNS4) ❌ (NEW)
**Location:** Europe (EU-funded)  
**Provider:** DNS4EU Consortium  
**Privacy Policy:** [DNS4EU Privacy Policy](https://www.dns4eu.eu/privacy-policy/)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| Protective | 86.54.11.1, 86.54.11.201 | 2a13:1001::86:54:11:1, 2a13:1001::86:54:11:201 | https://protective.joindns4.eu/dns-query | `protective.joindns4.eu` |
| Child Safe | 86.54.11.12, 86.54.11.212 | 2a13:1001::86:54:11:12, 2a13:1001::86:54:11:212 | https://child.joindns4.eu/dns-query | `child.joindns4.eu` |
| No Ads | 86.54.11.13, 86.54.11.213 | 2a13:1001::86:54:11:13, 2a13:1001::86:54:11:213 | https://noads.joindns4.eu/dns-query | `noads.joindns4.eu` |
| Child Safe + No Ads | 86.54.11.11, 86.54.11.211 | 2a13:1001::86:54:11:11, 2a13:1001::86:54:11:211 | https://child-noads.joindns4.eu/dns-query | `child-noads.joindns4.eu` |
| Unfiltered | 86.54.11.100, 86.54.11.200 | 2a13:1001::86:54:11:100, 2a13:1001::86:54:11:200 | https://unfiltered.joindns4.eu/dns-query | `unfiltered.joindns4.eu` |

**Source:** [DNS4EU](https://www.dns4eu.eu/)

---

### 6. NextDNS ❌ (NEW)
**Location:** Global (Anycast)  
**Provider:** NextDNS Inc.  
**Privacy Policy:** [NextDNS Privacy](https://nextdns.io/privacy)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| Anycast | 45.90.28.0, 45.90.30.0 | 2a07:a8c0::, 2a07:a8c1:: | https://dns.nextdns.io/ | `dns.nextdns.io` |

**Note:** NextDNS is primarily configuration-based. Users should create custom profiles at https://nextdns.io/. For DoT/Private DNS, use `dns.nextdns.io` or `profile-id.dns.nextdns.io` (replace `profile-id` with your NextDNS profile ID for custom filtering).

**Source:** [NextDNS Anycast IPs](https://help.nextdns.io/t/g9hmv0a/what-are-the-nextdns-anycast-ips)

---

### 7. CleanBrowsing ❌ (NEW)
**Location:** USA  
**Provider:** CleanBrowsing  
**Privacy Policy:** [CleanBrowsing Privacy](https://cleanbrowsing.org/privacy)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| Family Filter (Blocks adult content, proxies/VPNs, mixed content sites) | 185.228.168.168, 185.228.169.168 | 2a0d:2a00:1::, 2a0d:2a00:2:: | https://doh.cleanbrowsing.org/doh/family-filter/ | `family-filter-dns.cleanbrowsing.org` |
| Adult Filter (Blocks adult content only) | 185.228.168.10, 185.228.169.11 | 2a0d:2a00:1::1, 2a0d:2a00:2::1 | https://doh.cleanbrowsing.org/doh/adult-filter/ | `adult-filter-dns.cleanbrowsing.org` |
| Security Filter (Blocks malware, phishing, spam only) | 185.228.168.9, 185.228.169.9 | 2a0d:2a00:1::2, 2a0d:2a00:2::2 | https://doh.cleanbrowsing.org/doh/security-filter/ | `security-filter-dns.cleanbrowsing.org` |

**Source:** [CleanBrowsing Filters](https://cleanbrowsing.org/filters/)

---

### 8. Mullvad DNS ❌ (NEW)
**Location:** Sweden  
**Provider:** Mullvad VPN (Amagicom AB)  
**Privacy Policy:** [Mullvad Privacy](https://mullvad.net/privacy)

| Variant | IPv4 | IPv6 | DoH Template | Hostname/Private DNS |
|---------|------|------|--------------|---------------------|
| Base (No filtering) | 194.242.2.2 | 2a07:e340::2 | https://dns.mullvad.net/dns-query | `dns.mullvad.net` |
| Ad-blocking | 194.242.2.3 | 2a07:e340::3 | https://adblock.dns.mullvad.net/dns-query | `adblock.dns.mullvad.net` |
| Base (Ads + Trackers + Malware) | 194.242.2.4 | 2a07:e340::4 | https://base.dns.mullvad.net/dns-query | `base.dns.mullvad.net` |
| Extended (+ Social Media blocking) | 194.242.2.5 | 2a07:e340::5 | https://extended.dns.mullvad.net/dns-query | `extended.dns.mullvad.net` |
| Family (+ Adult + Gambling blocking) | 194.242.2.6 | 2a07:e340::6 | https://family.dns.mullvad.net/dns-query | `family.dns.mullvad.net` |
| All (Maximum blocking) | 194.242.2.9 | 2a07:e340::9 | https://all.dns.mullvad.net/dns-query | `all.dns.mullvad.net` |

**Source:** [Mullvad DNS Help](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls/)

---

### 9. AdGuard DNS ❌ (NEW)
**Location:** Cyprus  
**Provider:** AdGuard Software Ltd.  
**Privacy Policy:** [AdGuard DNS Privacy](https://adguard.com/privacy/dns.html)

| Variant | IPv4 | IPv6 | DoH Template | Private DNS Hostname (DoT) |
|---------|------|------|--------------|---------------------------|
| Default (Ad-blocking) | 94.140.14.14, 94.140.15.15 | 2a10:50c0::ad1:ff, 2a10:50c0::ad2:ff | https://dns.adguard-dns.com/dns-query | `dns.adguard-dns.com` |
| Family (Adult content blocking) | 94.140.14.15, 94.140.15.16 | 2a10:50c0::bad1:ff, 2a10:50c0::bad2:ff | https://family.adguard-dns.com/dns-query | `family.adguard-dns.com` |
| Unfiltered | 94.140.14.140, 94.140.14.141 | 2a10:50c0::1:ff, 2a10:50c0::2:ff | https://unfiltered.adguard-dns.com/dns-query | `unfiltered.adguard-dns.com` |

**Source:** [AdGuard DNS](https://adguard-dns.io/)

---

### 10. Cisco Umbrella (OpenDNS) ❌ (NEW)
**Location:** USA  
**Provider:** Cisco Systems  
**Privacy Policy:** [Cisco Privacy](https://www.cisco.com/c/en/us/about/legal/privacy-full.html)

| Variant | IPv4 | IPv6 | DoH Template URL | Hostname/Private DNS |
|---------|------|------|------------------|---------------------|
| Standard | 208.67.222.222, 208.67.220.220 | 2620:119:35::35, 2620:119:53::53 | https://dns.opendns.com/dns-query | `dns.opendns.com` |
| FamilyShield | 208.67.222.123, 208.67.220.123 | 2620:119:35::123, 2620:119:53::123 | https://familyshield.opendns.com/dns-query | `familyshield.opendns.com` |
| Sandbox | 208.67.222.2, 208.67.220.2 | 2620:0:ccc::2, 2620:0:ccd::2 | https://sandbox.opendns.com/dns-query | `sandbox.opendns.com` |

**Source:** [OpenDNS Support](https://support.opendns.com/hc/en-us/articles/360038086532)

---

### 11. LibreDNS ❌ (NEW)
**Location:** Germany  
**Provider:** LibreOps  
**Privacy Policy:** [LibreDNS Privacy](https://libredns.gr/privacy/)

| Variant | IPv4 | IPv6 | DoH Template | Private DNS Hostname (DoT) |
|---------|------|------|--------------|---------------------------|
| No Ads (Crowdsourced blocklist) | 116.202.176.26 | 2a01:4f8:1c0c:8274::1 | https://doh.libredns.gr/noads | `noads.libredns.gr` |

**Note:** LibreDNS also offers a standard non-filtering endpoint at `https://doh.libredns.gr/dns-query` (Private DNS: `dot.libredns.gr`).

**Source:** [LibreDNS](https://libredns.gr/)

---

### 12. UncensoredDNS ❌ (NEW)
**Location:** Denmark  
**Provider:** Thomas Steen Rasmussen (Unicast)  
**Privacy Policy:** [UncensoredDNS Privacy](https://blog.uncensoreddns.org/dns-privacy/)

| Variant | IPv4 | IPv6 | DoH Template | Private DNS Hostname |
|---------|------|------|--------------|---------------------|
| Anycast | 91.239.100.100 | 2001:67c:28a4:: | https://anycast.uncensoreddns.org/dns-query | `anycast.uncensoreddns.org` |
| Unicast (Copenhagen, DK) | 89.233.43.71 | 2a01:3a0:53:53:: | https://unicast.uncensoreddns.org/dns-query | `unicast.uncensoreddns.org` |

**Source:** [UncensoredDNS](https://uncensoreddns.org/)

---

## 🔐 Privacy & Security Considerations

### What DoH Provides:
- ✅ **Encryption:** DNS queries encrypted in transit
- ✅ **Privacy:** ISP cannot see your DNS queries
- ✅ **Security:** Protection against DNS spoofing on untrusted networks
- ✅ **Integrity:** Prevents DNS tampering by intermediaries

### Important Notes:
- ⚠️ **DNS Provider Visibility:** Your chosen DNS provider can still see all queries
- ⚠️ **Malware Protection:** Some security tools rely on DNS inspection
- ⚠️ **Parental Controls:** May conflict with router-level filtering
- ⚠️ **Geographic Restrictions:** Some content may behave differently with non-local DNS

### Choosing a Provider:
- **Privacy-focused:** Mullvad, NextDNS
- **Security-focused:** Quad9, Cloudflare Security
- **Family-safe:** Cloudflare Family, Control D Family, CleanBrowsing
- **EU-based (GDPR):** DNS4EU, Quad9
- **Customizable:** Control D, NextDNS
- **Ad-blocking:** AdGuard, Mullvad, Control D variants

---

## 📊 Total Configurations

This registry includes **125 DNS configurations** across **12 providers**:
- 3 pre-installed in Windows (Cloudflare, Google, Quad9)
- 11 additional providers

All configurations verified against official documentation as of October 2025.

DNS0.eu was discontinued on October 17th, 2025. All related IP addresses and registry entries have been removed. For secure DNS-over-HTTPS, use alternatives such as DNS4EU or NextDNS.io.

---

**Last Updated:** October 15, 2025  
**Verification Status:** ✅ All configurations verified against official sources

