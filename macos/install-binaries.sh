binaries=(
  activemq
  awscli
  git
  jenv
  maven
  mongodb
  mysql
  postgresql
  python
  rust
  sbt
  scala
  subversion
  tomcat
  tree
  typesafe-activator
  vim
)

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew..."
brew update && brew upgrade

echo "Installing core Mac OS utils"
brew install coreutils
brew install findutils
brew install bash
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "Installing binaries..."
brew install ${binaries[@]}

echo "Cleaning up..."
brew cleanup

exit 0
