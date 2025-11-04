# General
export PATH="$PATH:$HOME/bin"
export REPOSITORY_DIR="$HOME/repositories"
export EDITOR="vim"

# GPG Git
export GPG_TTY=$(tty)

# Light setup validation
if [[ ! -d "$REPOSITORY_DIR" ]]; then
  # NOTE: This makes for a noisy p10k startup. That's fine because this is a problem
  nicelog "[WARNING] $REPOSITORY_DIR isn't an existing directory. It should be where all repositories are cloned."
fi
