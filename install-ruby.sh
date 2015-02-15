if test ! $(which ruby); then
    echo "Installing RVM..."
    \curl -sSL https://get.rvm.io | bash -s stable --rails
fi

echo "Configuring RVM..."
source ~/.rvm/scripts/rvm

echo "Installing Ruby head version..."
rvm install ruby-head

echo "Configuring Ruby head as default..."
rvm use ruby-head

exit 0
