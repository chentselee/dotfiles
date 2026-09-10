Setup instructions for my personal dotfiles.

1. Update the system and install necessary dependencies. For example on Debian based distros:

```bash
sudo apt update
sudo apt install -y curl git zsh ca-certificates alacritty
```

2. Clone the repo

```bash
git clone git@github.com:chentselee/dotfiles.git
```

3. Install on-my-zsh and plugins

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

4. Install neovim

```bash
curl -LO https://github.com/neovim/neovim/releases/download/v0.12.2/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
rm nvim-linux-x86_64.tar.gz
```

5. Install tree-sitter-cli (required for tree-sitter)

```bash
curl -LO https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.11/tree-sitter-cli-linux-x64.zip
unzip tree-sitter-cli-linux-x64.zip
sudo rm -rf /opt/tree-sitter
sudo mkdir -p /opt/tree-sitter/bin
sudo mv tree-sitter /opt/tree-sitter/bin
```

6. Install nix and activate home manager

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix run home-manager -- switch --flake ~/dotfiles/home-manager#cz
```

7. Install tpm (tmux plugin manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

8. Stow everything

```bash
stow_apps=('alacritty' 'nvim' 'starship' 'tmux' 'zsh' 'yazi')
for app in ${stow_apps[@]}; do
  stow $app
done
```

9. Install fonts

```bash
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip
mkdir -p ~/.local/share/fonts
unzip SourceCodePro.zip -d ~/.local/share/fonts/SourceCodePro
fc-cache -fv ~/.local/share/fonts/SourceCodePro
rm SourceCodePro.zip
```

10. Install docker (https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

11. Install development tools (node, go...etc) through `mise`
