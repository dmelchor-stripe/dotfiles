#!/usr/bin/env bash

INSTALL_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BACKUP_DIR="$HOME/.dotfiles-backup"

rm -rf $BACKUP_DIR
mkdir $BACKUP_DIR

# Dict relative_name -> destination
declare -A files
files["nvim"]="$HOME/.config"
files["kitty"]="$HOME/.config"
files[".zshrc"]="$HOME"
files[".tmux.conf"]="$HOME"
files[".skhdrc"]="$HOME"
files["yabai"]="$HOME/.config"
files["fish"]="$HOME/.config"
files["sketchybar"]="$HOME/.config"
files[".hammerspoon"]="$HOME"
files["starship.toml"]="$HOME/.config"

# Backup existing files
echo -e "\033[1m\033[92mBacking up existing files...\033[0m"

for file in "${!files[@]}"; do
    if [ -h "${files[$file]}/$file" ]; then
        echo "Removing symlink ${files[$file]}/$file"
        rm "${files[$file]}/$file"
    elif [ -e "${files[$file]}" ]; then
        echo "Backing up ${files[$file]}/$file to $BACKUP_DIR"
        mv "${files[$file]}/$file" "$BACKUP_DIR"
    fi
done

echo -e "\n\033[1m\033[92mCopying new files...\033[0m"

# Copy new files
for file in "${!files[@]}"; do
    echo "Copying $file to ${files[$file]}"
    # cp -fr "$INSTALL_DIR/$file" "${files[$file]}"
    ln -s "$INSTALL_DIR/$file" "${files[$file]}"
done

# Install all scripts and chmod +x them
cp -fr $INSTALL_DIR/scripts/* ~/.local/bin
chmod +x ~/.local/bin/*

echo -e "\n\033[1m\033[92mDone!\033[0m\n"
