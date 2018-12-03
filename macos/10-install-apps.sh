set -e

appdir="/Applications"
apps=(
  atom
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
  whatsapp
)

devApps=(
  dbeaver-community
  docker
  filezilla
  gitter
  google-web-designer
  intellij-idea-ce
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

echo "Installing applications..."
brew cask install --appdir=$appdir ${apps[@]}

echo "Cleaning up..."
brew cleanup

exit 0
