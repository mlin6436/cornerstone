binaries=(
  activemq
  awscli
  elasticsearch
  ghc
  git
  mackup
  mongodb
  mysql
  openssl
  postgresql
  python
  rust
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
brew update && brew upgrade

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
