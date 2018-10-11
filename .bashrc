#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### VARIABLES ###
XDG_CONFIG_HOME="$HOME/.config"
WALLP="$HOME/Pictures/Wallpapers"
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

PS1="\u \W \[\e[0;33m\]\$ \e[m"
######


### UTILS ###
# Timestamp function 
function timestamp() {
  date +"%T"
}
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
#alias 4g='sudo netctl stop-all && netctl start 4G-yare-yare'
alias 4g='nmcli con up id 4g'
# Wifi Bbox Oullins
#alias wifi-oullins='sudo netctl stop-all && netctl start oullins-bbox'
######

### SCREEN SHOT ###

# Select area, output to clipboard
alias sc='import png:- | xclip -selection c -t image/png'

# Select area, output to file
alias ss='scrot -s ~/Pictures/$(timestamp).png'

######

### RICE ###

# Load Oomox with current wal theme
alias walmox='wal -R -g'

# Sync conky color with wal's
alias walsync='$HOME/.scripts/utils/apply-wal-colors.py tint2 conky'

# Wal with haishoku backend, works best with light colors
function walh() {
  wal -n -e --backend haishoku -i "$@"
  feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
  $HOME/.scripts/utils/apply-wal-colors.py tint2
  killall tint2 && killall polybar
  wal -R -g &> /dev/null
}

# Wal with colorz backend, works best with dark colors
function walco() {
  wal -n -e --backend colorz -i "$@"
  feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
  $HOME/.scripts/utils/apply-wal-colors.py tint2
  killall tint2
  killall polybar
  wal -R -g &> /dev/null
}

######
