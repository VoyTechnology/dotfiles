# Dotfiles

The following repo tracks dotfiles using the bare Git repo method as described
in [Atlassian Dotfiles Tutorial].

## Setup

1. `git clone --bare git@github.com:VoyTechnology/dotfiles ~/.dotfiles`
2. `alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'`
3. `dotfiles checkout` (If your config file exists already back it up or
   delete it first.)

## Changes

To make changes just use normal git commands, but instead of `git` use
`dotfiles`, eg. `dotfiles status`.

[Atlassian Dotfiles Tutorial]: https://www.atlassian.com/git/tutorials/dotfiles
