#!/usr/bin/env bash

#This was created so that we could clone the repo.
#Why didn't I think of this...you need git first.

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

#Start configuration with install-script
bash install-script.sh
