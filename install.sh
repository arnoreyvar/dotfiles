#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install vim-plug if nvim exists
if test ! $(which nvim); then
  /usr/bin/ruby -e "$(
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  )"
fi

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink vimrc file to the home directory
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

ln -s $HOME/.dotfiles/_config/karabiner/karabiner.json $HOME/.config/karabiner/karabiner.json

sudo cp -R keyboard/en_arnor.bundle /Library/Keyboard\ Layouts/

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
