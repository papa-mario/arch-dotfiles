#!/bin/bash
echo "=== Restoring User Configurations ==="

# 1. Symlink everything in .config
mkdir -p ~/.config
for item in ~/dotfiles/.config/* ~/dotfiles/.config/.*; do
    # Skip . and .. directories to avoid infinite loops
    basename=$(basename "$item")
    if [ "$basename" != "." ] && [ "$basename" != ".." ]; then
        ln -sfn "$item" ~/.config/"$basename"
        echo "Symlinked $basename to ~/.config/"
    fi
done

# 2. Symlink the scripts folder
echo -e "\n=== Restoring Scripts ==="
mkdir -p ~/scripts
for script in ~/dotfiles/scripts/*; do
    basename=$(basename "$script")
    ln -sfn "$script" ~/scripts/"$basename"
    echo "Symlinked $basename to ~/scripts/"
done

echo -e "\n=== Done! ==="
echo "Note: Files in the system/ directory (GRUB, mkinitcpio, themes) require root privileges and must be copied manually when setting up a new machine."

