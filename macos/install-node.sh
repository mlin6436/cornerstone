set -e

packages=(
  bower
  grunt-cli
  gulp
  yo
)

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if test ! $(which node); then
  echo "Installing node..."
  brew install node
fi

echo "Cleaning node npm cache..."
npm cache clean -f

if test ! $(which n); then
  echo "Installing n..."
  npm install -g n
  echo "Configuring n to use stable version..."
  n stable
fi

echo "Installing node packages..."
npm install -g ${apps[@]}

exit 0
