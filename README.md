# dotfiles
My dotfile configuration for my Mac. This will do some Mac configuration as well as software installs for me.

With motivation and lots of cold brew, I am sure I will make make something similar for my Windows machine. 

### DISCLAIMER
This script is intended to run on a vanilla install of macOS Sierra. Mac configuration defaults may vary on the version and may not work. Make sure you backup your files and configurations before running this , and comment/uncomment any configurations you do not want.

### Why did you do this? 
I want to improve my Bash scripting, so I made this in the process. When I have extra free time, I contribute towards it.

### What about app configurations or for my dev environment? 
Once I have more time I will do this. I switched from iTerm to [hyper](https://hyper.is) so that my configurations can traverse between platforms, although it would be worthwhile to learn vim.

### Additional Notes
* The script will now prompt you to ensure you've logged in to the Mac App Store with your Apple ID. This is done to support 2FA login, which does not play well with `mas`. 
* If you are going to install homebrew, don't install xcode-tools as part of your setup. Homebrew will do this for you via the `softwareupdate` tool built-in to Macs, and it might confuse the setup. 
* **The recovery key is INCLUDED with the logs. Use discretion (hint : protect yourself) as to where you put your logs and make sure you grab the key. I would like to figure out a better way of doing this. ** 
