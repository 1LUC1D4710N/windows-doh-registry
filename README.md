# Windows DoH Registry - More DNS Privacy Options

**Expand Windows DNS over HTTPS (DoH) support from 3 providers to 12 providers with one registry import.**


---

      DNS0.eu has been discontinued on October 17th, 2025. 
      For secure DNS-over-HTTPS, use alternatives like DNS4EU or NextDNS.io.
      Mullvad DNS discontinued since November 2, 2026.

---

### Step 1: Download & Import the Registry File
1. **[Click here to download: Doh-Well-Known-Servers.reg](Doh-Well-Known-Servers.reg)** (Right-click → "Save link as")
2. **Right-click** the downloaded file → Select **"Merge"**
3. Click **"Yes"** when Windows asks for permission
4. Done! All 114 DoH configurations from 12 providers are now available in Windows

### Step 2: Choose Your DNS Provider

**Windows 11:** Settings → Network & Internet → Properties → DNS server assignment → Edit  
**Windows 10:** Settings → Network → Change adapter options → Right-click connection → Properties → IPv4


**Popular DNS IPs:**
- Cloudflare Security (Fast, privacy-focused).
- Quad9 (Blocks malware).
- DNS4EU (EU-based, zero-logging).
- Control D (Excellent privacy, zero-logging, excellence in optional).

---

### 🧩 How “Autotemplate” Works
When you add DNS providers to DohWellKnownServers, Windows will automatically suggest the correct DoH template when you enter a matching DNS IP in your network settings. This “autotemplate” feature makes it easy for anyone to set up encrypted DNS—just enter the IP, and Windows fills in the rest!


### 🖼️ See It in Action
<a href="https://www.youtube.com/watch?v=uHLK47c-mBs">
   <img src="https://img.youtube.com/vi/uHLK47c-mBs/0.jpg" alt="Windows DoH autotemplate example" width="560" height="315">
</a>



When you enter a supported DNS IP, Windows fills in the DoH template automatically!

---
### ❓ Troubleshooting & FAQ

#### Common Issues & Solutions

**Q: I get an error when importing the .reg file.**

A: Make sure you have administrator rights. Right-click the .reg file and select "Run as administrator." If you see a syntax error, check that the file was downloaded completely and is not corrupted.

**Q: I don’t see the DoH template appear when I enter a DNS IP.**

A: Make sure you’ve imported the latest Doh-Well-Known-Servers.reg file and are using a supported DNS IP. Restart your computer or network adapter if changes don’t appear immediately.

**Q: How do I validate the registry entries?**

A: Open PowerShell and run:

```powershell
Get-DnsClientDohServerAddress
```


You should see DNS IPs with DoH template URLs. If you see "False" values, **that's normal** – it means DoH is working correctly!


**Q: How do I remove these entries?**

A: Use Registry Editor, open it as administrator and to navigate to: `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\DohWellKnownServers` and delete the relevant keys. Always back up your registry before making changes.

**Q: Is this safe?**

A: Yes! The registry file only adds trusted DoH templates and does not change your current DNS settings. Always download .reg files from trusted sources.

**Safety Tips:**

- Always back up your registry before making changes.
- Only import .reg files you trust.
- If you encounter issues, restore your registry from a backup.

**Q: My system is unstable or registry errors persist after troubleshooting. What’s the best fix?**


A: If troubleshooting takes too long or registry issues persist, you can easily repair Windows with an upgrade installation:

**Quick Fix: Repair Windows with an ISO (No Data Loss)**

