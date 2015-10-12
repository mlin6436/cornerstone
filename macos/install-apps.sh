set -e

appdir="/Applications"
apps=(
  atom
  appcleaner
  caffeine
  evernote
  firefox
  flux
  google-chrome
  slack
  skype
  spotifree
  spotify
  the-unarchiver
  vlc
)

devApps=(
  android-file-transfer
  android-studio
  google-web-designer
  intellij-idea
  iterm2
  java7
  java
  mactex
  mysqlworkbench
  textual
  vagrant
  virtualbox
  visual-studio-code
  vmware-fusion
  wireshark
  xamarin-mdk
  xamarin-studio
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

echo "Cleaning up..."
brew cleanup && brew cask cleanup

exit 0
