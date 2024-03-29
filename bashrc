#!/usr/bin/env sh

## Set ls options per platform
if [[ $OSTYPE == 'linux-gnu' ]]; then
  alias ls='ls -p --color=auto'
elif [[ $OSTYPE == 'darwin21' ]]; then
  alias ls='ls -Gp'
fi

## Functions
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != *"nothing to commit"* ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

## Prompt
if [[ -n "${SSH_CONNECTION+x}" ]]; then
  export PS1="\H:\W \$(parse_git_branch)\$ "
else
  export PS1="\W \$(parse_git_branch)\$ "
fi

if [[ -s $(which keychain 2>/dev/null) ]]; then
  keychain ~/.ssh/id_rsa
fi