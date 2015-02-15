set -e

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update && brew upgrade && brew upgrade brew-cask && brew cleanup && brew cask cleanup

exit 0
