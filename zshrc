# ENV variables
export RBENV_ROOT=/opt/homebrew/opt/rbenv
export EDITOR='vim'

# ZSH config
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="geoffgarside"
DISABLE_AUTO_UPDATE="true"
plugins=(git ruby rbenv)
source $ZSH/oh-my-zsh.sh

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# direnv
eval "$(direnv hook zsh)"

# Custom Configs / Init
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/bin:.git/safe/../../bin:$PATH"

if [[ -d $HOME/custom_config ]]; then
  for f in $HOME/custom_config/*; do source $f; done
fi
