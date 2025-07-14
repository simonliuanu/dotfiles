export NVM_DIR="$HOME/.nvm"

case "$(uname -s)" in
  Linux)
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    ;;
  Darwin)
    NVM_HBREW="/opt/homebrew/opt/nvm"
    [ -s "$NVM_HBREW/nvm.sh" ] && . "$NVM_HBREW/nvm.sh"
    [ -s "$NVM_HBREW/etc/bash_completion.d/nvm" ] && \
      . "$NVM_HBREW/etc/bash_completion.d/nvm"
    ;;
esac
