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

### 1. Clone the Repository

```
bash
git clone https://github.com/adementorfromazkaban/smb_anon_share_enum.git
cd smb_anon_share_enum
chmod +x smb_anon_share_enum.sh
```

### 2. Install `smbclient`

**Debian/Ubuntu/Kali:**

```
sudo apt update
sudo apt install smbclient
```

**RedHat/CentOS/Fedora:**

```
sudo dnf install samba-client
```

**Arch Linux:**

```
sudo pacman -S smbclient
```

## 💻 Usage

```
./smb_anon_share_enum.sh -t <target> -w <wordlist.txt>
```

**Arguments:**
- `-t`: Target IP address or hostname
- `-w`: Path to wordlist file (one share name per line)

**Example:**
```
./smb_anon_share_enum.sh -t 192.168.1.100 -w shares.txt
```

## 📥 Sample Output

```
[*] Starting anonymous SMB share enumeration against: 192.168.1.100
[*] Using wordlist: shares.txt

Testing share: public
[+] Anonymous access allowed for: public
Testing share: secure
[-] Access denied for: secure
```
