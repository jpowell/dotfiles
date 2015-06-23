# ENV variables
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:$PATH"      # Homebrew
export RBENV_ROOT=/usr/local/var/rbenv
export EDITOR='vim'


# ZSH config
ZSH_THEME="geoffgarside"
DISABLE_AUTO_UPDATE="true"
plugins=(git ruby rbenv pow)

source $ZSH/oh-my-zsh.sh

for file in $HOME/custom_config/*; do
  source "$file"
done

# INIT
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=".git/safe/../../bin:$PATH"

# DOCKER
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/jpowell/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
