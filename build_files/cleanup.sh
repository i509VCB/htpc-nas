#!/bin/bash

set -ouex pipefail

# Disable RPM Fusion repos
for i in /etc/yum.repos.d/rpmfusion-*.repo; do
    if [[ -f "$i" ]]; then
        sed -i 's@enabled=1@enabled=0@g' "$i"
    fi
done

# To silience bootc lints mark all /var/lib entries as tempfiles
TARGET=/etc/tmpfiles.d/custom-var-lib.conf
echo "# Auto-generated tmpfiles.d for /var/lib" > "$TARGET"

# Recursively handle all directories
find /var/lib -type d | while read -r dir; do
    echo "d $dir 0755 root root -" >> "$TARGET"
done

find /var/spool -type d | while read -r dir; do
    echo "d $dir 0755 root root -" >> "$TARGET"
done
