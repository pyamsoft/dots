# User bashrc

# Source bash_profile if the environment is not setup
if [ -z "${PYAMSOFT_ENVIRONMENT}" ]; then
  # shellcheck disable=SC1091
  [ -f "${HOME}"/.bash_profile ] && . "${HOME}"/.bash_profile
fi

__git_ps1()
{
  return 0
}

# set the PS1
prompt_command()
{
  # Clear the ps1
  unset PROMPT_COMMAND
  unset PS1

  gprompt_path="/usr/share/git/completion/git-prompt.sh"
  if [ -r "${gprompt_path}" ]; then
    # shellcheck disable=SC1090
    . "${gprompt_path}"
  fi

  # Set the PS1 based on color availability
  if [ "$(tput colors)" -ne 0 ]; then
    # we have colors :-)
    # Don't source .sh_colors since this runs each time, its very expensive

    # No Color
    color_off="\033[0m"
    path_color="\033[1;35m"
    root_color="\033[1;31m"
    normal_color="\033[1;32m"

    user_color=""
    if [ "$(id -u)" -eq 0 ]; then
      user_color="${root_color}"
    else
      user_color="${normal_color}"
    fi

    # Double quotes so colors are evaluated, but escape __git_ps1 so its evaluated each command
    # shellcheck disable=SC2089
    PS1="${user_color}\u@\h ${path_color}\w${color_off}\$(__git_ps1 ' (%s)')
${user_color}\$ ${color_off}"
  else
    # Single quote so __git_ps1 is evaluated at runtime each new command
    # shellcheck disable=SC2089
    PS1='\u@\h \w $(__git_ps1 " (%s)")
\$ '
  fi

  # shellcheck disable=SC2090
  export PS1

  # Unset local variables
  unset git_prompt
  unset color_off
  unset path_color
  unset root_color
  unset normal_color
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

bashrc()
{
  # Source the bash extras file
  # shellcheck disable=SC1091
  [ -f "${HOME}"/.bash_alias ] && . "${HOME}"/.bash_alias

  prompt_command
  enable_bash_completion
}

# Setup
bashrc

# Do not export the functions
unset bashrc
unset enable_bash_completion

# Launch an ssh-agent at least for this shell - see .environment
# for an agent for an entire session - normally this line will not be used.
if [ -z "${SSH_AUTH_SOCK}" ]; then
  eval "$(ssh-agent -s)"
fi

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround:
