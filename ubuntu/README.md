# My personal config

## Git

```bash
cd ~
git clone git@github.com:lmcarreiro/myconfig.git
ln -s myconfig/.gitconfig
```

## Fish

```bash
# Install fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

# Making default
chsh -s /usr/bin/fish

# Install starship
curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" >> ~/.config/fish/config.fish
```