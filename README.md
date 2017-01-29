# dotfiles
My dotfile configuration for my Mac. This will do some Mac configuration as well as software installs for me. The issue right now is that this script assumes information that, out of the box, a computer would not have set. This will be fixed in later versions. 

### Why did you do this? 
In my quest to learn how DevOps works, scripting and automation is an important skill to have. I figured this would be a good starting point. 

### Why can't this script run without Homebrew?
Homebrew can't be installed while in root, as it's pretty dangerous. I want to work on a safe way of installing Homebrew, but right now this is all I have.

### What's with the weird 'su' commands? 
It's the same issue as previously stated. Homebrew commands shouldn't be run in root. If you know a better way of doing this, let me know.
