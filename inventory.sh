#!/usr/bin/env bash

# Inventory installed Homebrew applications

echo "Pulling installed Homebrew packages and apps."
brew cask list > configs/cask_packages
brew list > configs/brew_packages
if [ $? -eq 0 ]
then
  echo "Success."
else
  echo "Failed to generate package information. Please verify your Homebrew install and try again."
fi