# Enable and specify the terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set locale
export LANG="en_EN.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Aliases
alias l="ls -l"
alias ll="ls -al"
alias lx="ls -al"
alias dush="du -sm * | sort -n"
alias pa="ps aux | grep"

# Paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PYTHONPATH=.:$PYTHONPATH

