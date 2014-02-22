# create zones foler to hold our dns zones
HOSTNAME=`hostname`
if sudo mkdir /etc/bind/zones
then
	echo "Created /etc/bind/zones"
else
	echo "Error making zones dir .."
	exit 1
fi
# include rfc1918 zones
if sudo sed -i 's/\/\/include/include/g' /etc/bind/named.conf.local
then
	echo "rfc1918 zones included"
else
	echo "Error editing /etc/bind/named.conf.local"
	exit 1
fi
# create master zone and reverse lookup records
MASTER="\nzone \"kajohansen.com\" {\n\ttype master;\n\tfile \"/etc/bind/zones/kajohansen.com.db\";\n\tcheck-names ignore;\n};\n"
if sudo echo -e $MASTER | sudo tee -a /etc/bind/named.conf.local
then
	echo "Master zone record created"
else
	echo "Error creating master zone record ..."
	exit 1
fi
#get trailing ip number and reverse ip
ADDR=`ifconfig|xargs|awk '{print $7}'|sed -e "s/[a-z]*://g"`
echo "IP is : $ADDR" 
ADDR1=${ADDR#*.} ADDR2=${ADDR1#*.}
N1=${ADDR%.*.*.*} N2=${ADDR1%.*.*} N3=${ADDR2%.*} N4=${ADDR2#*.}
RADDR=$N4.$N3.$N2.$N1
echo "Reverse is : $RADDR"
NUM=`echo ${ADDR#*.*.*.}`
REVERSE="\nzone \"$N3.$N2.$N1.in-addr.arpa\" {\n\ttype master;\n\tfile \"/etc/bind/zones/$RADDR.in-addr.arpa\";\n};\n"
if sudo echo -e $REVERSE | sudo tee -a /etc/bind/named.conf.local
then
	echo "Reverse zone record created"
else
	echo "Error creating revers zone record ..."
	exit 1
fi
# create the master zone file
ZMASTER=";\n\$TTL 604800\n@ IN SOA $HOSTNAME.kajohansen.com. postmaster.kajohansen.com. (\n\t2 \t; Serial\n\t604800  \t; Refresh\n\t3600 \t; Retry\n\t604800 \t; Expire\n\t38400 ) ; Negative Cache TTL\n;\n@ \tIN \tNS \t$HOSTNAME.kajohansen.com.\n@ \tIN \tA \t$ADDR\n$HOSTNAME \tIN \tA \t$ADDR\n$HOSTNAME \tIN \tMX \t10 $HOSTNAME.kajohansen.com.\n\n_kerberos \tTXT \tKAJOHANSEN.COM\n\n_kerberos._tcp \t\tSRV 0 0 88  $HOSTNAME.kajohansen.com.\n_kerberos._udp \t\tSRV 0 0 88  $HOSTNAME.kajohansen.com.\n_ldap._tcp \t\tSRV 0 0 389 $HOSTNAME.kajohansen.com.\n_kpasswd._udp \t\tSRV 0 0 464 $HOSTNAME.kajohansen.com.\n_kerberos-adm._tcp \tSRV 0 0 749 $HOSTNAME.kajohansen.com.\n" 
if sudo touch /etc/bind/zones/kajohansen.com.db
then
	echo "Master zone file created"
	sudo echo -e $ZMASTER | sudo tee -a /etc/bind/zones/kajohansen.com.db
else
	echo "Error creating master zone file"
	exit 1
fi
# create the reverse zone file
ZREVERSE=";\n\$TTL 604800\n@ IN SOA $HOSTNAME.kajohansen.com. postmaster.kajohansen.com. (\n\t2  \t; Serial\n\t604800 \t; Refresh\n\t3600 \t; Retry\n\t604800 \t; Expire\n\t86400 ) ; Negative Cache TTL\n;\n@ \tIN NS \t$HOSTNAME.kajohansen.com.\n$NUM \tIN PTR \t$HOSTNAME.kajohansen.com.\n"
if sudo touch /etc/bind/zones/$RADDR.in-addr.arpa
then
	echo "Reverse zone file created"
	sudo echo -e $ZREVERSE | sudo tee -a /etc/bind/zones/$RADDR.in-addr.arpa
else
	echo "Error creating reverse zone file"
	exit 1
fi
# restart bind and check configuration
if sudo service bind9 restart
then
	nslookup $HOSTNAME.kajohansen.com
	nslookup $ADDR
	nslookup -q=srv _kerberos._tcp.kajohansen.com
else
	echo "Error Bind9 restart failed..."
fi
