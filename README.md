# dotfiles
My dotfile configuration for my Mac. This will do some Mac configuration as well as software installs for me.

**This script is intended to run on a 'fresh' install of macOS Sierra. Mac configuration defaults vary on the version and may not work. It's probably not a good idea to run this on your production computer. Make sure you backup your files and configurations before running this.**

### Why did you do this? 
In my quest to learn how DevOps works, scripting and automation is an important skill to have. I figured this would be a good starting point. 

### Why can't this script run without Homebrew?
Homebrew can't be installed while in root, as it's pretty dangerous. I want to work on a safe way of installing Homebrew, but right now this is all I have.

### What's with the weird 'su' commands? 
It's the same issue as previously stated. Homebrew commands shouldn't be run in root. If you know a better way of doing this, let me know.

### Any notes for you (or for yourself)?
* Make sure you're logged in to the Mac App Store BEFORE you run your script. Usually you do this in the first Mac setup, but if you skip this step, mas can't run. This is because Apple has mandated 2FA, which does not play well with mas (yet), so the signin feature does not work (as of 1-29-17). 
* If you are going to install homebrew, don't install xcode-tools as part of your setup. Homebrew will do this for you via the softwareupdate tool built-in to Macs, and it might confuse the setup. 
* Although this is zero-touch, you will need to enter your credentials for fdesetup. 
* Speaking of fdesetup, **the recovery key is INCLUDED with the logs. Use discretion (hint : protect yourself) as to where you put your logs and make you grab the key.** 
