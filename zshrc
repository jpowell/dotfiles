# ENV variables
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv
export EDITOR='vim'


# ZSH config
ZSH_THEME="geoffgarside"
DISABLE_AUTO_UPDATE="true"
plugins=(git ruby rbenv)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# INIT
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
