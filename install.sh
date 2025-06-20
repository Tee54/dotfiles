#!/usr/bin/env bash

echo -e "Installing Dotfiles"

cp -r .config/ $HOME/

#Setting up zsh
cp .zshrc /$HOME
source $HOME/.zshrc
