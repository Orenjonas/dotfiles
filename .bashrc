# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# thefuck
eval $(thefuck --alias)

########### Functions ###########

vassal() {
  ~/VASSAL-3.4.2/VASSAL.sh $@
}

textemplate() {
cp ~/dotfiles/template.tex "./$1.tex" && nvim "$1.tex"
}

# Open vim session by choosing from a list
vims() {
  sessions=($(ls ~/.vimsessions/))
  for i in $(seq 0 $((${#sessions[@]} - 1))); do
    echo $i ${sessions[$i]}
  done
  read choise # user inputs number corresponding to path
  nvim -S .vimsessions/${sessions[$choise]}
}

# Present directory results from locate and dhange directory to users choise
matrix_sym() {
  python3 ~/scripts/python/symbol_matrix.py $1
}

#### Search for file and cd to it ####
# locate file and cd
locd() {
  arr=($(locate $1))
  for i in $(seq 0 $((${#arr[@]} - 1))); do
    echo $i ${arr[$i]}
  done
  read choise # user inputs number corresponding to path
  cd $(dirname ${arr[$choise]})
}

# find file and cd
ficd() {
  arr=($(find -iname "$1" -or -ipath "$1"))
  for i in $(seq 0 $((${#arr[@]} - 1))); do
    echo $i $(dirname ${arr[$i]})
  done
  read choise # user inputs number corresponding to path
  cd $(dirname ${arr[$choise]})
}

# Using fzf (requires fzf installed)
fcd() {
  # Remove spaces from filename
  arguments=$(echo "$@")
  firstString=$(fzf -q "$arguments")
  secondString=""
  pattern=" "
  mypath="${firstString//$pattern/$secondString}"
  # cd to filepath
  cd "$(dirname $mypath)"
}

# Create github repo from commandline
# usage:
# > gitcreaterepo [USERNAME] [REPONAME]
gitcreaterepo() {
	curl -u "$1" https://api.github.com/user/repos -d '{"name":"'$2'"}'
}

# Backup dotfiles to git
backupdot_with_msg() {
  echo adding nvim config file
  cd ~/.config/nvim/vim-snippets/
  git add .
  git commit -m "update"
  git push origin master
  cd -

	cp ~/.config/nvim/init.vim ~/dotfiles
	cp ~/.bash_aliases ~/dotfiles
	cp ~/.bashrc ~/dotfiles

  cd ~/dotfiles

	while read p; do
    echo adding $p
		git add $p
	done <~/dotfiles/files_to_backup.txt # list of files/folders to symlink in homedir

	git commit -m "update"
	git push origin master
	cd -

  cd ~/scripts
  git add .
  git commit -m "update"
  git push origin master
  cd -
}

# Change title of tabs
set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# For subsequent "cd ../../" etc.
climb() {
  declare -i n
  if [ $# == 0 ]; then
    n=1
  else
    n=$1
  fi
  while [ $n -gt 0 ]; do
    cd ..
    ((n--))
  done
}

# compile and run java script with one potential command line argument
jac() {
  javac "$1.java" && java "$1" "$2"
}

# Initiate virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs   # Optional
export PROJECT_HOME=$HOME/projects      # Optional
source /home/jonas/.local/bin/virtualenvwrapper.sh


# # use vim commands in terminal
# set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# dstask
source /home/jonas/.dstask-bash-completions.sh
