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
```
**2. Clone and Install Packages**
Clone your repository and execute the package installation script directly:
```bash
git clone https://github.com/papa-mario/arch-dotfiles.git ~/dotfiles
cd ~/dotfiles/setup
chmod +x install_packages.sh
./install_packages.sh
```
**3. Restore Configurations**
Symlink your user configurations into place (~/.config/ and ~/scripts/):
```bash
cd ~/dotfiles/setup
chmod +x restore.sh
./restore.sh
```
**4. Deploy System and Boot Files (Requires Root)**
Copy the bootloader, theme, and initramfs hooks into their respective system directories:
```bash
# GRUB configuration and theme
sudo cp ~/dotfiles/system/grub /etc/default/grub
sudo mkdir -p /boot/grub/themes/diana
sudo cp -r ~/dotfiles/system/grub_theme/* /boot/grub/themes/diana/
# initramfs custom ascii banner hooks
sudo cp ~/dotfiles/system/mkinitcpio.conf /etc/mkinitcpio.conf
sudo cp ~/dotfiles/system/initcpio/install/mybanner /etc/initcpio/install/
sudo cp ~/dotfiles/system/initcpio/hooks/mybanner /etc/initcpio/hooks/
```
**5. Finalize Boot Configuration**
Update your LUKS UUID inside /etc/default/grub, then generate the new initramfs and grub
configuration:
```bash
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
