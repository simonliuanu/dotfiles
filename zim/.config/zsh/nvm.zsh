export NVM_DIR="${HOME}/.nvm"

case "$(uname -s)" in
  Linux)
    [[ -s "${NVM_DIR}/nvm.sh" ]] && source "${NVM_DIR}/nvm.sh"
    [[ -s "${NVM_DIR}/bash_completion" ]] &&
      source "${NVM_DIR}/bash_completion"
    ;;
  Darwin)
    NVM_HBREW="/opt/homebrew/opt/nvm"
    [[ -s "${NVM_HBREW}/nvm.sh" ]] && source "${NVM_HBREW}/nvm.sh"
    [[ -s "${NVM_HBREW}/etc/bash_completion.d/nvm" ]] &&
      source "${NVM_HBREW}/etc/bash_completion.d/nvm"
    unset NVM_HBREW
    ;;
esac
