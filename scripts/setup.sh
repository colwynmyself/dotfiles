#!/usr/bin/env bash

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  nicelog "ERROR: Oh My Zsh is not installed. Please install it first."
  exit 1
fi

REPO_DIR="$(git rev-parse --show-toplevel)"

nicelog "Managing $HOME"
cd "$HOME" || exit 1
ln -sf "$REPO_DIR/.gitconfig" .
ln -sf "$REPO_DIR/.tmux.conf" .
ln -sf "$REPO_DIR/.vimrc" .
ln -sf "$REPO_DIR/.zshrc" .
ln -sf "$REPO_DIR/bin" .

SIGNING_KEY_FILE="$HOME/.gitconfig.signingKey"
if [[ ! -f "$SIGNING_KEY_FILE" ]]; then
  echo "
[user]
  signingKey = <KEY ID>
" > "$SIGNING_KEY_FILE"
  nicelog "Configure a new GPG key for signing git commits

Add the key ID to $SIGNING_KEY_FILE

https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key
"
fi

# ZSH_CUSTOM isn't available in this script. Probably has something to do with it being a script and not a shell
ZSH_CUSTOM_DIR="$HOME/.oh-my-zsh/custom"
nicelog "Managing $ZSH_CUSTOM_DIR"
cd "$ZSH_CUSTOM_DIR" || exit 1
ln -sf "$REPO_DIR/env.cachyos.zsh" .

