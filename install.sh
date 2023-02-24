prompt() {
  echo "\033[1m\033[93m$1 [Y/n] \033[0m\c"
  read yn
  if [ "$yn" = "" ]; then
    yn='Y'
  fi
  case $yn in
    [Yy]* ) result=true; break;;
    [Nn]* ) result=false; break;;
    * ) result=true; break;;
  esac
}

INSTALL_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# nvim
prompt "Do you want to install my nvim config?"
if [ "$result" = true ]; then
  ! [ -x "$(command -v nvim)" ] && brew install nvim
  [ -d ~/.config/nvim.old ] && rm -rf ~/.config/nvim.old
  [ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.old/
  cp -r $INSTALL_DIR/nvim ~/.config/nvim
  mkdir -p ~/.config/nvim/undo
  echo "\033[1m\033[92mDone.\033[0m\n"
fi

# kitty
prompt "Do you want to install my kitty config?"
if [ "$result" = true ]; then
  ! [ -x "$(command -v kitty)" ] && brew install kitty
  [ -d ~/.config/kitty.old ] && rm -rf ~/.config/kitty.old
  [ -d ~/.config/kitty ] && mv ~/.config/kitty ~/.config/kitty.old/
  cp -r $INSTALL_DIR/kitty ~/.config/kitty
  echo "\033[1m\033[92mDone.\033[0m\n"
fi

# zshrc
prompt "Do you want to install my zsh config?"
if [ "$result" = true ]; then
  ! [ -x "$(command -v p10k)" ] && rm -rf ~/powerlevel10k && git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

  [ -f ~/.zshrc.old ] && rm ~/.zshrc.old
  [ -f ~/.p10k.zsh.old ] && rm ~/.p10k.zsh.old

  [ -f ~/.p10k.zsh ] && mv ~/.p10k.zsh ~/.p10k.zsh.old 
  [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.old

  cp -r $INSTALL_DIR/.p10k.zsh ~/.p10k.zsh
  cp -r $INSTALL_DIR/.zshrc ~/.zshrc
  echo "\033[1m\033[92mDone.\033[0m\n"
fi

# tmux
prompt "Do you want to install my tmux config?"
if [ "$result" = true ]; then
  ! [ -x "$(command -v tmux)" ] && brew install tmux
  [ -f ~/.tmux.conf.old ] && rm ~/.tmux.conf.old
  [ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old
  cp -r $INSTALL_DIR/.tmux.conf ~/.tmux.conf
  echo "\033[1m\033[92mDone.\033[0m\n"
fi

# window manager
prompt "Do you want to install my window manager config?"
if [ "$result" = true ]; then
  ! [ -x "$(command -v yabai)" ] && brew install koekeishiya/formulae/yabai
  ! [ -x "$(command -v skhd)" ] && brew install koekeishiya/formulae/skhd

  [ -f ~/.yabairc.old ] && rm ~/.yabairc.old
  [ -f ~/.skhdrc.old ] && rm ~/.skhdrc.old

  [ -f ~/.yabairc ] && mv ~/.yabairc ~/.yabairc.old
  [ -f ~/.skhdrc ] && mv ~/.skhdrc ~/.skhdrc.old

  cp -r $INSTALL_DIR/.yabairc ~/.yabairc
  cp -r $INSTALL_DIR/.skhdrc ~/.skhdrc
  echo "\033[1m\033[92mDone.\033[0m\n"
fi
