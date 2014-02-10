#!/bin/bash
#
# AWS initial setup script
#

# change host to google dns
if sudo sed -i 's/127.0.0.1/8.8.8.8/g' /etc/resolv.conf
then
  cat /etc/resolv.conf
else
  echo "Error ..."
  exit 1
fi
# check to see that the hostname got updated
if grep '8.8.8.8' /etc/resolv.conf
then
  echo "Got google host"
else
  echo "error no host"
  exit 1
fi
# now update and upgrade system
if sudo apt-get update
then
	sudo apt-get upgrade -y
else
	echo "Error.."
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

