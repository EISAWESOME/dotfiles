#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### VARIABLES ###

XDG_CONFIG_HOME="$HOME/.config"

WALLP="$HOME/Pictures/Backgrounds"
######


### UTILS ###
# Timestamp function 
function timestamp() {
  date +"%T"
}
######

### POWERLINE ###
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

PS1='[\u@\h \W]\$ '
######

### PYWAL ###
# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

######

### SHORTCUTS ###

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'

alias ..='cd ..'

alias t.='thunar .'

# Reload termite
alias rt='killall -USR1 termite'

# Reload bashrc
alias rb='. ~/.bashrc'

# Reload conky
alias rconky='killall conky && conky'

# VS code
alias code='code-git'

# Switch sur la 4G
alias 4g='sudo netctl stop-all && netctl start 4G-yare-yare'
# Wifi Bbox Oullins
alias wifi-oullins='sudo netctl stop-all && netctl start oullins-bbox'
######

### SCREEN SHOT ###

# Select area, output to clipboard
alias sc='import png:- | xclip -selection c -t image/png'

# Select area, output to file
alias ss='scrot -s ~/Pictures/$(timestamp).png'

######

### RICE ###

# Wal with coloz backend
alias walco='wal --backend colorz -i'

# Load Oomox with current wal theme
alias walmox='wal -R -g'

# Sync conky color with wal's
alias walsync='$HOME/.scripts/apply-wal-colors.py'

######
