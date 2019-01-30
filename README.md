# macsetup

This will do some Mac configuration as well as software installs for me. I want to improve my Bash scripting, so I made this in the process. When I have extra free time, I contribute towards it.

## DISCLAIMER

This script is intended to run on a vanilla install of macOS Mojave. Mac configuration defaults may vary on the version and may not work. Make sure you backup your files and configurations before running this , remove undesired configs.

## Steps

1) `git clone` my macsetup repo.
1) run the `inventory.sh` script to pull all installed Homebrew (cask/brew) packages on your working machine. This will update two files in the configs folder:
    *`configs/brew_packages`
    *`configs/cask_packages`

Note: New to Homebrew? Look here [first](https://brew.sh/).

### Additional Notes

* This script heavily relies on the use of [Homebrew](https://brew.sh/).

* The script will now prompt you to ensure you've logged in to the Mac App Store with your Apple ID. This is done to support 2FA login, which does not play well with [`mas`](https://github.com/mas-cli/mas).

* If you intend to use Homebrew, don't install xcode-tools separately in your setup. Homebrew will do this for you via the `softwareupdate` tool built-in to Macs, and it might confuse the installer.

* **The FileVault recovery key is INCLUDED with the logs**. Use discretion (hint : protect yourself) with your log location and ensure you grab the key.
    * I would like to figure out a better/secure way of doing this, if you have an idea, submit a PR or reach out :)
