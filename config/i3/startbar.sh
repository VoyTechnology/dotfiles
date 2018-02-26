#!/usr/bin/env sh

# Terminate old polybars
killall polybar

# TODO: Only start the centre polybar on laptop
polybar i3left &
polybar i3centre &
polybar i3right &
