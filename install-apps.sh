set -e

appdir="/Applications"
apps=(
  alfred
  android-file-transfer
  atom
  appcleaner
  caffeine
  evernote
  firefox
  google-chrome
  google-web-designer
  intellij-idea
  memorytamer
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

echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

echo "Installing applications..."
brew cask install --appdir=$appdir ${apps[@]}

echo "Updating applications path for Alfred..."
brew cask alfred link

echo "Cleaning up..."
brew cleanup

exit 0
