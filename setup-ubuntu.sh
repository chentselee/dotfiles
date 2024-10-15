#/bin/bash
set -e

sudo apt update
sudo apt install -y curl git zsh alacritty cmus

git clone git@github.com:chentselee/dotfiles.git

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix run home-manager -- switch --flake ~/dotfiles/home-manager#cz

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# stow
stow_apps=('alacritty' 'nvim' 'starship' 'tmux' 'zsh')
for app in ${stow_apps[@]}; do
  stow $app
done

# font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip
mkdir -p ~/.local/share/fonts
unzip SourceCodePro.zip -d ~/.local/share/fonts/SourceCodePro
fc-cache -fv ~/.local/share/fonts

# development

# nvm
PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

#pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
