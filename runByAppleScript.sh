#!/bin/sh

# list Mac wake reason
say "Lister grunn til oppvåkining"
echo "\nMac Wake reasons:\n"
syslog |grep -i "Wake reason"

# list users who is currently logged in
echo "\nCurrently logged in users:\n"
say "Lister hvem som er logget inn"
who
