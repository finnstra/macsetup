#!/usr/bin/env bash

#TODO Make sure computer doesn't sleep.

#Set up logging environment
LOG_FILE='/Users/'$(logname)'/Desktop/install-log.log'

exec &> >(tee -a "$LOG_FILE")
echo "Logging to" $LOG_FILE

#Set Hostname
scutil --set ComputerName "CastleByers" #I like Stranger Things don't judge
echo "Host name is set to $(hostname)" #TODO Make sure this actually sticks after restart

#Mac configuration
echo "Setting up computer configuration"
systemsetup -setcomputersleep 15 #Computer sleeps after 15 minutes
defaults write com.apple.screensaver askForPassword 1 #Force password entry after sleep
sudo spctl --master-disable #Disables 'gatekeeper'

SCREENSHOT_DIRECTORY="/Users/$(logname)/Desktop/Screenshots"
if [ ! -d "$SCREENSHOT_DIRECTORY" ]; then
  echo "Setting up screenshot folder"
  cd ~/Desktop && mkdir $SCREENSHOT_DIRECTORY
fi

echo "Setting up screenshot configuration..."
defaults write com.apple.screencapture location ~/Desktop/Screenshots

#Check if FileValut is on
if [ "$(fdesetup status)" == "FileVault is On." ]; then
  echo "Disk encryption is lit. 🔥"
fi

if [ "$(fdesetup status)" == "FileVault is Off." ]; then
  echo "Disk encryption not enabled. Enabling now..."
  fdesetup enable
fi

#Setup Brew
sudo -u $SUDO_USER /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Setup Software
echo "Installing software from cask.. (may take long if the internet is slow)"
cask_apps="atom skitch discord dropbox spotify telegram 1password iterm2 sonos stremio transmission-nightly vlc-nightly google-chrome vmware-fusion"

sudo -u $SUDO_USER brew install mas #We will need this laster for installing MAS
sudo -u $SUDO_USER brew tap caskroom/cask
sudo -u $SUDO_USER brew tap caskroom/versions
sudo -u $SUDO_USER brew cask install Caskroom/cask/$cask_apps
sudo -u $SUDO_USER brew install wget #Needed for Google Drive links

#Install Mac Store Apps
if mas account; then
    echo "Installing Mac Store Apps..."
    mac_apps_ids="425424353 1088330492 409789998 668208984 634148309"
    sudo -u $SUDO_USER mas install $mac_apps_ids
else
    echo "Not signed in to MAS. You'll need to install them manually for now :("
fi

#TODO Download and move non-casked apps: Flux

#TODO Mac Software Update Check and install updates

#Just some cleanup
echo "Resetting UI for Screenshot default folder to take effect"
killall SystemUIServer

#WE OUT
echo "all done!:) 🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏"
