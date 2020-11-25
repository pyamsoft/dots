#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

prompt_ps1()
{
  off="\033[0m"
  red="\033[1;31m"
  purple="\033[1;35m"
  printf -- '%s%s@%s %s%s\n' "${red}" '\u' '\h' "${purple}" '\w'
  printf -- '%s%s %s' "${red}" '\$' "${off}"

  unset red
  unset off
  unset purple
}

prompt_command()
{
  PS1=$(prompt_ps1)
  export PS1
}

enable_bash_completion()
{
  # Enable bash completion
  bcomp="/usr/share/bash-completion/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"
  unset bcomp

  bcomp="/etc/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"
  unset bcomp
}

enable_bash_completion
PROMPT_COMMAND=prompt_command
export PROMPT_COMMAND

# Colorized
alias ls="ls -CHh --color=auto "
alias dir="dir -CHAlh --color=auto "
alias grep="grep -E --color=auto "

# Quick ls
alias ll="ls -CHhl --color=auto "
alias la="ls -CHhA --color=auto "
alias lla="ls -CHhAl --color=auto "
alias lal="ls -CHhAl --color=auto "

# Verbose
alias rm="rm -iv "
alias cp="cp -iv "
alias mv="mv -iv "
alias mkdir="mkdir -vp "
