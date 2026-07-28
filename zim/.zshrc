# User configuration sourced by interactive Zsh shells.

#
# History
#

# Remove older commands from history when a duplicate is added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input
#

# Use Emacs-style key bindings.
bindkey -e

# Remove the path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

#
# Zim module configuration
#

# zsh-autosuggestions is the final autosuggestion module in .zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Configure syntax highlighting.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

#
# Initialize Zim
#

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Download zimfw when it is not installed yet.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o "${ZIM_HOME}/zimfw.zsh" \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  elif (( ${+commands[wget]} )); then
    mkdir -p "${ZIM_HOME}"
    wget -nv -O "${ZIM_HOME}/zimfw.zsh" \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    print -u2 "Zim cannot be installed: curl or wget is required."
    return 1
  fi
fi

# Install missing modules and regenerate init.zsh when .zimrc changes.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source "${ZIM_HOME}/zimfw.zsh" init
fi

source "${ZIM_HOME}/init.zsh"

#
# Local configuration modules
#

ZSH_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh"

for config_file in fzf nvm export zoxide aliases; do
  [[ -r "${ZSH_CONFIG_HOME}/${config_file}.zsh" ]] &&
    source "${ZSH_CONFIG_HOME}/${config_file}.zsh"
done

unset config_file ZSH_CONFIG_HOME

#
# Optional tools
#

if [[ -d "${HOME}/.grok/bin" ]]; then
  export PATH="${HOME}/.grok/bin:${PATH}"
fi

if [[ -d "${HOME}/.grok/completions/zsh" ]]; then
  fpath=("${HOME}/.grok/completions/zsh" $fpath)
  autoload -Uz compinit
  compinit -C
fi
