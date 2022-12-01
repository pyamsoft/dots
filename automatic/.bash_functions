##
# Color man pages
man()
{
  exec env \
  LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;38;5;74m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[38;5;246m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[04;38;5;146m' \
  "$(command -v man)" "$@"
}

##
# Sometimes the archlinux-keyring upgrades and causes pacman PGP errors.
#
# This is a very specific problem with a very specific fix.
# Do not -Sy anywhere else, always -Syu
fix_pacman_keyring()
{
  exec sudo pacman -Sy archlinux-keyring && sudo pacman -Syu
}

##
# Unexport all flatpak documents
clear_flatpak_exported_documents()
{
  for d in $(flatpak documents); do
    flatpak document-unexport --doc-id "${d}" || return 1
  done

  return 0
}

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab:
