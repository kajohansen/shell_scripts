# install postfix mail server
if sudo tasksel install mail-server ; then
 echo "Mail Server Installed"
else
 echo "Error Mail Server install failed.."
 exit 1
fi
if curl -O https://dl.dropboxusercontent.com/s/p6vtfrn6nu5ztbp/main.cf ; then
 echo "main.cf downloaded"
 sudo mv ./main.cf /etc/postfix/main.cf
else
 echo "Error main.cf download failed..."
 exit 1
fi
if curl -O https://dl.dropboxusercontent.com/s/szv47ckznzpr4l2/master.cf ; then
 echo "master.cf downloaded"
 sudo mv ./master.cf /etc/postfix/master.cf
else
 echo "Error master.cf download failed..."
 exit 1
fi
# install and configure SASL
if sudo apt-get install sasl2-bin -y ; then
 echo "SASL installed successfully"
 if sudo sed -i 's/START=no/START=yes/g' /etc/default/saslauthd ; then
   echo "/etc/default/saslauthd updated"
 else
   echo "Error /etc/default/saslauthd failed to set START=yes"
 fi
else
 echo "Error installing SASL.."
 exit 1
fi
# Set sasl passwords for user
USERNAME=`whoami`
DOMAINNAME=`hostname --fqdn`
DOMAIN=${DOMAINNAME#*\.}
echo "Setting SASL mail passwords for $USERNAME on $DOMAINNAME"
if sudo saslpasswd2 -c -u $DOMAINNAME -a smtpauth $USERNAME ; then
 echo "Success setting smtpauth SASL for $USERNAME"
 echo "Setting SASL mail passwords for $USERNAME on $DOMAIN"
 if sudo saslpasswd2 -c -u $DOMAIN -a smtpauth $USERNAME ; then
   echo "Success setting smtpauth SASL for $USERNAME"
 else
   echo "Error setting smtpauth SASL for $USERNAME.."
   exit 1
 fi
else
 echo "Error setting smtpauth SASL for $USERNAME.."
 exit 1
fi
sudo sasldblistusers2
# add postfix to sasl group
if sudo adduser postfix sasl ; then
 if sudo chown -R postfix /var/run/saslauthd ; then
   echo "postfix added to SASL group and /var/run/saslauthd chown to postfix"
 else
   echo "Failed adding postfix to sasl group and /var/run/saslauthd chown failed"
   exit 1
 fi
fi
# create /etc/postfix/sasl/smtpd.conf
SMTPD='pwcheck_method:saslauthd\n'
if sudo touch /etc/postfix/sasl/smtpd.conf ; then
 if sudo echo -e $SMTPD | sudo tee -a /etc/postfix/sasl/smtpd.conf ; then
   echo "Created and wrote /etc/postfix/sasl/smtpd.conf"
 else
   echo "Error writing /etc/postfix/sasl/smtpd.conf"
 fi
fi
# setup Dovecot
echo "TODO setup dovecot"

## Restart postfix
#sudo service postfix restart
## Restart sasl

