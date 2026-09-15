# arch-dotfiles

Personal Arch Linux configuration (Sway/Wayland).

## components

* **wm:** sway 
* **bar:** waybar (mullvad + bluetooth modules)
* **term:** foot + fish + starship
* **launcher:** wofi
* **boot:** grub (ascii theme) + mkinitcpio (custom luks ascii hook)

## deployment

**1. Prerequisites**
On a fresh Arch Linux install, you must install Git, base-devel, and an AUR helper (`yay`) before proceeding:
```bash
sudo pacman -Syu git base-devel
git clone [https://aur.archlinux.org/yay.git](https://aur.archlinux.org/yay.git)
cd yay
makepkg -si
cd ~
