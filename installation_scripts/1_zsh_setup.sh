#!/usr/bin/env bash

. ./helper_functions.sh
check_distro
check_programs_path

#Common
install zsh

# Cargo was probably installed in the same session, source it to activate it
source $HOME/.cargo/env

# Install pure prompt theme, it is expected on a specific path by .zshrc
mkdir -p ~/.zsh/pure
mkdir -p ~/.zsh/antigen
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
curl -L git.io/antigen >~/.zsh/antigen/antigen.zsh

# Exa tool, replacement for ls
wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
unzip exa-linux-x86_64-v0.10.1.zip -d exa
rm exa-linux-x86_64-v0.10.1.zip
sudo mv exa/bin/exa /usr/local/bin
sudo mv exa/man/exa.1 /usr/share/man/man1
sudo mkdir -p /usr/local/share/zsh/site-functions
sudo mv exa/completions/exa.zsh /usr/local/share/zsh/site-functions
rm -fr exa

# Update new fonts
fc-cache -fv

fi

# Bye bye bash, hello zsh
chsh -s $(which zsh)
figlet "Done\!" | lolcat
figlet "Logout and log back in." | lolcat
