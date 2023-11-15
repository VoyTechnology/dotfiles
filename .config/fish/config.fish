if status is-interactive
  # Commands to run in interactive sessions can go here

  eval (zellij setup --generate-auto-start fish | string collect)
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

if type -q ack
  alias cs="ack"
end

# Setup rtx for application management
rtx activate fish | source

# Setup direnv if installed
if type -q direnv
  direnv hook fish | source
end

# GPG setup
export GPG_TTY=$(tty)

# Kubernetes Config
alias k="kubectl -n"
set -gx PATH $PATH $HOME/.krew/bin
export KUBECONFIG=$(find ~/.kube/config.d -type f | xargs | tr -s '[:blank:]' ':')

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# dsf allows to simplify some of the common git commands
function dsf -a action
  set branch $(git rev-parse --abbrev-ref HEAD)
  
  switch $action
    case sync
      git switch main && git pull && git switch $branch && git rebase -i main
    case export
      if test $branch = main
        echo "Can't push to main!"
        return
      end

      git push --force-with-lease && gh pr create
  end
end

