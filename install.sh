#!/bin/sh

cat .zshrc >> "$HOME/.zshrc"
cat .p10k.zsh > $HOME/.p10k.zsh

cp -a bin "$HOME/bin"
mkdir -p "$HOME/cli"

# space
git clone https://github.com/shnewto/space.git "$HOME/cli/space"

# rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# ripgrep
cargo install ripgrep

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh history subsearch
git clone https://github.com/zsh-users/zsh-history-substring-search "$HOME/cli/zsh-history-substring-search"

# sdkman
curl -s "https://get.sdkman.io" | bash

# elm
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
gunzip elm.gz
chmod +x elm
sudo mv elm /usr/local/bin/

# elm-land
npm install -g elm-land@latest
