#!/usr/bin/zsh
alias v=$EDITOR

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg="dmesg --color"

alias l="ls -lh"
alias la="ls -lah"

alias se="sudoedit"
alias df="df -h"
alias du="du -h -c"
alias sudo='sudo -E '
alias pd="pushd"
type -p trash-put && {
  alias tp="trash-put"
  alias tl="trash-list"
  alias tre="trash-restore"
}

# Arch linux specific

type -p pacman && {
  alias p="pacman"

  # reinstall all native packages
  alias reinstall!="pacman -Qnq | sudo pacman -S -"
  type -p yaourt && {
    alias y="yaourt"
    alias orph="yaourt -Qtdq | sudo pacman -Rns -"
  }

  type -p reflector &&
    # update mirrors
    alias upmir="sudo reflector --country 'United States' --age 12 --sort rate --save /etc/pacman.d/mirrorlist"
}
