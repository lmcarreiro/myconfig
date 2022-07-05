# My personal config

## Drivers

```bash
ubuntu-drivers devices 

# Check and if correct, run:
sudo ubuntu-drivers autoinstall 
```

## Update/Upgrade 

```bash
sudo apt-get update && sudo apt-get upgrade 
```

## Git

```bash
cd ~
sudo apt install git
git clone git@github.com:lmcarreiro/myconfig.git
ln -s myconfig/ubuntu/.gitconfig
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
rm -r ./.config/fish/functions/
ln -s ~/myconfig/ubuntu/fish/config.fish ./.config/fish/
ln -s ~/myconfig/ubuntu/fish/functions/ ./.config/fish/

# Oh-My-Fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

## Other setup

```bash
# Avoid "System limit for number of file watchers reached" errors
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

```

## VSCode

```bash
# Remove conflictng gnome shortcuts
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>Page_Up', '<Super><Shift><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>Page_Down', '<Super><Shift><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>Page_Up', '<Super><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Page_Down', '<Super><Alt>Right']"

# Link vscode config files
cd ~
ln -s ~/myconfig/ubuntu/vscode/settings.json ./.config/Code/User/
ln -s ~/myconfig/ubuntu/vscode/keybindings.json ./.config/Code/User/
```

## Apps

- Install basic apps:
  - From Ubuntu Software 
    - 1password
    - Brave
      - Enable brave sync
      - Create profiles (personal + work)
    - VSCode
      - Git Graph
      - GitLens
      - Prettier
      - ESLint
      - Smart Column Indenter
      - Docker
      - Better TOML
      - EJS Language support
    - Slack
  - From other repos
    - CopyQ
      - `sudo add-apt-repository ppa:hluk/copyq`
      - `sudo apt update`
      - `sudo apt install copyq`
      - Open setting and set auto-start
      - TODO: how to save copy/paste history to restore in another system?
    - Docker
      - https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
      - https://docs.docker.com/engine/install/linux-postinstall/
      - `sudo curl -SL https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose`
      - `sudo chmod +x /usr/local/bin/docker-compose`
    - nvm
      - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash`
      - Check instruction to copy commands to `.bashrc`
      - Fish integration:
        - `omf install https://github.com/fabioantunes/fish-nvm`
        - `omf install https://github.com/edc/bass`
    - ngrok
      - `curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok`
    - NATS cli: download deb from https://github.com/nats-io/natscli/releases
      - Create context: `nats context save --server="nats.example.com" --creds=/absolute/path/to/creds.txt name`
    - HubStaff
    - B2 cli
      - `sudo curl -L https://github.com/Backblaze/B2_Command_Line_Tool/releases/latest/download/b2-linux --output /usr/local/bin/b2`
      - `sudo chmod +x /usr/local/bin/b2`
    - FlameShot
      - `sudo apt install flameshot`
      - TODO: set shortcuts
      - TODO: What about videos?

