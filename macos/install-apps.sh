set -e

appdir="/Applications"
apps=(
  alfred
  android-file-transfer
  atom
  appcleaner
  caffeine
  droplr
  evernote
  firefox
  flux
  google-chrome
  google-web-designer
  intellij-idea
  iterm2
  mactex
  skype
  spotifree
  spotify
  the-unarchiver
  vagrant
  virtualbox
  vlc
)

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew..."
brew update && brew upgrade

echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

echo "Updateing cask..."
brew upgrade brew-cask

echo "Installing applications..."
brew cask install --appdir=$appdir ${apps[@]}

echo "Updating applications path for Alfred..."
brew cask alfred link

echo "Cleaning up..."
brew cleanup && brew cask cleanup

exit 0
