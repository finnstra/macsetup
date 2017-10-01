# dotfiles
My dotfile configuration for my Mac. This will do some Mac configuration as well as software installs for me.

### DISCLAIMER
This script is intended to run on a vanilla install of macOS Sierra. Mac configuration defaults may vary on the version and may not work. Make sure you backup your files and configurations before running this if you intend to run this configuration on a non-vanilla image, and comment/uncomment any configurations you do not want.

### Why did you do this? 
I really wanted to improve my Bashs scripting, so I created this script in the process. 

### What about app configurations or for my dev environment? 
Once I have more time I will do this. I am currently in the process of switching over from iTerm to [hyper](https://hyper.is) so that my configurations (which will work with my Windows computer!)

### Additional Notes
* The script will now prompt you to ensure you've logged in to the Mac App Store with your Apple ID. This is because Apple has mandated 2FA, which does not play well with `mas`, so the signin feature does not work (as of 1-29-17). 
* If you are going to install homebrew, don't install xcode-tools as part of your setup. Homebrew will do this for you via the `softwareupdate` tool built-in to Macs, and it might confuse the setup. 
* **The recovery key is INCLUDED with the logs. Use discretion (hint : protect yourself) as to where you put your logs and make sure you grab the key.** 
