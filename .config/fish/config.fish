if status is-interactive
  # Commands to run in interactive sessions can go here
end

if type -q exa
  alias ls="exa --long --header --git --icons"
  alias la="ls -a"
end

if type -q nvim
  alias vim=nvim
end

if type -q bat
  alias ncat=/bin/cat
  alias cat=bat
end

if type -q fzf
  alias fs="fzf --bind 'enter:become(code {})'"
end

# Setup rtx for application management
rtx activate fish | source

# GPG setup
export GPG_TTY=$(tty)

# Kubernetes Aliases
alias k="kubectl -n"

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
