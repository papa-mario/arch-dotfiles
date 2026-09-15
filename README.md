# arch-dotfiles

Personal Arch Linux configuration (Sway/Wayland).

## components

* **wm:** sway 
* **bar:** waybar (mullvad + bluetooth modules)
* **term:** foot + fish + starship
* **launcher:** wofi
* **boot:** grub (diana theme) + mkinitcpio (custom luks ascii hook)

## deployment

Clone the repository and install dependencies:
```bash
git clone [https://github.com/papa-mario/arch-dotfiles.git](https://github.com/papa-mario/arch-dotfiles.git) ~/dotfiles
cd ~/dotfiles/setup
chmod +x install_packages.sh
./install_packages.sh
