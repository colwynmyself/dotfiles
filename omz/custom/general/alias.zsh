mcd () {
  mkdir -p "$1"
  cd "$1"
}

cpfile () {
  if command -v pbcopy; then
    cat "$1" | pbcopy
  elif command -v xclip; then
    cat "$1" | xclip -o -sel clip
  else
    echo "No clipboard utility installed"
  fi
}
