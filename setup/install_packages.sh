#!/bin/bash
set -e

echo "=== Installing Native Packages ==="
sudo pacman -Syu --needed - < pkglist-native.txt

if command -v paru &> /dev/null; then
    AUR_HELPER="paru"
elif command -v yay &> /dev/null; then
    AUR_HELPER="yay"
else
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin && makepkg -si --noconfirm
    cd -
    AUR_HELPER="yay"
fi

echo "=== Installing AUR Packages ==="
$AUR_HELPER -S --needed - < pkglist-aur.txt

