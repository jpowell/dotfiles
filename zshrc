# ENV variables
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:$PATH"      # Homebrew
export RBENV_ROOT=/usr/local/var/rbenv
export EDITOR='vim'


# ZSH config
ZSH_THEME="geoffgarside"
DISABLE_AUTO_UPDATE="true"
plugins=(git ruby rbenv)

source $ZSH/oh-my-zsh.sh

# INIT
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$HOME/bin:.git/safe/../../bin:$PATH"
eval "$(direnv hook zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
