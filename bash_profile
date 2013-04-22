# Grep options
export GREP_OPTIONS='--color=auto'

# For rbenv through Homebrew.
export RBENV_ROOT=/usr/local/opt/rbenv

# For rbenv.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# For nvm
[[ -s /Users/jpowell/.nvm/nvm.sh ]] && . /Users/jpowell/.nvm/nvm.sh

# For nginx.
export PATH="/usr/local/sbin:$PATH"

# For Homebrew.
export PATH="/usr/local/bin:$PATH"

# For ~/bin
export PATH="$HOME/bin:$PATH"

# Prompt
FONT_BOLD='\[\e[1m\]'
COLOR_ORANGE='\[\e[0;33m\]'
COLOR_RED='\[\e[0;31m\]'
COLOR_WHITE='\[\e[0;37m\]'
COLOR_RESET='\[\e[0m\]'

export PS1="\
$FONT_BOLD\$(date +%H:%M) \
$COLOR_ORANGE\u \
$COLOR_WHITE\w \
$COLOR_RED\$(parse_git_branch) \
$COLOR_RESET\n$ "

unset FONT_BOLD COLOR_ORANGE COLOR_RED COLOR_WHITE COLOR_WHITE

# aliases
alias org='cd ~/code/orgsync/orgsync'
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias clear_flash='rm -rf ~/Library/Preferences/Macromedia/Flash\ Player/#SharedObjects/*/*;chmod 0500 ~/Library/Preferences/Macromedia/Flash\ Player/#SharedObjects/*;rm -rf ~/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys/*;chmod 0500 ~/Library/Preferences/Macromedia/Flash\ Player/macromedia.com/support/flashplayer/sys'

# update MAC locate index
alias update_locate='sudo /usr/libexec/locate.updatedb'

# finder aliases
alias hidden_on='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidden_off='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Functions
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\[\1\]/'
}
gup() {
 echo "updating to latest blessed"
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
