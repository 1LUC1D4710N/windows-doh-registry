# Windows DoH Registry - More DNS Privacy Options

**Expand Windows DNS over HTTPS (DoH) support from 3 providers to 12 providers with one registry import.**

---

## 🚀 How to Install (2 Simple Steps)

### Step 1: Download & Import the Registry File
1. **[Click here to download: Doh-Well-Known-Servers.reg](Doh-Well-Known-Servers.reg)** (Right-click → "Save link as")
2. **Right-click** the downloaded file → Select **"Merge"**
3. Click **"Yes"** when Windows asks for permission
4. Done! All 147 DoH providers are now available in Windows

### Step 2: Choose Your DNS Provider
**Windows 11:** Settings → Network & Internet → Properties → DNS server assignment → Edit  
**Windows 10:** Settings → Network → Change adapter options → Right-click connection → Properties → IPv4

**Popular DNS IPs:**
- Cloudflare Security (Fast, privacy-focused):
  `1.1.1.2` - `1.0.0.2`
  `2606:4700:4700::1112` - `2606:4700:4700::1002`  
  `https://security.cloudflare-dns.com/dns-query`
  
- Quad9 (Blocks malware):
  IPv4
  `9.9.9.9` - `149.112.112.112`
  IPv6
  `2620:fe::fe` - `2620:fe::9`
  DoH
  `https://dns.quad9.net/dns-query`
  Private DNS (smartphone DNS)
  `dns.quad9.net`
  
- DNS0.EU (EU-based, zero-logging):
  `193.110.81.0` - `185.253.5.0`
  `193.110.81.0` - `185.253.5.0`
  `
  
- DNS4EU:
  `86.54.11.1` - `86.54.11.201`
  `86.54.11.1` - `86.54.11.201`
  `
  
- Control D:
  `76.76.2.2` - `76.76.10.2`
  `https://freedns.controld.com/p2`


---

### ✅ Verify It Works (Optional)
Open PowerShell and run:
```powershell
Get-DnsClientDohServerAddress
```
You should see DNS IPs with DoH template URLs. If you see "False" values, **that's normal** - it means DoH is working correctly!

---

## 📋 DNS Providers You Can Use

| Provider | Location | Example IP | Features |
|----------|----------|------------|----------|
| **Cloudflare** ✅ | USA | 1.1.1.1 | Fast, privacy-focused, family filtering |
| **Google** ✅ | USA | 8.8.8.8 | Reliable, DNS64 support |
| **Quad9** ✅ | Switzerland | 9.9.9.9 | Security-focused, blocks malware |
| **Control D** ❌ | USA/Canada | 76.76.2.0 | 6 customizable filtering profiles |
| **DNS0.EU** ❌ | Europe | 193.110.81.0 | Zero-logging, open-source |
| **DNS4EU** ❌ | Europe | 86.54.11.1 | EU-funded, multiple filters |
| **NextDNS** ❌ | Global | 45.90.28.0 | Customizable, privacy-first |
| **CleanBrowsing** ❌ | USA | 185.228.168.9 | Family-safe, adult filter |
| **Mullvad DNS** ❌ | Sweden | 194.242.2.2 | VPN provider, ad-blocking |
| **AdGuard DNS** ❌ | Cyprus | 94.140.14.14 | Ad-blocking, family protection |
| **Cisco Umbrella/OpenDNS** ❌ | USA | 208.67.222.222 | Enterprise-grade security |

✅ = Already in Microsoft's default list  
❌ = **NEW** - Added by this registry (not in Microsoft's list)

**Total:** 147 configurations from 12 providers

---

## 🔒 Privacy & Security

**Is This Safe?**

**Yes!** This registry file:
- ✅ Only adds DoH templates (doesn't change your current DNS)
- ✅ Doesn't modify any system files
- ✅ Is fully reversible
- ✅ Contains no personal information
- ✅ Has been verified against official provider documentation

**What it does:** Tells Windows "If you see IP X.X.X.X, use DoH template Y"  
**What it doesn't do:** Change your DNS settings automatically

You still control which DNS provider you use through Windows Settings.

**All 147 configurations verified against official sources.** ✅

---

## 🎯 What This Does

Microsoft's Windows has supported DNS over HTTPS since 2020, but only includes **3 DNS providers** by default:
- Cloudflare (1.1.1.1)
- Google (8.8.8.8)
- Quad9 (9.9.9.9)

This registry adds **9 more privacy-focused DNS providers** with 147 total configurations, giving you more choices for encrypted DNS.

```
┌─────────────────────────────────────────────────────────────┐
│  📊 WHAT YOU GET                                            │
├─────────────────────────────────────────────────────────────┤
│  ✅ 147 DNS configurations (Microsoft has 3)                │
│  ✅ 12 DNS providers (Microsoft has 3)                      │
│  ✅ European providers for GDPR compliance                  │
│  ✅ Family-safe filtering options                           │
│  ✅ Ad-blocking DNS variants                                │
│  ✅ Customizable filtering profiles                         │
│  ✅ All verified against official sources                   │
└─────────────────────────────────────────────────────────────┘
```

---

## ❓ Why Did I Create This?

I'm a Greenlander IT enthusiast who successfully advocated for **File Explorer tabs in Windows**. Microsoft listened to community feedback and delivered!

Now I'm back with another community improvement: **expanding Windows' DoH provider list** beyond the same 3 providers it's had since 2020.

This project represents **years of research and verification**. I'm sharing it openly because:
- Users need more DNS privacy options NOW
- Microsoft's list hasn't been updated in 5+ years
- Community contributions should be shared
- Maybe Microsoft will expand their default list (again!) 🇬🇱➡️🪟

**Read the full story:** [WHY-THIS-MATTERS.md](WHY-THIS-MATTERS.md)

---

## 🤝 For Microsoft

Dear Windows Team: This registry represents years of verification work, and I'm sharing it openly. If you're interested in expanding Windows' default DoH provider list, all the research is here and ready.

**We've collaborated successfully before (File Explorer tabs). Let's do it again!**

---

## 📖 Additional Documentation

- **[DNS-PROVIDERS-REFERENCE.md](DNS-PROVIDERS-REFERENCE.md)** - Complete DNS provider details, IPv6 addresses, and official sources
- **[WHY-THIS-MATTERS.md](WHY-THIS-MATTERS.md)** - The full story behind this project + Microsoft collaboration invite
- **[CHANGELOG.md](CHANGELOG.md)** - Version history

---

## 📊 Quick Stats

- **147 configurations** (Microsoft has 3)
- **12 providers** (Microsoft has 3)
- **100% verified** against official sources
- **Years of research** compiled into one registry file
- **Ready to use** right now

---

**Last Updated:** October 2025  
**Status:** ✅ Verified and ready for public use  
**License:** MIT License - Free to use with attribution

---

*Built by a Greenlander who loves Windows and wants to help make it better.* 🇬🇱
