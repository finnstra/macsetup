# Install Brew if necessary
if [ "$(which brew)" == "" ]; then
  echo "Homebrew install not detected. Installing now."
  sudo -u $SUDO_USER /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew installation detected. Enforcing Brewfile."
fi

brew install coreutils
brew bundle