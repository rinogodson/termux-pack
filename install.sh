#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

cd

export RUNZSH=no
export CHSH=no

pkg update -y
pkg upgrade -y

pkg install -y \
  zsh git termux-services nodejs clang sqlite neovim tmux fastfetch lsd \
  starship curl ncurses-utils termux-api fzf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

npm i -g live-server

# ZSHRC PASTING
rm -rf ~/pack
git clone https://github.com/rinogodson/termux-pack
mv ~/termux-pack ~/pack

rm -f ~/.zshrc
cp ~/pack/zsh/.zshrc ~/

mkdir -p ~/.config/tmux
cp ~/pack/tmux.conf ~/.config/tmux/


mkdir -p ~/.config
rm -rf ~/.config/nvim
cp -r ~/pack/nvim/ ~/.config/


pkg install -y starship
pkg install -y curl ncurses-utils
curl -fsSL https://raw.githubusercontent.com/arnavgr/termux-nf/main/install.sh | bash

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting


echo 'eval "$(starship init zsh)"'>> .zshrc

grep -q 'exec zsh -l' ~/.bashrc 2>/dev/null || printf '\n[ -z "${ZSH_VERSION-}" ] && command -v zsh >/dev/null && exec zsh -l\n' >> ~/.bashrc
grep -q 'exec zsh -l' ~/.profile 2>/dev/null || printf '\n[ -z "${ZSH_VERSION-}" ] && command -v zsh >/dev/null && exec zsh -l\n' >> ~/.profile

rm -rf ~/.termux
cp -r ~/pack/.termux ~/

read -p "Do you want to set a font? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    getnf
else
    echo "You can run 'getnf' to set the font anytime."
    echo "Go to https://www.nerdfonts.com/font-downloads to get a preview."
fi

command -v zsh >/dev/null 2>&1 && exec zsh -l


