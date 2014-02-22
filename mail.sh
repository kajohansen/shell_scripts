# install postfix mail server
if sudo tasksel install mail-server
then
	echo "Mail Server Installed"
else
	echo "Error Mail Server install failed.."
	exit 1
fi
if curl -O https://dl.dropboxusercontent.com/s/p6vtfrn6nu5ztbp/main.cf
then
	echo "main.cf downloaded"
	sudo mv ./main.cf /etc/postfix/main.cf
else
	echo "Error main.cf download failed..."
	exit 1
fi
if curl -O https://dl.dropboxusercontent.com/s/szv47ckznzpr4l2/master.cf
then
	echo "master.cf downloaded"
	sudo mv ./master.cf /etc/postfix/master.cf
else
	echo "Error master.cf download failed..."
	exit 1
fi
