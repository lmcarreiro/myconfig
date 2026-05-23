# My personal config


## System settings
- Battery > Charging > i: Charge Limit -> 80%
- General -> Language & Region:
  - English (prymary) + Portuguese
  - Date format -> yyyy-mm-dd
- Displays:
  - More Space
- Keyboard -> Text Input -> Input Sources -> Edit...:
  - Brazilian + US
  - Use smart quotes and dashes -> Off
  - ...
- Trackpad:
  - Tap to click -> On
  - ...


## Base apps

- Brave: Download from website, set default, add sync chains
- 1Password: Download from website, login
- Brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## SSH

- New ssh key: `ssh-keygen -t ed25519 -C "WORK EMAIL"`
- https://github.com/settings/keys

## Git

Installed with Brew

```bash
cd ~
git clone git@github.com:lmcarreiro/myconfig.git
ln -s myconfig/mac/.gitconfig

cd myconfig
git config --local user.email "git.commits@leo.br.com"
```

## VSCode

Download from website, sync with github

```bash
cd ~
rm ~/Library/Application\ Support/Code/User/settings.json && ln -s ~/myconfig/mac/vscode/settings.json ~/Library/Application\ Support/Code/User/
rm ~/Library/Application\ Support/Code/User/keybindings.json && ln -s ~/myconfig/mac/vscode/keybindings.json ~/Library/Application\ Support/Code/User/
```
