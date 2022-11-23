# I like tacos
# Presetup - Do not remove or bad things will happen
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE=true

# Turn off autocomplete beeps
unsetopt LIST_BEEP

# Enable tab completion
autoload -Uz compinit && compinit

# Set my editor as Vim
export EDITOR=nvim

# Set up prompt from @jaredallerd's dotfiles
PROMPT='%{$fg[cyan]%}日本 %{$fg[magenta]%}[%c] %{$reset_color%}'
RPROMPT='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"

# Add aliases
alias cls='clear'
alias tf="terraform"
alias zsh-config="vi ~/.zshrc"
alias vi="nvim"
alias v="nvim"
