set -e

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing node..."
brew install node

echo "Cleaning up..."
brew cleanup

echo "Cleaning node npm cache..."
npm cache clean -f

echo "Installing node stable version..."
npm install -g n
n stable

echo "Installing node packages..."
npm install -g grunt-cli
npm install -g bower
npm install -g yo
npm install -g mean-cli
curl https://install.meteor.com/ | sh

exit 0
