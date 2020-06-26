#!/bin/zsh

WEB_ROOT_PYTHON='/Library/WebServer/Documents/django/'

cd $WEB_ROOT_PYTHON

ls | while read line; do 
	cd $WEB_ROOT_PYTHON$line
	folders=$(eval 'ls')
	# echo $folders;
	if [ -d ".git" ] ; then
		echo $line;
	fi
done
# echo $folders