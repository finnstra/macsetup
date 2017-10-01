#!/usr/bin/env bash

# Set up logging environment
LOG_FILE='/Users/'$(logname)'/Desktop/install-log.log'

exec &> >(tee -a "$LOG_FILE")
echo "Logging to" $LOG_FILE

# TODO Set computer name and ensure it is set properly. 

# Mac configuration
echo "Setting up computer configuration"
systemsetup -setcomputersleep 15 # Computer sleeps after 15 minutes
systemsetup -setdisplaysleep 15 #Computer display sleeps after 15 minutes
# TODO: Figure out how to set different times for battery vs. power adapter

defaults write com.apple.screensaver askForPassword 1 # Force password entry after sleep
sudo spctl --master-disable #Disables 'gatekeeper.' You don't have to do this if you don't rely on it.

SCREENSHOT_DIRECTORY="/Users/$(logname)/Desktop/Screenshots"
if [ ! -d "$SCREENSHOT_DIRECTORY" ]; then
  echo "Setting up screenshot folder"
  cd ~/Desktop
  sudo -u mkdir $SCREENSHOT_DIRECTORY #Doing this because I've ran into permissions issues before
fi

echo "Setting up screenshot configuration..."
defaults write com.apple.screencapture location ~/Desktop/Screenshots


# Check if FileValut is on
if [ "$(fdesetup status)" == "FileVault is On." ]; then
  echo "Disk encryption is enabled. 🔥"
fi

if [ "$(fdesetup status)" == "FileVault is Off." ]; then
  echo "Disk encryption not enabled. Enabling now..."
  fdesetup enable
fi

# Setup Brew
sudo -u $SUDO_USER /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup Software
echo "Installing software from cask.. (may take long if the internet is slow)"
cask_apps="visual-studio-code skitch discord dropbox telegram 1password hyper sonos stremio transmission-nightly vlc-nightly google-chrome"

sudo -u $SUDO_USER brew install mas # We will need this laster for installing MAS
sudo -u $SUDO_USER brew tap caskroom/cask
sudo -u $SUDO_USER brew tap caskroom/versions
sudo -u $SUDO_USER brew cask install Caskroom/cask/$cask_apps
sudo -u $SUDO_USER brew install wget

# Install Mac Store Apps
open "/Applications/App Store.app";
read -p "Ensure you are signed in to the App Store with your Apple ID, then hit enter. ";
echo "Installing Mac Store Apps..."
mac_apps_ids="425424353 1088330492 409789998 668208984 634148309"
sudo -u $SUDO_USER mas install $mac_apps_ids

# Post-Install Cleanup
echo "Resetting UI for screenshot default settings to take effect"
killall SystemUIServer

# Done :)
echo "all done!:) 🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏"
