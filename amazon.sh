# Amazon aws setup
if sudo apt-get install libmagickwand-dev php-pear php5-curl -y
then
	echo "php etc installed"
	# update pecl channel
	if sudo pecl channel-update pecl.php.net 
	then
		echo "Pecl channel-update success"
	else
		echo "Error Pecl channel-update failed"
		exit 1
	fi
	if sudo pear update-channels
	then
		echo "Pear update-channels success"
	else
		echo "Error Pear update-channels failed.."
		exit 1
	fi
  # update pear config
	if sudo pear config-set php_ini /etc/php5/apache2/php.ini 
	then
		echo "Pear config set success"
	else
		echo "Erro Pear config set failed..."
		exit 1
	fi
	if sudo pecl config-set php_ini /etc/php5/apache2/php.ini 
	then
		echo "Pecl config set success"
	else
		echo "Error Pecl config set failed.."
		exit 1
	fi
else
	echo "Error php etc install failed.."
	exit 1
fi
# install imagick
if sudo pecl install imagick
then
	echo "Pecl imagick install success"
else
	echo "Error installing Pecl imagick.."
	exit 1
fi
sudo service apache2 restart
# install php amazon webservices
if sudo pear channel-discover pear.symfony.com
then
	echo "Pear symfony channel discovered"
	if sudo pear install channel://pear.symfony.com/EventDispatcher
	then
		echo "EventDispatcher installed"
	else
		echo "Error installing EventDispatcher.."
		exit 1
	fi
else
	echo "Error discovering Pear symfony channel"
	exit 1
fi
# Guzzle
if sudo pear channel-discover guzzlephp.org/pear
then 
	echo "Pear Guzzle channel discovered"
	if sudo pear install channel://guzzlephp.org/pear/Guzzle
	then 
		echo "Guzzle channel installed successfully"
	else
		echo "Error installing Guzzle channel"
		exit 1
	fi
else
	echo "Error discovering Pear Guzzle channel"
	exit 1
fi
# Amazon webservices
if sudo pear channel-discover pear.amazonwebservices.com
then
	echo "Pear channel amazonwebservices discovered"
	if sudo pear install aws/sdk
	then
		echo "Pear aws/sdk install success"
	else
		echo "Error Pear aws/sdk install failed.."
		exit 1
	fi
else
	echo "Error discovering pear channel amazonwebservices.."
	exit 1
fi
