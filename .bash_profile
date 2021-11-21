# Assorted system settings
export PATH="$HOME/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"
export BASH_SILENCE_DEPRECATION_WARNING=1
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion # slow (~0.5s)
fi
if [ -f "$HOME/repositories/git/contrib/completion/git-completion.bash" ]; then
    . "$HOME/repositories/git/contrib/completion/git-completion.bash"
fi

# Redis
export PATH="$HOME/redis-bin:$PATH"

# git awareness (slow ~0.5s)
export GITAWAREPROMPT=~/repositories/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh" &>/dev/null

export PS1="\t | \W (\$ASSUMED_ROLE) \[\$txtcyn\]\$git_branch\[\$txtred\]\$git_dirty\[\$txtrst\]\$ "

function whoami-aws {
  aws sts get-caller-identity
}

# rbenv (slow ~0.5s)
# ~0.1s with --no-rehash
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# tmux
source ~/repositories/tmuxinator/completion/tmuxinator.bash

# nvm (very slow ~ 1s)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## Lazy load NVM: https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -t __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
  __node_commands+=("node")
  __node_commands+=("nvm")

  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }

  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

# Python Virtualenv (very slow ~1.1s)
# With bash --no-rehash ~0.35s
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init -)"

# Python Startup
export PYTHONSTARTUP=~/.pystartup

# autojump (slow ~0.12s)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Don't exit on Ctrl+D
set -o ignoreeof

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias ll="ls -lh"
alias la="ls -al"
alias lf='ls -la | grep "^d" && ls -la | grep -v "^d"'
alias nr="npm run"
alias be="bundle exec"
alias sed="gsed"
alias mkdir="mkdir -p"
alias sum-stdin="paste -sd+ - | bc"

# Commands
rc() {
  echo -e '\033]Ph000000\033\\'
  echo -e '\033]Pgffffff\033\\'
}

mcd() {
  mkdir $1
  cd $1
}

cpfile() {
  cat $1 | pbcopy
}

ssh() {
  if command ssh "$@"; then
    rc
  fi
}
