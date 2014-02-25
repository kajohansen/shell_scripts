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
