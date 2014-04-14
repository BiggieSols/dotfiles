source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[15m\]\h:\[\033[33;34m\]\w\[\033[m\]\$ "

# For light terminals
export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

# For dark terminals
# export CLICOLOR=1
export LSCOLORS=export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


PATH="/Users/Sol/src/dotfiles/scripts:${PATH}"
export PATH

# Coreutils (from brew)
PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"

# Bash aliases
if [ -f ~/src/dotfiles/bash/bash_aliases ]; then
    . ~/src/dotfiles/bash/bash_aliases
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
##
# Your previous /Users/Sol/.bash_profile file was backed up as /Users/Sol/.bash_profile.macports-saved_2013-12-22_at_20:52:46
##

# MacPorts Installer addition on 2013-12-22_at_20:52:46: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

