#
# create publickey for logging in to this system
#


# Check if we are on Mac or Linux
if [ -d "/Users" ] ; then
	echo "Mac Users directory exists"
	DIR='Users'
elif [ -d "/home" ] ; then
	echo "Linux  /home directory exists"
	DIR='home'
else
	echo "Neither home or Users directory where found"
	exit 1
fi

# Get username and hostname, then create key and publickey
if HOSTNAME=`hostname` && USERNAME=`whoami` && mkdir /home/$USERNAME/.ssh 
then
  echo "Got hostname $HOSTNAME"
  echo "Got username $USERNAME"
<<<<<<< HEAD
  echo "/home/$USERNAME/.ssh directory created"
  if ssh-keygen -q -t rsa -b 4096 -C "Key for $USERNAME on $HOSTNAME" -f "/home/$USERNAME/.ssh/$USERNAME-$HOSTNAME"
  then
    echo "/home/$USERNAME/.ssh/superuser-$HOSTNAME created successfuly"
=======
  echo "/$DIR/$USERNAME/.ssh directory created"
  if ssh-keygen -q -t rsa -b 4096 -C "Key for $USERNAME on $HOSTNAME" -f "/home/$USERNAME/.ssh/$USERNAME-$HOSTNAME"
  then
    echo "/$DIR/$USERNAME/.ssh/superuser-$HOSTNAME created successfuly"
>>>>>>> a9e173d5320ae62179b18b57548efc2cf7b42572
  else
   echo "Error creating /home/$USERNAME/.ssh/superuser-$HOSTNAME"
  fi
else
  echo "Error /$DIR/$USERNAME/.ssh directory not created"
  exit 1
fi

# add key to authorized_keys file
if cat /$DIR/$USERNAME/.ssh/$USERNAME-$HOSTNAME.pub  >> /home/$USERNAME/.ssh/authorized_keys
then
  echo ".ssh authorized_keys file created"
else
  echo "Error moving key to authorized_keys file"
fi
