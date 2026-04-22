# General
export PATH="$PATH:$HOME/bin"
export REPOSITORY_DIR="$HOME/repositories"
export EDITOR="vim"

# Various tracking
export GH_TELEMETRY=false
export DO_NOT_TRACK=1
export NEXT_TELEMETRY_DISABLED=1
export SAM_CLI_TELEMETRY=0
export CDK_DISABLE_CLI_TELEMETRY=true

# GPG Git
export GPG_TTY=$(tty)

# Light setup validation
if [[ ! -d "$REPOSITORY_DIR" ]]; then
  # NOTE: This makes for a noisy p10k startup. That's fine because this is a problem
  nicelog "[WARNING] $REPOSITORY_DIR isn't an existing directory. It should be where all repositories are cloned."
fi
