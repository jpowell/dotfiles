# Grep options
export GREP_OPTIONS='--color=auto'

# For nginx.
export PATH="/usr/local/sbin:$PATH"

# For Homebrew.
export PATH="/usr/local/bin:$PATH"

# For ~/bin
export PATH="$HOME/bin:$PATH"

# For SBT
export SBT_OPTS="-XX:PermSize=256M -XX:MaxPermSize=512M"

# Prompt
FONT_BOLD='\[\e[1m\]'
COLOR_ORANGE='\[\e[0;33m\]'
COLOR_BLUE='\[\e[0;34m\]'
COLOR_WHITE='\[\e[0;37m\]'
COLOR_RESET='\[\e[0m\]'

export PS1="\
$FONT_BOLD\$(date +%H:%M) \
$COLOR_ORANGE\u \
$COLOR_WHITE\w \
$COLOR_BLUE\$(parse_git_branch) \
$COLOR_RESET\n$ "

unset FONT_BOLD COLOR_ORANGE COLOR_RED COLOR_WHITE COLOR_WHITE

export RUBY_GC_MALLOC_LIMIT=50000000
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_HEAP_SLOTS_INCREMENT=250000

# aliases
alias org='cd ~/code/orgsync/orgsync'
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias clear_flash='rm -rf ~/Library/Preferences/Macromedia/Flash\ Player/#SharedObjects/*/*;chmod 0500 ~/Library/Preferences/Macromedia/Flash\ Player/#SharedObjects/*;rm -rf ~/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys/*;chmod 0500 ~/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys'
alias be='bundle exec'

# update MAC locate index
alias update_locate='sudo /usr/libexec/locate.updatedb'

# finder aliases
alias hidden_on='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidden_off='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Functions
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
gup() {
 echo "updating to latest master"
 git fetch origin
 git rebase -p origin/master
}
gr() {
  echo "rebasing to origin/$1"
  git fetch origin
  git rebase -p origin/$1
}
gfm() {
 echo "fetching and merging $1/$2"
 git fetch $1
 git merge $1/$2
}
gpr() {
 echo "sweet, a pull request! $1/$2"
 git fetch $1
 git checkout -b $2 $1/$2
}
gcbr() {
 git checkout -b $1
 git push --set-upstream origin $1
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# Watermark Docker Config
export WATERMARK_APP_ROOT=~/projects/watermark
export WATERMARK_DOCKER_ENV=1
export WATERMARK_DEV_ENV_DOMAIN=".wcc"

# For rbenv through Homebrew.
export RBENV_ROOT=/usr/local/var/rbenv

# For rbenv.
eval "$(rbenv init -)"
