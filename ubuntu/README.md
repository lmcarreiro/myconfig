# My personal config

## Drivers

```bash
# Check GPU model
lspci | grep -e VGA

# List availableas drivers
ubuntu-drivers devices

# Check and if correct, run (replace the driver with the recommented from the previous output):
sudo ubuntu-drivers install nvidia-driver-525-open
```

## Update/Upgrade 

```bash
sudo apt-get update && sudo apt-get upgrade 
```

## FiraCode font

```bash
sudo apt install fonts-firacode
```

On gnome-terminal, Settings -> Profiles -> Default -> Font -> Fira Code -> 10

## Git

```bash
cd ~
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update && sudo apt-get install git
git clone git@github.com:lmcarreiro/myconfig.git
ln -s myconfig/ubuntu/.gitconfig
```

## Fish

```bash
# Install fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update && sudo apt install fish

# Making default
chsh -s /usr/bin/fish

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Oh-My-Fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Link config
rm ./.config/fish/config.fish
rm -r ./.config/fish/functions/
ln -s ~/myconfig/ubuntu/fish/config.fish ./.config/fish/
ln -s ~/myconfig/ubuntu/fish/functions/ ./.config/fish/
```

## Other setup

```bash
# Avoid "System limit for number of file watchers reached" errors
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

```

- Create .ssh/ directory

### Settings

- Switch theme to dark + blue

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
rm ./.config/Code/User/settings.json && ln -s ~/myconfig/ubuntu/vscode/settings.json ./.config/Code/User/
rm ./.config/Code/User/keybindings.json && ln -s ~/myconfig/ubuntu/vscode/keybindings.json ./.config/Code/User/
```

## Apps

- Install basic apps:
  - Dependencies
    - `sudo apt install jq ca-certificates curl gnupg lsb-release apt-transport-https vim`
    - `sudo apt install fuse libfuse2` # for nosql booster
    - `sudo apt install wireguard` # for development / kubectl
    - `sudo snap install kubectl --classic`
  - Main apps 
    - 1Password: https://1password.com/downloads/linux/
      - `curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg`
      - `echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list`
      - `sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/`
      - `curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol`
      - `sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22`
      - `curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg`
      - `sudo apt update && sudo apt install 1password`
    - Brave
      - Install steps: https://brave.com/linux/
        - `sudo apt install apt-transport-https curl`
        - `sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg`
        - `echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list`
        - `sudo apt update && sudo apt install brave-browser`
      - Enable brave sync
      - Create profiles (personal + work)
    - VSCode
      - Install Steps
        - Download deb file
        - `sudo apt install <deb file>`
      - Extensions:
        - GitHub Pull Requests and Issues
        - Git Graph
        - GitLens
        - Prettier
        - ESLint
        - Smart Column Indenter
        - Docker
        - Better TOML
        - EJS Language support
        - Partial Diff
    - Slack
      - Download .deb and run `sudo apt install <deb file>`
    - CopyQ
      - `sudo add-apt-repository ppa:hluk/copyq`
      - `sudo apt update && sudo apt install copyq`
      - Open setting and set auto-start and shortcuts
        - Ctrl+Super+V -> Show main window under mouse cursor
        - Ctrl+Super+Shift+V -> Paste and copy next
      - TODO: how to save copy/paste history to restore in another system?
    - Docker
      - https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
      - https://docs.docker.com/engine/install/linux-postinstall/
      - Install
        - `sudo apt-get update && sudo apt-get install ca-certificates curl gnupg lsb-release`
        - `sudo mkdir -p /etc/apt/keyrings`
        - `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
        - `echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
        - `sudo apt-get update`
        - `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin`
      - Post-install:
        - `sudo groupadd docker`
        - `sudo usermod -aG docker $USER`
      - docker-compose
        - `sudo curl -SL https://github.com/docker/compose/releases/download/v2.8.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose`
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
    - ExpanDrive
      - Download .deb: https://www.expandrive.com/download-expandrive/
      - `sudo apt install ./ExpanDrive_2022.7.1_amd64.deb`
    - FlameShot
      - `sudo apt install flameshot`
      - Setup prt scr shortcut to call `flameshot gui`
      - If doesn't work, disable wayland
        - `echo $XDG_SESSION_TYPE`
        - `sudo vim /etc/gdm3/custom.conf`
        - Uncomment `WaylandEnable=false`
        - Restart
        - `echo $XDG_SESSION_TYPE`
      - TODO: What about videos?
    - NoSqlBooster
      - TODO: add command to install it to `/home/leonardo/app/nosqlbooster4mongo-7.1.2.AppImage`
      - `sudo apt install fuse libfuse2`
      - `ln -s ~/myconfig/ubuntu/dotLSApps/NoSqlBooster.desktop ~/.local/share/applications/`
    - GCloud cli: https://cloud.google.com/sdk/docs/install#deb
      - `echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list`
      - `curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg`
      - `sudo apt-get update && sudo apt-get install google-cloud-cli`
      - `gcloud init`
      - `gcloud auth configure-docker`
      - `sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin`
      - `gcloud container clusters get-credentials dev --region us-central1 --project PROJECT-NAME`
    - Grafana Loki LogCLI
      - Go to https://github.com/grafana/loki/releases
        - `curl -O -L "https://github.com/grafana/loki/releases/download/v2.7.3/logcli-linux-amd64.zip"`
        - `unzip "logcli-linux-amd64.zip"`
        - `sudo mv ./logcli-linux-amd64 /usr/local/bin/logcli`
        - `sudo chmod a+x /usr/local/bin/logcli`
      - Before running, load env vars from zc/localfiles/creds/grafana-loki.sh
    - MySql Workbench
      - `wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb`
      - `sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb`
      - focal fossa
      - MySQL Server & Cluster
      - mysql-8.0
      - sudo apt update && sudo apt install -y mysql-workbench-community



## Useful commands
- restart audio: `pulseaudio -k && sudo alsa force-reload`


# Listing packages by command name
apt install apt-file
apt-file update
apt-file search --regexp '/top$'
apt-file search --regexp '/ps$'

# single line toop:

while [ true ]; do foo; sleep 1; done


# To test
https://github.com/boltgolt/howdy
https://github.com/devinaconley/pam-facial-auth
