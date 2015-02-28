whoami=$(whoami)
useremail="mlin6436@gmail.com"
username="Meng Lin"

declare -A binaries
binaries=(
	["chromium-browser"]="chromium-browser"
	["java"]="default-jdk"
	["java"]="default-jre"
	["emacs"]="emacs"
	["mount.exfat-fuse"]="exfat-fuse"
	["dumpexfat"]="exfat-utils"
	["git"]="git"
	["mvn"]="maven"
	["npm"]="npm"
	["tree"]="tree"
	["vagrant"]="vagrant"
	["vim"]="vim"
	["virtualbox"]="virtualbox"
	["vlc"]="vlc"
)

node_version="stable"

declare -A nodes
nodes=(
	["bower"]="bower"
	["grunt"]="grunt-cli"
	["mean"]="meanio"
	["yo"]="yo"
)

ruby_version="ruby-2.2.0"

##############################
# binaries
##############################

echo "Updating apt-get..."
sudo apt-get update && sudo apt-get upgrade

for binary in "${!binaries[@]}"
do
	if [ -z "$(which $binary)" ]; then
		echo "Installing ${binaries[$binary]}..."
		sudo apt-get install ${binaries[$binary]} -y
		echo "Finished installing ${binaries[$binary]}..."
	else
		echo "${binaries[$binary]} already exists."
	fi
done

##############################
# mongodb
##############################

if [ -z "$(which mongo)" ]; then
	echo "Adding mongodb public key..."
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
	echo "Adding mongodb repository..."
	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
	echo "Installing mongodb..."
	sudo apt-get update
	sudo apt-get install mongodb-org -y
	echo "Finished installing mongodb..."
else
	echo "mongodb already exists."
fi

##############################
# node packages
##############################

if [ -z "$(which n)" ]; then
	echo "Installing n..."
	sudo npm install -g n
	echo "Finished installing n..."
else
	echo "n already exists."
fi

echo "Configuring node to use $node_version..."
sudo n $node_version

for node in "${!nodes[@]}"
do
	if [ -z "$(which $node)" ]; then
		echo "Installing ${nodes[$node]}..."
		sudo npm install -g ${nodes[$node]}
		echo "Finished installing ${nodes[$node]}..."
	else
		echo "${nodes[$node]} already exists."
	fi
done

##############################
# rvm
##############################

if [ -z "$(which rvm)" ]; then
	echo "Installing rvm..."
	curl -sSL https://get.rvm.io | bash -s $1
	echo "Finished installing rvm..."
else
	echo "rvm already exists."
fi

##############################
# ruby
##############################

echo "Configuring rvm in /home/$whoami/.rvm/scripts/rvm..."
source /home/$whoami/.rvm/scripts/rvm &>/dev/null

if [ -z "$(rvm list | grep $ruby_version)" ]; then
	echo "Installing $ruby_version..."
	rvm install $ruby_version
	echo "Finished installing $ruby_version..."
fi

echo "Configuring ruby to use $ruby_version..."
rvm --default use $ruby_version

##############################
# atom
##############################

if [ -z "$(which atom)" ]; then
	echo "Adding atom repository..."
	sudo add-apt-repository ppa:webupd8team/atom -y
	sudo apt-get update
	echo "Installing atom..."
	sudo apt-get install atom -y
	echo "Finished installing atom..."
else
	echo "atom already exists."
fi

##############################
# natural scrolling
##############################

if [ -z "$(which naturalscrolling)" ]; then
	echo "Adding natural scrolling repository..."
	sudo add-apt-repository ppa:zedtux/naturalscrolling -y
	sudo apt-get update
	echo "Installing natural scrolling..."
	sudo apt-get install naturalscrolling -y
	echo "Finished installing naturalscrolling..."
else
	echo "natural scrolling already exists."
fi

if [ -z "$(which fluxgui)" ]; then
	echo "Adding fluxgui repository..."
	sudo add-apt-repository ppa:kilian/f.lux -y
	sudo apt-get update
	echo "Installing fluxgui..."
	sudo apt-get install fluxgui -y
	echo "Finished installing fluxgui..."
else
	echo "fluxgui already exists."
fi

##############################
# spotify
##############################

if [ -z "$(sudo grep "spotify" /etc/apt/sources.list)" ]; then
	echo "Adding spotify repository..."
	sudo /bin/sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list'
	echo "Adding spotify public key..."
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
else
	echo "spotify repository already exists."
fi

if [ -z "$(which spotify)" ]; then
	echo "Installing spotify..."
	sudo apt-get update
	sudo apt-get install spotify-client -y
	echo "Finished installing spotify..."
else
	echo "spotify already exists."
fi

##############################
# disable guest access
##############################

if [ -z "$(sudo grep "allow-guest" /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf)" ]; then
	echo "Disabling guest access..."
	sudo /bin/sh -c 'echo "allow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf'
	echo "Finished disabling guest access..."
else
	echo "Guest access already disabled."
fi

##############################
# git configuration
##############################

git config --global user.email "$useremail"
git config --global user.name "$username"

echo "[WARNING] Please restart the terminal to see all changes take effect!"

exit 0
