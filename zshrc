# ENV variables
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:$PATH"      # Homebrew
export RBENV_ROOT=/usr/local/var/rbenv
export EDITOR='vim'


# ZSH config
ZSH_THEME="geoffgarside"
plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
  yarn
  npm
  node
)

source $ZSH/oh-my-zsh.sh

# INIT
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=".git/safe/../../bin:$PATH"
eval "$(direnv hook zsh)"