1. **Download the latest Windows ISO:** [Download Windows 10/11 ISO from Microsoft](https://www.microsoft.com/en-us/software-download/windows)
2. **Right-click the ISO file** in File Explorer and select **"Mount"**. This will create a new virtual DVD drive.
3. **Open the new drive** and double-click **`setup.exe`**.
4. Follow the prompts and choose **"Keep personal files and apps"** when asked. This will repair Windows while keeping your files and programs.
5. Let the upgrade complete and restart your PC.

This process repairs system files and registry issues without deleting your data or installed software. Only choose a clean install if you want to start completely fresh. For most users, the upgrade installation is a safe and easy fix for persistent problems.

---

### ❓ Frequently Asked Questions (FAQ)

**Q: Will this change my current DNS provider?**
A: No. The registry file only adds new DoH templates. You still choose your DNS provider in Windows Settings.

**Q: Can I safely remove these registry entries?**
A: Yes. You can use Registry Editor to delete the relevant keys, or restore a backup.

**Q: Is it safe to import these registry files?**
A: Yes, as long as you download them from trusted sources. Always back up your registry before making changes.

**Q: What if I see errors when importing?**
A: Make sure you have administrator rights and the file is not corrupted. See Troubleshooting for more help.

**Q: How do I verify the DoH templates are working?**
A: Use PowerShell:

```powershell
Get-DnsClientDohServerAddress
```

**Q: Can I contribute or suggest new providers?**
A: Yes! Open an issue or pull request on GitHub, or contact the project maintainer.

---

### 🌐 Global InterfaceSpecificParameters: Systemwide DoH Enforcement

For advanced users, IT administrators, and managed workstations: you can enforce DNS-over-HTTPS (DoH) systemwide across all network adapters (Ethernet, Wi-Fi, VPN, etc.) using Global InterfaceSpecificParameters. This method is not dependent on network GUIDs and applies DoH settings globally, guaranteeing encrypted DNS for every interface.

- **Not GUID-dependent:** Applies to all adapters, not just one specific network.
- **Ideal for:** IT admins, managed devices, or users who want guaranteed DoH enforcement everywhere.
- **How it works:** Adds a 'GlobalDohIP' section to the registry, matching all major DNS providers in the DoH autotemplate.

#### 📥 Download the Global InterfaceSpecificParameters Registry File

- [Click here to download: Global-InterfaceSpecificParameter.reg](Global-Interface-Specific-Parameters/Global-InterfaceSpecificParameter.reg) (Right-click → "Save link as")
- Right-click the downloaded file → Select "Merge"
- Click "Yes" when Windows asks for permission
- Done! DoH is now enforced systemwide for all supported DNS providers



---
**How to Remove Global DoH Enforcement**

To remove the systemwide DoH enforcement added by the Global InterfaceSpecificParameters registry file:

**Q: How do I remove these entries?**

A: Use Registry Editor, open it as administrator and to navigate to:
   `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\GlobalDohIP` and delete the relevant keys. Always back up your registry before making changes.

*This restores your system to its previous DNS behavior. Only remove these entries if you want to disable global DoH enforcement.*

---

## 📋 DNS Providers You Can Use

| Provider | Location | Example IP | Features |
|----------|----------|------------|----------|
| **Cloudflare** ✅ | USA | 1.1.1.1 | Fast, privacy-focused, family filtering |
| **Google** ✅ | USA | 8.8.8.8 | Reliable, DNS64 support |
| **Quad9** ✅ | Switzerland | 9.9.9.9 | Security-focused, blocks malware |
| **Control D** ❌ | USA/Canada | 76.76.2.0 | 6 customizable filtering profiles |
| **DNS4EU** ❌ | Europe | 86.54.11.1 | EU-funded, multiple filters |
| **NextDNS** ❌ | Global | 45.90.28.0 | Customizable, privacy-first |
| **CleanBrowsing** ❌ | USA | 185.228.168.9 | Family-safe, adult filter |
| **AdGuard DNS** ❌ | Cyprus | 94.140.14.14 | Ad-blocking, family protection |
| **Cisco Umbrella/OpenDNS** ❌ | USA | 208.67.222.222 | Enterprise-grade security |

✅ = Already in Microsoft's default list  
❌ = **NEW** - Added by this registry (not in Microsoft's list)

**Total:** 114 configurations from 12 providers

DNS0.eu and all related IP addresses have been removed because the service was discontinued on October 17th, 2025. For secure DNS-over-HTTPS, use alternatives like DNS4EU or NextDNS.io.
Mullvad DNS discontinued since November 2, 2026.

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

**All 114 configurations verified against official sources.** ✅

---

## 🎯 What This Does

Microsoft's Windows has supported DNS over HTTPS since 2020, but only includes **3 DNS providers** by default:
- Cloudflare (1.1.1.1)
- Google (8.8.8.8)
- Quad9 (9.9.9.9)

This registry adds **9 more privacy-focused DNS providers** with 114 total configurations, giving you more choices for encrypted DNS.

```
┌─────────────────────────────────────────────────────────────┐
│  📊 WHAT YOU GET                                            │
├─────────────────────────────────────────────────────────────┤
│  ✅ 114 DNS configurations (Microsoft has 3)                │
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

- [DNS-PROVIDERS-REFERENCE.md](DNS-PROVIDERS-REFERENCE.md) — Complete DNS provider details, IPv6 addresses, and official sources
- [WHY-THIS-MATTERS.md](WHY-THIS-MATTERS.md) — The full story behind this project + Microsoft collaboration invite

---

## 📊 Quick Stats

-- **114 configurations** (Microsoft has 3)
-- **12 providers** (Microsoft has 3)
- **100% verified** against official sources
- **Years of research** compiled into one registry file
- **Ready to use** right now

---

DNS0.eu has been discontinued on October 17th, 2025. 
For secure DNS-over-HTTPS, use alternatives like DNS4EU or NextDNS.io.
Mullvad DNS discontinued since November 2, 2026.

---


## 🚀 Quick Start

1. **Download the registry file:**
  - [Doh-Well-Known-Servers.reg](Doh-Well-Known-Servers.reg)
  Where is this located?
  `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\DohWellKnownServers`
  - [Global-InterfaceSpecificParameter.reg](Global-Interface-Specific-Parameters/Global-InterfaceSpecificParameter.reg) (for systemwide enforcement)
  Where is this located?
  `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\GlobalDohIP`

2. **Import the registry file:**
   - Right-click the file and select "Merge"
   - Click "Yes" to confirm
3. **Choose your DNS provider in Windows Settings:**
   - Windows 11: Settings → Network & Internet → Properties → DNS server assignment → Edit
   - Windows 10: Settings → Network → Change adapter options → Right-click connection → Properties → IPv4
4. **Verify DoH is working:**
   - Open PowerShell and run:
     ```powershell
     Get-DnsClientDohServerAddress
     ```
   - You should see DNS IPs with DoH template URLs


---

```text
┌──────────────────────────────────────────────────────────────────────────────┐
│  Do you want to choose your own DoH Auto Templating registry?                │
│                                                                              │
│  Look at this page and download:                                             │
│  HTML-based — select only the DNS providers you want.                        │
│  Your registry file is fully customized to your choices.                     │
│                                                                              │
│  👉 https://github.com/1LUC1D4710N/doh-registry-generator                     │
└──────────────────────────────────────────────────────────────────────────────┘
```
---

**Last Updated:** November 2026  
**Status:** ✅ Verified and ready for public use  
**License:** MIT License - Free to use with attribution

## ℹ️ What is Markdown?

This page (and most documentation here) uses **Markdown** (`.md`), a simple text format for easy-to-read, easy-to-write documentation. Markdown lets you create headings, tables, code blocks, and links with plain text. It’s widely supported and can be parsed or generated by scripts for automation.

Learn more: [Markdown Guide](https://www.markdownguide.org/)

*Built by a Greenlander who loves Windows and wants to help make it better.* 🇬🇱
