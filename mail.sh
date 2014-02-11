# install postfix mail server
if sudo tasksel install mail-server
then
	echo "Mail Server Installed"
else
	echo "Error Mail Server install failed.."
	exit 1
fi
if curl -O https://dl.dropboxusercontent.com/s/grqmfiizzdjnt55/main.cf
then
	echo "main.cf downloaded"
	sudo mv ./main.cf /etc/postfix/main.cf
else
	echo "Error main.cf download failed..."
	exit 1
fi
if curl -O https://dl.dropboxusercontent.com/s/yo3b77iuswsmtbg/master.cf
then
	echo "master.cf downloaded"
	sudo mv ./master.cf /etc/postfix/master.cf
else
	echo "Error master.cf download failed..."
	exit 1
fi
