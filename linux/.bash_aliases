alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTION -lh --color'
alias l='ls $LS_OPTIONS -Ff --color'
alias la='ls $LS_OPTIONS -af --color'
alias ld='ls -d $LS_OPTIONS -af --color'  # directories only!
alias dir='ls -alh'
alias del='rm'

# Make dmesg human-parseable
alias dmesg='dmesg -H'

# Search process list
psg() {
    ps aux | grep -v grep | grep $1 --color
}

# Apply sane permissions to files and folders
alias fixdirs='find . -type d -exec chmod 755 {} \;'
alias fixfiles='find . -type f -exec chmod 644 {} \;'

# Some more alias to avoid making mistakes:
alias copy='cp'

# -h makes the numbers human
alias df='df -h'
alias du='du -h -c'
alias ps='ps'
alias mkdir='mkdir -p'
alias grep='grep -n --colour'
alias g="grep"
alias cls='clear'

#folder bookmarks with quick jump function
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

function unmark {
    rm -i "$MARKPATH/$1"
}

function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

# finally, a calculator!!
calc () {
	echo "$*" | bc -l;
}
