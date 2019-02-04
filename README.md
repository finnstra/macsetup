# macsetup

This will do some Mac configuration as well as software installs for me. I want to improve my Bash scripting, so I made this in the process. When I have extra free time, I contribute towards it.

## DISCLAIMER

This script is intended to run on a vanilla install of macOS Mojave. Mac configuration defaults may vary on the version and may not work. Make sure you backup your files and configurations before running this , remove undesired configs.

## Steps

1) Fork 🍴
1) Run the `inventory.sh` script to create a list detected of packages and apps from Homebrew. Two files are populated in the `configs` folder:
    * `configs/brew_packages`
    * `configs/cask_packages`

    New to Homebrew? Look here [first](https://brew.sh/).
1) Run install.sh 🏃‍

## Folder Organization

* `configs` - Software-related configurations. Settings are applied after Homebrew installs applications.
* `macos` - System-related configurations. Settings are applied at the beginning of the script run. If one of your system configurations contain a software dependency, place it in the `configs` folder instead.

## Additional Notes

* This script heavily relies on the use of [Homebrew](https://brew.sh/).

* The script will now prompt you to ensure you've logged in to the Mac App Store with your Apple ID. This is done to support Apple's two-factor (2FA) login, which does not play well with [`mas`](https://github.com/mas-cli/mas).

* If you intend to use Homebrew, don't install xcode-tools separately in your setup, it may confuse Homebrew.

* **The FileVault recovery key is INCLUDED with the logs**. Use discretion (hint : protect yourself) with your log location and obtain the key (I would like to figure out a better/secure way of doing this, if you have an idea, submit a PR or reach out.)

## Credits

*   My ZSH theme is partially taken from Jared Allard's configs. You can look at his (far more robust) dotfiles configuration [here](https://github.com/jaredallard/dotfiles).