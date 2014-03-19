 install open ldap
# install open ldap
if sudo apt-get install slapd ldap-utils -y ; then
 echo "OpenLdap installed successfully"
else
 echo "OpenLdap install failed.."
 exit 1
fi
# install migrationtools
if sudo apt-get install migrationtools ; then
 echo "Migrationtools installed successfully"
else
 echo "Error: Migrationtools install failed.."
 exit 1
fi
# change hostname of migrationstools file
if sudo sed -i 's/padl.com/kajohansen.com/g' /usr/share/perl5/migrate_common.ph ; then
 if sudo sed -i 's/dc=padl/dc=kajohansen/g' /usr/share/perl5/migrate_common.ph ; then
   echo "migrate_common.ph edited successfully"
 else
   echo "Error: failed to change dc=padl in /usr/share/perl5/migrate_common.ph.."
 fi
else
 echo "Error: failed to upgrade /usr/share/perl5/migrate_common.ph.."
 exit 1
fi
# install phpldapadmin
if sudo apt-get install phpldapadmin ; then
 echo "phpldapadmin installed successfully"
 if sudo sed -i 's/dc=example/dc=kajohansen/g' /usr/share/phpldapadmin/config/config.php ; then
   echo "phpldapadmin config file edit success"
 else
   echo "Error editing /usr/share/phpldapadmin/config/config.php"
 fi
else
 echo "Error installing phpldapadmin"
 exit 1
fi
# Setup for replication
SLAPD='/var/lib/ldap/accesslog/ r,\n/var/lib/ldap/accesslog/** rwk,'
if sudo touch /etc/apparmor.d/local/usr.sbin.slapd ; then
 echo "/etc/apparmor.d/local/usr.sbin.slapd created"
 if sudo echo -e $SLAPD | sudo tee -a /etc/apparmor.d/local/usr.sbin.slapd ; then
   echo "apparmor slapd file wrote"
 else
   echo "apparmor file /etc/apparmor.d/local/usr.sbin.slapd write failed.."
   exit 1
 fi
else
 echo "Error creating apparmor file"
 exit 1
fi
if sudo -u openldap mkdir /var/lib/ldap/accesslog ; then
 echo "success creating /var/lib/ldap/accesslog"
 if sudo -u openldap cp /var/lib/ldap/DB_CONFIG /var/lib/ldap/accesslog ; then
   echo "Copied DB_CONFIG to /var/lib/ldap/accesslog"
 else
   echo "Error copying DB_CONFIG.."
   exit 1
 fi
else
 echo "Error creating /var/lib/ldap/accesslog"
 exit 1
fi

sudo service apparmor reload

# add replication to slapd
if curl -O https://dl.dropboxusercontent.com/s/9p8q64viku4mhuo/provider_sync.ldif ; then
 echo "provider sync download complete"
 if sudo ldapadd -Q -Y EXTERNAL -H ldapi:/// -f ./provider_sync.ldif ; then
   echo "SLAPD is now a replication provider"
 else
   echo "Error: ldapadd provider_sync.ldif failed.."
   exit 1
 fi
else
 echo "provider_sync.ldif download failed"
 exit 1
fi
