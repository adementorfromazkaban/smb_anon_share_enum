
# smb_anon_share_enum

A lightweight Bash script to brute-force SMB share names from a wordlist and test each for **anonymous (guest)** access using `smbclient`.

This tool is useful during internal network pentests, CTFs, and enumeration phases where SMB services may expose shares without credentials.

---

## 📌 Features

- Brute-forces share names from a custom wordlist
- Tests for **anonymous/guest access**
- Color-coded, clean output
- Simple and dependency-free (just requires `smbclient`)

---

## ⚙️ Installation

### 1. Install `smbclient` (if not already installed)

**Debian/Ubuntu/Kali:**

```bash
sudo apt update
sudo apt install smbclient
```

**RedHat/CentOS/Fedora:**

```bash
sudo dnf install samba-client
```

**Arch Linux:**

```bash
sudo pacman -S smbclient
```

### 2. Clone the Repository

```bash
git clone https://github.com/adementorfromazkaban/smb_anon_share_enum.git
cd smb_anon_share_enum
chmod +x smb_anon_share_enum.sh
```

---

## 💻 Usage

```bash
./smb_anon_share_enum.sh -t <target> -w <wordlist.txt>
```

**Arguments:**
- `-t`: Target IP address or hostname
- `-w`: Path to wordlist file (one share name per line)

**Example:**
```bash
./smb_anon_share_enum.sh -t 192.168.1.100 -w shares.txt
```

---

## 📥 Sample Output

```bash
[*] Starting anonymous SMB share enumeration against: 192.168.1.100
[*] Using wordlist: shares.txt

Testing share: public
[+] Anonymous access allowed for: public
Testing share: secure
[-] Access denied for: secure
```

---

## 🧪 Sample CTF Usage: Assessment Methodologies - Enumeration CTF 1

```bash
nano smb_anon_share_enum.sh
# Internet is not available on the VM so copy and paste the content from:
# https://github.com/adementorfromazkaban/smb_anon_share_enum/blob/main/smb_anon_share_enum.sh
chmod +x smb_anon_share_enum.sh
./smb_anon_share_enum.sh -t target.ine.local -w /root/Desktop/wordlists/shares.txt
```
