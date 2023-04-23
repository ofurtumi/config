###########################################################################
######################## BASICS ###########################################

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

###########################################################################
########################## PATHS ##########################################

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
export PATH=$PATH:$JAVA_HOME
HISTIGNORE='genenv *'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

. "$HOME/.cargo/env"

########################## LANDING ########################################

if [[ "$TERM" == "xterm-kitty" ]]; then
	if [[ -f .bashrc ]]; then
		cd Documents
	fi
	neofetch
fi

eval "$(starship init bash)"

########################## FUNCTIONS ######################################

mcd() {
	mkdir -p "$1"
	cd "$1"
}

c() {
	code $1 -r && exit
}

genenv() {
	if dropdb "$1" >/dev/null; then
		echo "Dropped database $1"
	else
		echo "Database $1 does not exist"
	fi

	if createdb "$1" >/dev/null; then
		echo "Created database $1"
	else
		echo "Database $1 already exists"
	fi

	printf "SESSION_SECRET=asdf\nJWT_SECRET=asdf\nDATABASE_URL=postgres://tumi:$2@localhost/%s" "$1" >.env
}

# startar neovim án nokkurs padding
v() {
	kitty @ set-spacing padding=0
	nvim $*
	kitty @ set-spacing padding=default
}
