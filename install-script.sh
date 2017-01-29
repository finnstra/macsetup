#!/usr/bin/env bash

$SCREENSHOT_DIRECTORY = "/Users/brad/Desktop/Screenshots"
#Homebrew must be installed prior to installation because we do it automatically
#TODO Make sure computer doesn't sleep.

if [ "$(which brew)" != "/usr/local/bin/brew" ]; then
  echo "Homebrew must be installed before this script can run. This may be fixed later. Exiting...."
  exit 1
fi

#Set Hostname
hostname CastleByers
echo "Host name is set to $(hostname)" #TODO Make sure this actually sticks after restart

#systemsetup -setcomputersleep 15 #BROKEN
#defaults write com.apple.screensaver askForPassword


#Check if FileValut is on
if [ "$(fdesetup status)" == "FileVault is On." ]; then
  echo "Disk encryption is lit. 🔥"
fi

if [ "$(fdesetup status)" == "FileVault is Off." ]; then
  echo "FILEVALUT NOT TURNED ON TURN IT ON 🙁. Check after the setup, I can't fix it yet."
fi

#Install Xcode Tools
echo "Installing Xcode Tools"
xcode-select --install

#Change Screenshot Location to Screenshots Folder on Desktop
if [ -d "$SCREENSHOT_DIRECTORY" ]; then
  echo "Setting up Screenshots folder"
  cd ~/Desktop && mkdir Screenshots
  defaults write com.apple.screencapture location ~/Desktop/Screenshots
fi

#Setup Software $TODO Error-handling (Users shouldn't see errors)
echo "Installing cask Software Install.. (may take long if the internet is slow)"
cask_apps="atom discord dropbox spotify telegram 1password iterm2 sonos stremio transmission-nightly vlc-nightly google-chrome vmware-fusion"

su brad -c "brew install mas" #We will need this laster for installing MAS
su brad -c "brew tap caskroom/cask"
su brad -c "brew tap caskroom/versions"

su brad -c "brew cask install Caskroom/cask/$cask_apps"

#Install Mac Store Apps
echo "Installing Mac Store Apps..."
mac_apps_ids="425424353 1088330492 409789998" #TODO Make script not assume that MAS is logged in?
su brad -c "mas install $mac_apps_ids"

#TODO Download and move non-casked apps: Flux

#Just some cleanup
echo "Resetting UI for Screenshot default folder to take effect"
killall SystemUIServer

echo "all done!:) 🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏🙏"
