pkg update
pkg install -y zsh
pkg install -y git
pkg i termux-services

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pkg install -y nodejs
pkg install -y clang
pkg install -y sqlite
pkg install -y neovim
pkg install -y tmux
pkg install -y fastfetch
npm i -g live-server
pkg install -y lsd

# ZSHRC PASTING

git clone https://github.com/rinogodson/termux-pack
mv ./termux-pack ./pack

rm ~/.zshrc
cp pack/.zshrc ~/

rm -rf ~/.config/nvim && cp -r ~/pack/nvim/ ./.config/
pkg install -y starship
echo 'eval "$(starship init zsh)"'>> .zshrc
pkg install -y curl ncurses-utils
curl -fsSL https://raw.githubusercontent.com/arnavgr/termux-nf/main/install.sh | bash
mkdir ~/.config/tmux
cp ~/pack/tmux.conf ~/.config/tmux/

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

pkg install -y termux-api

rm -rf ./pack


