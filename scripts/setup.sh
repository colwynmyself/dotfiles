#!/usr/bin/env bash

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  nicelog "ERROR: Oh My Zsh is not installed. Please install it first."
  exit 1
fi

create_symlink() {
  # Make a nice name for the log
  current_dir="$(pwd)"

  log_dest="$2"
  if [[ "$2" == "." ]]; then
    log_dest="$(basename "$1")"
  fi

  nicelog "Symlink: $1 -> $current_dir/$log_dest"
  ln -sf "$1" "$2"
}

REPO_DIR="$(git rev-parse --show-toplevel)"

nicelog "Managing $HOME"

(
  cd "$HOME" || exit 1
  create_symlink "$REPO_DIR/.gitconfig" .
  create_symlink "$REPO_DIR/.p10k.zsh" .
  create_symlink "$REPO_DIR/.tmux.conf" .
  create_symlink "$REPO_DIR/.vimrc" .
  create_symlink "$REPO_DIR/.zshrc" .
  create_symlink "$REPO_DIR/bin" .
)

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
nicelog "-----"
nicelog "Managing $ZSH_CUSTOM_DIR"

for f in "$REPO_DIR"/omz/custom/general/*; do
  name="general.$(basename "$f")"
  (
    cd "$ZSH_CUSTOM_DIR" || exit 1
    create_symlink "$f" "$name"
  )
done

# CachyOS Only
if [[ "$(uname -a)" = *cachyos* ]]; then
  nicelog "-----"
  nicelog "Installing CachyOS specific config"
  for f in "$REPO_DIR"/omz/custom/cachyos/*; do
    name="cachyos.$(basename "$f")"
    (
      cd "$ZSH_CUSTOM_DIR" || exit 1
      create_symlink "$f" "$name"
    )
  done
fi

ALL_REPOSITORY_DIR="$HOME/repositories"
ZSH_THEME_DIR="$HOME/.oh-my-zsh/custom/themes"
nicelog "-----"
nicelog "Managing $ZSH_THEME_DIR"

POWERLEVEL_DIR="$ALL_REPOSITORY_DIR/powerlevel10k"
if [[ ! -d "$POWERLEVEL_DIR" ]]; then
  nicelog "powerlevel10k not cloned. Cloning..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL_DIR"
fi

(
  cd "$ZSH_THEME_DIR" || exit 1
  create_symlink "$POWERLEVEL_DIR" .
)
