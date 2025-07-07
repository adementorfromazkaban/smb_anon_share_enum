#!/bin/bash
#
# smb_anon_share_enum.sh
# -----------------------
# Description:
#   Brute-force SMB share names from a wordlist and test each one for anonymous (guest) access using smbclient.
#
# Usage:
#   ./smb_anon_share_enum.sh -t <target> -w <wordlist.txt>
#
# Example:
#   ./smb_anon_share_enum.sh -t 192.168.1.100 -w shares.txt
#
# Requirements:
#   - smbclient must be installed
#
# Author: Awais Akbar
# License: MIT
#

# Define colors
GREEN='\033[1;32m'  # Bold Green
NC='\033[0m'        # No Color (reset)

# Function to show usage
show_usage() {
    echo "Usage: $0 -t <target> -w <wordlist>"
    echo
    echo "  -t    Target IP or hostname"
    echo "  -w    Path to wordlist of possible SMB share names"
    exit 1
}

# Parse arguments
while getopts "t:w:" opt; do
  case ${opt} in
    t ) TARGET=$OPTARG ;;
    w ) WORDLIST=$OPTARG ;;
    * ) show_usage ;;
  esac
done

# Validate arguments
if [ -z "$TARGET" ]; then
    echo "Error: Target (-t) is required."
    show_usage
fi

if [ -z "$WORDLIST" ]; then
    echo "Error: Wordlist (-w) is required."
    show_usage
fi

if [ ! -f "$WORDLIST" ]; then
    echo "Error: Wordlist file not found: $WORDLIST"
    exit 1
fi

# Enumerate shares
echo "[*] Starting anonymous SMB share enumeration against: $TARGET"
echo "[*] Using wordlist: $WORDLIST"
echo

while read -r SHARE || [ -n "$SHARE" ]; do
    echo "Testing share: $SHARE"
    smbclient "//$TARGET/$SHARE" -N -c "ls" &>/dev/null

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[+] Anonymous access allowed for: $SHARE${NC}"
    else
        echo "[-] Access denied for: $SHARE"
    fi
done < "$WORDLIST"
