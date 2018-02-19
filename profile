# Start i3 on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  # exec sway
  startx && false
fi

# Wayland ENV Vars
# export GDK_BACKEND=wayland
# export CLUTTER_BACKEND=wayland
# export SDL_VIDEODRIVER=wayland

# Programming languages paths
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.pub-cache/bin

export GOCACHE=$HOME/.go/cache
export GOCODE=$HOME/.go/code

export GOPATH=$GOCACHE:$GOCODE
export PATH=$PATH:$GOCACHE/bin:$GOCODE/bin

# Include local bins
export PATH=$PATH:$HOME/bin

# Helpful aliases
alias nt="termite . &; disown &> /dev/null"
alias pi="ssh 192.168.0.12"
alias rb="ssh redbrick.dcu.ie"
# FIXME alias chat="ssh 192.168.0.12 -t \"chat\""
alias update="yaourt -Syyua"

# Current project CD
alias heracles="cd $HOME/code/github.com/cpssd/heracles"
