# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
force_color_prompt=yes

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

## Uncomment the following line to enable autojump:
export MOOSE_JUMP=true

## Source the MOOSE profile if moose_profile exists:
if [ -f /opt/moose/environments/moose_profile ]; then
   . /opt/moose/environments/moose_profile
fi

# Git branch in prompt.
parse_git_branch() {
git branch 2> /dev/null |sed -e'/^[^*]/d' -e's/*\(.*\)/(\1 )/'
}
PS1="\[\033[1;34m\][\u@\h]\[\033[1;32m\][\w]\[\033[0m\]\$(parse_git_branch)\[\033[00m\]>"

#Peacock
export PATH=$PATH:/home/andy/projects/moose/gui

#Cubit
export PATH=/home/andy/cubit/:$PATH

# Qt path
export PATH=/home/andy/Qt5.6.2/5.6/gcc_64/bin:$PATH

# export script folder
export PATH=/home/andy/scripts:$PATH
# Make path
#export MAKE=/usr/bin/make

# Paraview
#export PATH=/home/andy/projects/paraview_bin/bin:$PATH
export PATH=/home/andy/projects/paraview5.8/bin:$PATH

# Conda PATH
# export PATH=~/anaconda2/bin:$PATH

# PYTHONPATH
# export PYTHONPATH=$PATH:/home/andy/projects/python

# EXPORT MATLAB
export PATH=/home/andy/MATLAB/R2018a/bin:$PATH

# EXPORT MOOSE
export PATH=/home/andy/projects/moose/modules/combined:$PATH

# EXPORT BISON
export PATH=/home/andy/projects/bison_fracture:$PATH
export PATH=/home/andy/projects/bison:$PATH
# EXPORT MARMOT
export PATH=/home/andy/projects/marmot:$PATH

# EXPORT MANATEE & NFS
export PATH=/home/andy/projects/nfs:$PATH
export PATH=/home/andy/projects/manatee:$PATH

# Common ALIAS
alias school='cd /home/andy/pCloudDrive/Grad/SP19'
alias drive='cd /home/andy/pCloudDrive'
alias open='xdg-open'
alias dsh='du -sh'
alias mpimantee='mpiexec -n 8 manatee-opt'

# eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andy/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andy/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andy/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andy/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



## TEST MONGODB
export PATH=/home/andy/projects/nfml_prototype/mongodb_linux/bin:$PATH

