#!/bin/zsh

WEB_ROOT_PYTHON='/Library/WebServer/Documents/django/'
python='/Developer/homebrew/Cellar/python/3.7.6_1/libexec/bin/python'

cd $WEB_ROOT_PYTHON"photos"

eval "nohup $python myBjoern.py &>/dev/null &"
