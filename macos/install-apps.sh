set -e

appdir="/Applications"
apps=(
  aerial
  appcleaner
  atom
  caffeine
  evernote
  firefox
  flux
  gitter
  google-chrome
  intellij-idea-ce
  java
  java7
  slack
  skype
  spotifree
  spotify
  the-unarchiver
  visual-studio-code
  vlc
)

devApps=(
  android-file-transfer
  android-studio
  charles
  google-web-designer
  intellij-idea-ce
  iterm2
  java7
  java
  textual
  vagrant
  virtualbox
  visual-studio-code
  wireshark
  xamarin-mdk
  xamarin-studio
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

echo "Updating cask..."
brew upgrade brew-cask

echo "Installing applications..."
brew cask install --appdir=$appdir ${apps[@]}

echo "Cleaning up..."
brew cleanup && brew cask cleanup

exit 0
