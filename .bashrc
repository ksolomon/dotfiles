# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export LC_CTYPE=en_US.UTF-8
export EDITOR=nano

#-----------------------------------------
#------HISTORY START----------------------

# Expand the history size
HISTFILESIZE=100000000
HISTSIZE=100000

# Set to avoid spamming up the history file
HISTIGNORE="cd:ls:[bf]g:clear:exit"

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

[ -x /usr/bin/most ] && export PAGER=most

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#################
# Custom Prompt #
#################
PROMPT_HOSTNAME='' # Machine Name Here
PROMPT_HOST_COLOR='1;36m'
PROMPT_DIR_COLOR='1;31m'
PROMPT_DEF_COLOR='0;39m'

# If I am root, set the prompt to bright red
if [ ${UID} -eq 0 ]; then
PROMPT_HOST_COLOR='41m'
PROMPT_DIR_COLOR='41m'

PS1='\e[${PROMPT_HOST_COLOR}\u@${PROMPT_HOSTNAME}: \[\e[${PROMPT_DIR_COLOR}\]\w \[\$\e[m '
fi

source ~/dotfiles/git-prompt.sh

function changes_in_branch() {
    if [ -d .git ]; then
        if expr length + "$(git status -s)" 2>&1 > /dev/null; then
            echo -ne "\033[0;33m$(__git_ps1)\033[0m";
        else
            echo -ne "\033[0;32m$(__git_ps1)\033[0m"; fi;
    fi
}

GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWCOLORHINTS='y'
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_SHOWUPSTREAM='auto'

PS1='\[\033[${PROMPT_HOST_COLOR}\]\[\033[0m\033[${PROMPT_HOST_COLOR}\]\u\[\033[${PROMPT_HOST_COLOR}\]@\[\033[${PROMPT_HOST_COLOR}\]${PROMPT_HOSTNAME} \[\033[${PROMPT_DIR_COLOR}\]\w\[\033[0m\]$(changes_in_branch)\n\[\033[${PROMPT_HOST_COLOR}\]└─\[\033[0m\033[${PROMPT_HOST_COLOR}\] \$\[\033[0m\] '

#####################
# End Custom Prompt #
#####################

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${PROMPT_HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/dotfiles/.bash_aliases ]; then
    . ~/dotfiles/.bash_aliases
fi

# ls colors
export LS_OPTIONS='--color=auto'
eval `dircolors -b ~/dotfiles/.dircolorsrc`

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PATH=$PATH:/usr/local/git/bin:~/bin:~/.composer/vendor/bin

# set up GIT_EDITOR to use nano
export GIT_EDITOR="nano"
