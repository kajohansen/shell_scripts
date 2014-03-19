#!/bin/bash
#
# AWS initial setup script
#

# change host to google dns and set hostname to computer hostname
HOSTNAME=`hostname`
USERNAME=`whoami`
sudo sed -i 's/127.0.0.1/8.8.8.8/g' /etc/resolv.conf
sudo sed -i "s/.*/$HOSTNAME/g" /etc/hostname

# check to see that the hostname got updated
if grep '8.8.8.8' /etc/resolv.conf && grep $HOSTNAME /etc/hostname
then
  echo "Got google host"
	echo "Hostname is set to:" && hostname
else
  echo "error no host or no hostname..."
  exit 1
fi

# now update and upgrade system
if sudo apt-get update
then
	sudo apt-get upgrade -y
else
	echo "Error.. updating system"
fi

# install dns-server
if sudo tasksel install dns-server
then
  echo "DNS server installed"
else
  echo "DNS server install failed.."
  exit 1
fi

# change host to localhost dns
if sudo sed -i 's/8.8.8.8/127.0.0.1/g' /etc/resolv.conf
then
  cat /etc/resolv.conf
  dig yr.no
else
  echo "Error ..."
  exit 1
fi

# install zsh
sudo apt-get install zsh

# add user superuser
if sudo useradd superuser ; then
	echo "Added user superuser"
	if sudo useradd superuser sudo ; then
		echo "Superuser added to sudo group"
	else
		echo "Error adding superuser to sudo group"
		exit 1
	fi
else
	echo "Error adding user superuser"
	exit 1
fi

# install git
if sudo apt-get install git -y
then
  echo "Git intstalled"
	git clone -b amazon https://github.com/karlandreas/my-zsh.git /home/$USERNAME/.my-zsh
	echo "my-zsh installed"
<<<<<<< HEAD
	mv my-zsh/zshrc ~/.zshrc
	echo "zshrc moved to home folder ."
	mv my-zsh ~/.my-zsh
	echo "my-zsh moved to .my-zsh"
	sudo chsh -s /bin/zsh $USERNAME
	echo "changed shell for user ubuntu to zsh"
=======
	mv /home/superuser/my-zsh/zshrc /home/superuser/.zshrc
	echo "zshrc moved to superuser home folder ."
	sudo chsh -s /bin/zsh superuser
	echo "changed shell for user superuser to zsh"
>>>>>>> a9e173d5320ae62179b18b57548efc2cf7b42572
else
	echo "Error installing git.."
	exit 1
fi

# done restart
echo "DONE restart is commented out"
#sudo shutdown -r now
