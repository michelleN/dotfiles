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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Ruby tweaks
if [[ -z $(ruby -W0 -e "print RUBY_VERSION" | grep 2\.) ]]; then
  export RUBY_FREE_MIN=500000
  export RUBY_HEAP_MIN_SLOTS=40000
else
  export RUBY_GC_MALLOC_LIMIT=1000000000
  export RUBY_GC_HEAP_FREE_SLOTS=1000000000
  export RUBY_GC_HEAP_FREE_SLOTS=500000
fi

export HISTFILESIZE=9999
export HISTSIZE=9999


export GOPATH="$HOME/go"
export PATH="$HOME/sbin:/usr/local/bin:$PATH:/usr/local/git/bin:/usr/local/sbin:$GOPATH/bin"
alias record="asciinema"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
