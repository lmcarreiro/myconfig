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
echo "starship init fish | source" >> ~/.config/fish/config.fish
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
    - Slack
  - From other repos
    - Docker
      - https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
      - https://docs.docker.com/engine/install/linux-postinstall/
      - `sudo curl -SL https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose`
      - `sudo chmod +x /usr/local/bin/docker-compose`
    - nvm
      - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash`
      - Check instruction to copy commands to `.bashrc`
    - ngrok
      - `curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok`
    - NATS cli: download deb from https://github.com/nats-io/natscli/releases
      - Create context: `nats context save --server="nats.example.com" --creds=./path/to/creds.txt name`
    - HubStaff
