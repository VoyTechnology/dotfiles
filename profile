# Start i3 on login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  # exec sway
  startx && false
fi

# Wayland ENV Vars
# export GDK_BACKEND=wayland
# export CLUTTER_BACKEND=wayland
# export SDL_VIDEODRIVER=wayland

export PATH="$HOME/.cargo/bin:$PATH"

# Helpful aliases
alias nt="termite . &; disown &> /dev/null"
alias pi="ssh 192.168.0.12"
# FIXME alias chat="ssh 192.168.0.12 -t \"chat\""
alias update="yaourt -Syyua"

# Current project CD
alias cerberus="cd $HOME/code/github.com/cpssd/cerberus"
