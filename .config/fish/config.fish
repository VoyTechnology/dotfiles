if status is-interactive
  # Commands to run in interactive sessions can go here
end

if type -q exa
  alias ls="exa -l -g --icons"
  alias la="ls -a"
end

rtx activate fish | source

alias dotfiles='git --git-dir=/Users/voy/.dotfiles --work-tree=/Users/voy'
