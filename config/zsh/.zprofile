#!/bin/bash

#### ZPROFILE ####

########################### EXPORTS ###################################

#export VISUAL=nvim
#export EDITOR=nvim visudo
export DOTFILE="$HOME/.dot"
export PATH="$DOTFILE/bin/scripts:$PATH"
export PATH="$DOTFILE/bin/bookmarks:$PATH"
export FZF_DEFAULT_OPTS='--height 50%' #--border --info=inline
export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

########################## MAN COLORS #################################

# 01|BOLD
# 04|UNDERLINE
# 05|ITALIC
# 30|BLACK
# 31|RED
# 32|GREEN
# 33|YELLOW
# 34|BLUE
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[31m' 		# Function Names & Paragraph Title
export LESS_TERMCAP_so=$'\e[01;43;30m' 	# SEARCH AND BOTTOM BAR
export LESS_TERMCAP_us=$'\e[1;33m'		# Variables
export LESS_TERMCAP_se=$'\e[0m'  		# Function Names & Paragraph Title
export LESS_TERMCAP_ue=$'\e[0m'			# End Message
export LESS_TERMCAP_me=$'\e[0m'  		# Function Names & Paragraph Title
#export LESS_TERMCAP_so=$'\e[38;5;246m' # begin standout-mode - info box
#export LESS_TERMCAP_so=$'\e[4;37m'		# End Message

########################## TTY COLORS #################################

if [ "$TERM" = "linux" ]; then
	echo -en "\e]P0191d20" #black
	echo -en "\e]P82B2B2B" #darkgrey
	echo -en "\e]P1D75F5F" #darkred
	echo -en "\e]P9E33636" #red
	echo -en "\e]P287AF5F" #darkgreen
	echo -en "\e]PA98E34D" #green
	echo -en "\e]P3D7AF87" #brown
	echo -en "\e]PBFABD2f" #yellow
	echo -en "\e]P48787AF" #darkblue
	echo -en "\e]PC7373C9" #blue
	echo -en "\e]P5BD53A5" #darkmagenta
	echo -en "\e]PDD633B2" #magenta
	echo -en "\e]P65FAFAF" #darkcyan
	echo -en "\e]PE44C9C9" #cyan
	echo -en "\e]P7E5E5E5" #lightgrey
	echo -en "\e]PFFFFFFF" #white
	clear #for background artifacting
fi

########################### EVALS ####################################

#eval $(thefuck --alias)

########################## SOURCE ###################################
# Launch startx at login
#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1  ]]; then
	#exec startx
#fi
