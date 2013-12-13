source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;34m\]\w\[\033[m\]\$ "


# For light terminals
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# For dark terminals
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced

PATH="/Users/Sol/src/dotfiles/scripts:${PATH}"
export PATH


# Bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Menu completion
bind '"\t":menu-complete'

# Case insensitive filenames for globbing.
# example: ls A* will show a* files as well.
shopt -s nocaseglob

# Case insensitive filenames for tab completion.
bind 'set completion-ignore-case on'

# Don't capture all history commands.
export HISTIGNORE="&:ls:ll:[bf]g:exit:rm *"

# Custom PS1
source ~/src/dotfiles/bash/vaughn.ps1.bash

# for bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi