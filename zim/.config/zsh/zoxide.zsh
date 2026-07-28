# Initialize zoxide when it is installed.
if (( ${+commands[zoxide]} )); then
  eval "$(zoxide init zsh)"
fi
