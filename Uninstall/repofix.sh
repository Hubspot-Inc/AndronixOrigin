
#!/bin/bash

# Enable strict error handling
set -euo pipefail

folder=manjaro-fs
folder2=androjaro-fs

if [ -d "$folder" ]; then
    echo "nameserver 1.1.1.1" > /etc/resolv.conf
    if [ -f "$folder/etc/pacman.d/mirrorlist" ]; then
        rm -f "$folder/etc/pacman.d/mirrorlist"
    fi
    wget -q https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Uninstall/mirrorlist -O "$folder/etc/pacman.d/mirrorlist"
    sed -i '1s/^/pacman-key --init \&\& pacman-key --populate \&\& pacman -Syu --noconfirm\n/' "$folder/root/.bash_profile"
fi

if [ -d "$folder2" ]; then
    echo "nameserver 1.1.1.1" > /etc/resolv.conf
    if [ -f "$folder2/etc/pacman.d/mirrorlist" ]; then
        rm -f "$folder2/etc/pacman.d/mirrorlist"
    fi
    wget -q https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Uninstall/mirrorlist -O "$folder2/etc/pacman.d/mirrorlist"
    sed -i '1s/^/sudo pacman-key --init \&\& sudo pacman-key --populate \&\& sudo pacman -Syu --noconfirm\n/' "$folder2/root/.bash_profile"
fi
