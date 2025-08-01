if status is-interactive
  # Commands to run in interactive sessions can go here
  # eval (zellij setup --generate-auto-start fish | string collect)
end

export GPG_TTY=$(tty)

if type -q eza
  alias ls="eza --long --header --git --icons"
  alias la="ls -a"
end

if type -q nvim
  alias vim=nvim
  export EDITOR=nvim
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

if type -q zoxide
  zoxide init fish | source
end

# Setup mise for binary versioning in a folder
if type -q mise
 mise activate fish | source
end

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

# Go Config
set -x -U GOPATH $HOME/.go
set -gx PATH $PATH $GOPATH/bin

# Rust
source "$HOME/.cargo/env.fish"

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# dsf allows to simplify some of the common git commands
function dsf -a action
  set branch $(git rev-parse --abbrev-ref HEAD)
  
  switch $action
    case sync
      git switch main && git pull
      git branch --merged | grep -v "^\*\\|main" | xargs -n 1 git branch -d
      git remote prune origin
      if test $branch != main
        if git show-ref --verify --quiet refs/heads/$branch
          git switch $branch && git rebase -i main
        else
          echo "Branch '$branch' was deleted (merged)"
        end
      end

    case export
      if test $branch = main
        echo "Can't push to main!"
        return
      end

      git push --force-with-lease && gh pr create

    case prs
      gh pr list --author "@me"
  end
end

# MacOS only I assume
alias dns-flush-cache='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Load Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
