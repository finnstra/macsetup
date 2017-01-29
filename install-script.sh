#!/usr/bin/env bash

#Set up log environment
LOG_FILE='/Users/brad/Desktop/install-log.log'

exec &> >(tee -a "$LOG_FILE")
echo "Logging to" $LOG_FILE

#PREREQ CHECK - Homebrew installed
if [ "$(which brew)" != "/usr/local/bin/brew" ]; then
  echo "FAILED PREREQ CHECK - Homebrew must be installed before this script can run. This may be fixed later. Exiting...."
  exit 1
fi

#Install Xcode Tools
echo "Installing Xcode Tools"
xcode-select --install

#Homebrew must be installed prior to installation because we do it automatically
#TODO Make sure computer doesn't sleep.

#Set Hostname
hostname CastleByers
echo "Host name is set to $(hostname)" #TODO Make sure this actually sticks after restart

#Mac configuration
systemsetup -setcomputersleep 15 #Computer sleeps after 15 minutes
defaults write com.apple.screensaver askForPassword 1 #Force password entry after sleep

#Check if FileValut is on
if [ "$(fdesetup status)" == "FileVault is On." ]; then
  echo "Disk encryption is lit. 🔥"
fi

if [ "$(fdesetup status)" == "FileVault is Off." ]; then
  echo "Filevault not enabled. Enabling now"
  fdesetup enable
fi

#Change Screenshot Location to Screenshots Folder on Desktop
$SCREENSHOT_DIRECTORY="/Users/brad/Desktop/Screenshots"
if [ -d "$SCREENSHOT_DIRECTORY" ]; then
  echo "Setting up screenshot folder"
  cd ~/Desktop && mkdir Screenshots
fi

echo "Setting up screenshot configuration..."
defaults write com.apple.screencapture location ~/Desktop/Screenshots

#Setup Software
echo "Installing cask software ionstall.. (may take long if the internet is slow)"
cask_apps="atom discord dropbox spotify telegram 1password iterm2 sonos stremio transmission-nightly vlc-nightly google-chrome vmware-fusion"

su brad -c "brew install mas" #We will need this laster for installing MAS
su brad -c "brew tap caskroom/cask"
su brad -c "brew tap caskroom/versions"
su brad -c "brew cask install Caskroom/cask/$cask_apps"

#Install Mac Store Apps

if mas account; then
    echo "Installing Mac Store Apps..."
    mac_apps_ids="425424353 1088330492 409789998"
    su brad -c "mas install $mac_apps_ids"
else
    echo "Not signed in to MAS. You'll need to install them manually for now :("
fi

#TODO Download and move non-casked apps: Flux

#Just some cleanup
echo "Resetting UI for Screenshot default folder to take effect"
killall SystemUIServer

echo "all done!:) 🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏 BLESS UP!"
