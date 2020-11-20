# User bashrc

# shellcheck disable=SC1090
# Source bash_profile if the environment is not setup
if [ -z "${PYAMSOFT_ENVIRONMENT}" ]; then
  [ -f "${HOME}"/.bash_profile ] && . "${HOME}"/.bash_profile
fi

# Get the git part of the prompt
prompt_command_git()
{
  prompt=""
  gprompt_path="/usr/share/git/completion/git-prompt.sh"
  if [ -r "${gprompt_path}" ]; then
    # shellcheck disable=SC1090
    . "${gprompt_path}"
    prompt="$(__git_ps1 '(%s)')"
  fi

  # Add a space to the prompt if it has content
  if [ "${prompt}" = "" ]; then
    printf -- '%s\n' "${prompt}"
  else
    printf -- '%s \n' "${prompt}"
  fi

  unset prompt
  unset gprompt_path
  return 0
}

prompt_color_ps1()
{
  user_color=""
  if [ "$(id -u)" -eq 0 ]; then
    # shellcheck disable=SC2154
    user_color="${BcolorR}"
  else
    # shellcheck disable=SC2154
    user_color="${BcolorG}"
  fi

  # Multiline PS1
  # $1 git prompt

  # shellcheck disable=SC2154
  prompt_ps1 "$1" "\\[${colorOff}\\]" "\\[${BcolorP}\\]" "\\[${user_color}\\]"

  unset user_color
}

## Create the PS1
# $1 git prompt
# $2 reset prompt color
# $3 directory color
# $4 user color
prompt_ps1()
{
  # Substitute all commands which take escape codes so we don't need to triple
  # escape things like \u and \$
  printf -- '%s%s@%s %s%s %s%s\n' "$4" '\u' '\h' "$3" '\w' "$2" "$1"
  printf -- '%s%s %s' "$4" '\$' "$2"
}

# set the PS1
prompt_command()
{
  # Clear the ps1
  PS1=

  # Git prompt command
  git_prompt=$(prompt_command_git)

  # Set the PS1 based on color availability
  if [ "$(tput colors)" -ne 0 ]; then
    PS1=$(prompt_color_ps1 "${git_prompt}")
  else
    PS1=$(prompt_ps1 "${git_prompt}")
  fi
  export PS1

  # Unset local variables
  unset git_prompt
}

bashrc()
{

  PROMPT_COMMAND=prompt_command
  export PROMPT_COMMAND
}

# Source the dircolors here
bashrc

# Do not export the functions
unset bashrc

# Launch an ssh-agent at least for this shell - see .environment
# for an agent for an entire session - normally this line will not be used.
if [ -z "${SSH_AUTH_SOCK}" ]; then
  eval "$(ssh-agent -s)"
fi

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround:
