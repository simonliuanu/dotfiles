# Initialize fzf shell integration when fzf is installed.
if (( ${+commands[fzf]} )); then
  source <(fzf --zsh)
fi
