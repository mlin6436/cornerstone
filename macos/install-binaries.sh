binaries=(
  activemq
  cassandra
  dart
  docker
  emacs
  flow
  git
  go
  gradle
  iojs
  jenv
  maven
  maven32
  mysql
  mongodb
  neo4j
  phantomjs
  python
  postgresql
  redis
  rust
  sbt
  scala
  sqlite
  stunnel
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
