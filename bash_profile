#!/usr/bin/env sh

source $HOME/.aliases #aliasess

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

## set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]] ; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.files/bin" ]] ; then
    PATH="$HOME/.files/bin:$PATH"
fi

## Editor
if [[ -s $(which mvim) ]]; then
  export EDITOR=mvim
else
  export EDITOR=vim
fi

# git bash completions
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH=$PATH:$HOME/dotfiles/bin