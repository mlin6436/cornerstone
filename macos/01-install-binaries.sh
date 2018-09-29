binaries=(
  git
  mackup
  python
  sbt
  scala
  tmux
  tree
  typesafe-activator
  vim
)

dev_binaries=(
  activemq
  apache-spark
  awscli
  docker
  dotty
  elasticsearch
  ghc
  gradle
  jenv
  kotlin
  maven
  mongodb
  mysql
  openssl
  postgresql
  rust
  sbt
  scala
  subversion
  tomcat
  tree
  typesafe-activator
  vim
  yarn
)

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew..."
brew update && brew upgrade && brew cleanup

echo "Installing Oh My Zshell..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing core Mac OS utils..."
brew install coreutils
brew install findutils

echo "Installing binaries..."
brew install ${binaries[@]}

echo "Cleaning up..."
brew cleanup

exit 0
