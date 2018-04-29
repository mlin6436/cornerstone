set -e

appdir="/Applications"
apps=(
  aerial
  android-file-transfer
  appcleaner
  caffeine
  dropbox
  firefox
  flux
  google-chrome
  spotifree
  spotify
  the-unarchiver
  vitalsource-bookshelf
  vlc
)

devApps=(
  atom
  docker
  filezilla
  gitter
  google-web-designer
  intellij-idea-ce
  java
  mattermost
  postman
  slack
  vagrant
  virtualbox
  visual-studio-code
  wireshark
  xquartz
)

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew..."
brew update && brew upgrade

echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

echo "Tapping brew cask for alternative versions of Casks..."
brew tap caskroom/versions

echo "Updating cask..."
brew upgrade brew-cask

echo "Installing applications..."
brew cask install --appdir=$appdir ${apps[@]}

echo "Cleaning up..."
brew cleanup && brew cask cleanup

exit 0
