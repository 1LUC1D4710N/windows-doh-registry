
# Windows DoH Registry - More DNS Privacy Options

**Expand Windows DNS over HTTPS (DoH) support from 3 providers to 14 providers with one registry import.**

---


## ℹ️ About the Registry File

The main registry file (`Doh-Well-Known-Servers.reg`) contains raw data for all supported DNS providers missing from the default Windows DoH registry. This lets you add every provider at once, or you can add just a single provider if you prefer.

---


### Step 1: Download & Import the Registry File
1. **[Click here to download: Doh-Well-Known-Servers.reg](Doh-Well-Known-Servers.reg)** (Right-click → "Save link as")
2. **Right-click** the downloaded file → Select **"Merge"**
3. Click **"Yes"** when Windows asks for permission
4. Done! All 147 DoH providers are now available in Windows

### Step 2: Choose Your DNS Provider

**Windows 11:** Settings → Network & Internet → Properties → DNS server assignment → Edit  
**Windows 10:** Settings → Network → Change adapter options → Right-click connection → Properties → IPv4

**Popular DNS IPs:**
- Cloudflare Security (Fast, privacy-focused).
- Quad9 (Blocks malware).
- Mullvad (Excellent privacy and strong blocking)
- DNS0.EU (EU-based, zero-logging).
- DNS4EU(EU-based, zero-logging).
- Control D (Excellent privacy, zero-logging, excellence in optional).

---

### 🧩 How “Autotemplate” Works
When you add DNS providers to DohWellKnownServers, Windows will automatically suggest the correct DoH template when you enter a matching DNS IP in your network settings. This “autotemplate” feature makes it easy for anyone to set up encrypted DNS—just enter the IP, and Windows fills in the rest!

### ⚡ Advanced: Enforce DoH on All Interfaces
For advanced users or organizations: To guarantee all network adapters (Ethernet, Wi-Fi, VPN, etc.) use your chosen DoH servers, you can also populate the InterfaceSpecificParameters registry section. This enforces DoH usage system-wide, even if network settings are reset or changed.

### 🖼️ See It in Action
<img alt="Windows DoH autotemplate example" src="https://user-images.githubusercontent.com/your-screenshot-link.png">

When you enter a supported DNS IP, Windows fills in the DoH template automatically!

### ❓ Troubleshooting & FAQ

**Q: I don’t see the DoH template appear when I enter a DNS IP.**  
A: Make sure you’ve imported the latest Doh-Well-Known-Servers.reg file and are using a supported DNS IP.

**Q: How do I remove these entries?**  
A: Right-click the .reg file and select “Merge” to add entries. To remove, use Registry Editor to delete the relevant keys, or restore a backup.

**Q: Is this safe?**  
A: Yes! The registry file only adds trusted DoH templates and does not change your current DNS settings.

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

This registry adds **11 more privacy-focused DNS providers** with 147 total configurations, giving you more choices for encrypted DNS.

```
┌─────────────────────────────────────────────────────────────┐
│  📊 WHAT YOU GET                                            │
├─────────────────────────────────────────────────────────────┤
│  ✅ 147 DNS configurations (Microsoft has 3)                │
│  ✅ 14 DNS providers (Microsoft has 3)                      │
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

---

## 📊 Quick Stats

- **147 configurations** (Microsoft has 3)
- **14 providers** (Microsoft has 3)
- **100% verified** against official sources
- **Years of research** compiled into one registry file
- **Ready to use** right now

---

**Last Updated:** October 2025  
**Status:** ✅ Verified and ready for public use  
**License:** MIT License - Free to use with attribution

---


---

## ℹ️ What is Markdown?

This page (and most documentation here) uses **Markdown** (`.md`), a simple text format for easy-to-read, easy-to-write documentation. Markdown lets you create headings, tables, code blocks, and links with plain text. It’s widely supported and can be parsed or generated by scripts for automation.

Learn more: https://www.markdownguide.org/

*Built by a Greenlander who loves Windows and wants to help make it better.* 🇬🇱
